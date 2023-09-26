from django.contrib import admin
from .models import *
# Register your models here.

class CustomerAdmin(admin.ModelAdmin):
    list_display = ('username','email','tell')
admin.site.register(Customer, CustomerAdmin)

class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('emp','tel')
admin.site.register(Employee,EmployeeAdmin)

admin.site.register(Detailemp)

class FixerAdmin(admin.ModelAdmin):
    list_display = ('idctm','ndevice','date','process','fixerdate')
admin.site.register(Fixer,FixerAdmin)

admin.site.register(TypeProduct)
admin.site.register(Payment)
admin.site.register(PaymentStatus)

class FixAdmin(admin.ModelAdmin):
    list_display = ('idcustomer','fdate','typepd','product','product_price','used_equipment_not_exhausted','equipment_price','fprice','fspay')
admin.site.register(Fix,FixAdmin)

class SupplierAdmin(admin.ModelAdmin):
    list_display = ('name_market','address','tel')
admin.site.register(Supplier,SupplierAdmin)

class ProductAdmin(admin.ModelAdmin):
    list_display = ('nproduct','quantity','selling_price','date')
admin.site.register(Product,ProductAdmin)


class DetailOrderProductToStoreAdmin(admin.ModelAdmin):
    list_display = ('order_product','name_product','order_quantity','unit_price','total_price')
admin.site.register(DetailOrderProductToStore,DetailOrderProductToStoreAdmin)

class OrderProductToStoreAdmin(admin.ModelAdmin):
    list_display = ('name_market','id_emp','order_date','total_price')
admin.site.register(OrderProductToStore,OrderProductToStoreAdmin)

class MessageAdmin(admin.ModelAdmin):
    list_display = ('idcus','time','msg','reply')
admin.site.register(Message,MessageAdmin)

admin.site.register(CustomerOrder)