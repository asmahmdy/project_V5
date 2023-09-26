from collections.abc import Iterable
import datetime
from django.db import models
from django.contrib.auth.models import User
from django.http import HttpResponse
from django.db.models import Sum

# Create your models here.

class Customer(models.Model):
    # idvalue = models.CharField(max_length=100)
    username = models.CharField(max_length=100,null=True)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100,null=True)
    lastname = models.CharField(max_length=100,null=True)
    tell = models.CharField(max_length=100,null=True)
    address = models.CharField(max_length=500,null=True)

    def __str__(self):
        return str(self.id)

class Employee(models.Model):
    emp = models.OneToOneField(User,on_delete=models.CASCADE)
    emp_name = models.CharField(max_length=100)
    emp_lname = models.CharField(max_length=100)
    tel = models.CharField(max_length=100)

    def __str__(self):
        return str(self.emp.username)
    
class Detailemp(models.Model):
    idemployee = models.ForeignKey(Employee,on_delete=models.CASCADE)
    salary = models.IntegerField(null=True)
    drawamount = models.IntegerField(null=True,blank=True)
    drawdate =  models.DateField(default=datetime.date.today)

    def __str__(self):
        return str(self.idemployee)
    

class Fixer(models.Model):
    idctm = models.ForeignKey(Customer,on_delete=models.CASCADE,null=True)
    ndevice = models.CharField(max_length=100,blank=True, null=True)
    brand = models.CharField(max_length=100,blank=True, null=True)
    problem = models.CharField(max_length=100,blank=True, null=True)
    date = models.CharField(max_length=200,blank=True,null=True)
    time = models.CharField(max_length=100,blank=True, null=True)
    detail = models.CharField(max_length=100,blank=True, null=True)
    process = models.CharField(max_length=100,default='ทางร้านรับทราบการแจ้งซ่อมของลูกค้าแล้ว')
    fixerdate = models.DateField(default=datetime.date.today)

    def __str__(self):
        return self.ndevice
    
class PaymentStatus(models.Model):
    spay = models.CharField(max_length=200)

    def __str__(self):
        return self.spay
    
class TypeProduct(models.Model):
    type = models.CharField(max_length=200)

    def __str__(self):
        return self.type

class Fix(models.Model):
    idcustomer = models.ForeignKey(Customer,on_delete=models.CASCADE,null=True)
    idfixer = models.ForeignKey(Fixer,on_delete=models.CASCADE,null=True)
    idemp = models.ForeignKey(Employee,on_delete=models.CASCADE)
    fdate = models.DateField(default=datetime.date.today)
    typepd = models.ForeignKey(TypeProduct,on_delete=models.CASCADE,null=True)
    product = models.CharField(max_length=500,null=True)
    product_price = models.IntegerField(null=True,default=0)
    used_equipment_not_exhausted = models.TextField(max_length=1000,null=True)
    equipment_used_up = models.TextField(max_length=1000,null=True)
    equipment_price = models.IntegerField(null=True,default=0)
    emp_price = models.IntegerField(null=True,default=0) 
    fprice = models.IntegerField(null=True,default=0)
    fspay = models.ForeignKey(PaymentStatus,on_delete=models.CASCADE,null=True,blank=True)

    def save(self,*args,**kwargs):
        self.fprice = self.product_price + self.equipment_price + self.emp_price
        super (Fix,self).save(*args,**kwargs)
    

    def __str__(self):
        return f"{self.idcustomer.username} - {self.fdate} - {self.fspay}"
    
class Supplier(models.Model):
    name_market = models.CharField(max_length=300)
    address = models.CharField(max_length=500)
    tel = models.CharField(max_length=200)

    def __str__(self):
        return self.name_market
    
class Product(models.Model):
    nproduct = models.CharField(max_length=100)
    date = models.DateField(default=datetime.date.today)
    image = models.ImageField(upload_to="products")
    quantity = models.IntegerField(null=True)
    selling_price = models.IntegerField(null=True)
    description = models.CharField(max_length=500)

    def __str__(self):
        return self.nproduct
    
class OrderProductToStore(models.Model):
    name_market = models.ForeignKey(Supplier,on_delete=models.CASCADE,null=True)
    id_emp = models.ForeignKey(Employee,on_delete=models.CASCADE,null=True)
    order_date = models.DateField(default=datetime.date.today)
    total_price = models.IntegerField(null=True,default=0)

    def __str__(self):
        return str(self.id)
    
class DetailOrderProductToStore(models.Model):
    order_product = models.ForeignKey(OrderProductToStore,on_delete=models.CASCADE,null=True)
    name_product = models.ForeignKey(Product,on_delete=models.CASCADE,null=True)
    order_quantity = models.IntegerField(null=True,default=0)
    unit_price = models.IntegerField(null=True)
    total_price =models.IntegerField(null=True,default=0)

    def save(self,*args,**kwargs,):
        self.order_product.total_price = DetailOrderProductToStore.objects.aggregate(Sum('total_price'))['total_price__sum']
        self.order_product.save()
        super (DetailOrderProductToStore,self).save(*args,**kwargs)

    
    def save(self,*args,**kwargs,):
        self.total_price = self.unit_price * self.order_quantity
        super (DetailOrderProductToStore,self).save(*args,**kwargs)
    def view(request):
        absolute_uri = request.build_absolute_uri('/get-ordertostore/4')
        return HttpResponse(absolute_uri)
        
    # def save(self,*args,**kwargs):
    #     total = sum(self.)
    #     self.order_product.total_price = 
    #     super (DetailOrderProductToStore,self).save(*args,**kwargs)
    

    def __str__(self):
        return f"{str(self.order_product)} - {str(self.order_quantity)} - {str(self.unit_price)} "
    
# class Order(models.Model):
#     user = models.ForeignKey(User,on_delete=models.CASCADE) 
#     total_price = models.FloatField(null=True)

#     def __str__(self):
#         return self.total_price
    
class CustomerOrder(models.Model):
    idproduct = models.ForeignKey(Product,on_delete=models.CASCADE)
    amount = models.IntegerField(null=True)
    sum_price = models.IntegerField(null=True,default=0)
    date = models.DateField(default=datetime.date.today)
    

    def __str__(self):
        return self.id
    
class Payment(models.Model):                                            
    idfix = models.ForeignKey(Fix,on_delete=models.CASCADE)
    imgslip = models.ImageField(upload_to='slip_img/',blank=True)

    def __str__(self):
        return str(self.idfix)

class Message(models.Model):
    idcus = models.ForeignKey(Customer,on_delete=models.CASCADE)
    time = models.DateField(default=datetime.date.today,null=True)
    msg = models.CharField(max_length=1000)
    reply = models.CharField(max_length=1000,null=True,blank=True)

    def __str__(self):
        return self.msg