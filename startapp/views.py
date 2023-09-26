from rest_framework.decorators import api_view
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.viewsets import ModelViewSet,GenericViewSet
from rest_framework import status
from rest_framework import viewsets
from .models import *
from .serializers import *
# Create your views here.

@api_view(['POST'])
def post_register(request):
    if request.method == 'POST':
        serializers = CustomerSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data,status=status.HTTP_201_CREATED)
        return Response(serializers.errors,status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def post_login(request):
    if request.method == 'POST':
        data=request.data.copy()
        print (data)
        email = data.get('email')
        password = data.get('password')
        check = Customer.objects.filter(email=email)
        print (check.values())
        print (check.values()[0]["id"])
    

        if check != 0:
             if password == check.values()[0]["password"]:
                  dt = {'status': 'Successful','id':check.values()[0]["id"]}
                  print(dt)
                  return Response(data=dt,status=status.HTTP_200_OK)
             else:
                  dt = {'status': 'Unsuccess','id':check.values()[0]["id"]}
                  print(dt)
                  return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(status=status.HTTP_404_NOT_FOUND)
   

@api_view(['GET'])
def get_profile(request,id):
    try:
            get_id = Customer.objects.filter(id=id)
            get_cus = Customer.objects.all()
            data=[]
            serializer = CustomerSerializer(get_id,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def post_fixer(request):
    if request.method == 'POST':
        serializer = FixerSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    
@api_view(['GET'])
def get_fixer(request,id):
    try:
            get_id = Fixer.objects.filter(id=id)
            get_fixer = Fixer.objects.all()
            data=[]
            serializer = FixerSerializer(get_id,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['GET'])
def get_hisfix(request,id):
    try:
            get_idhis = Fixer.objects.filter(idctm_id=id)
            get_hisfix = Fixer.objects.all()
            data=[]
            serializer = FixerSerializer(get_idhis,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def update_fix(request,fid):
    get_idfix = Fixer.objects.get(id=fid)
    if request.method == 'PUT':
        data = {}
        serializer = FixerSerializer(get_idfix,data = request.data)
        if serializer.is_valid():
            serializer.save()
            data['status']='updated'
            return Response(data =data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def upload_slip(request):

    if request.method == 'POST':

        serializer = PaymentSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
        
@api_view(['GET'])
def get_Product(request):
    try:
         
            all_product = Product.objects.all()
            data=[]
            serializer = ProductSerializer(all_product,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def get_status(request,id):
    try:
            get_idhis = Fixer.objects.filter(idctm_id=id)
            get_hisfix = Fixer.objects.all()
            data=[]
            serializer = FixerSerializer(get_idhis,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
    
# @api_view(['POST'])
# def post_msg(request,id):

#     if request.method == 'POST':
#         post_idcus = Customer.objects.filter(id_cus=id)
#         serializer = MessageSerializer(post_idcus,data = request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data,status=status.HTTP_201_CREATED)
#         return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    
@api_view(['POST'])
def post_msg(request):

    if request.method == 'POST':
        
        serializer = MessageSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    
@api_view(['GET'])
def get_msg(request,id):
    try:
            get_idctm = Message.objects.filter(idctm_id=id)
            get_idmsg = Message.objects.all()
            data=[]
            serializer = MessageSerializer(get_idctm,many=True)
            print(serializer.data)
            print(get_idctm)
            print(get_idmsg)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
    

@api_view(['GET'])
def get_ordertostore(request,id):
    try:
            get_idorder= OrderProductToStore.objects.get(id=id)
            get_iddetailordertostore = DetailOrderProductToStore.objects.filter(order_product_id=get_idorder)
            total = sum(details.total_price for details in get_iddetailordertostore )
            print(total)
            get_idorder.total_price = total
            print(get_idorder.total_price)
            get_idorder.save()
            print(get_idorder)
            data=[]
            serializer = OrderProductToStoreSerializer(get_idorder,many=True)
            print(serializer.data)
            return Response(serializer.data,status=status.HTTP_200_OK)
    except:
            dt = {'status': 'otp-failed'}
            print('failed ไม่มี',dt)
            return Response(data=dt,status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['POST'])
def post_ctm_order(request,id):

    if request.method == 'POST':
        post_idcus = Customer.objects.filter(idctm_id=id)
        serializer = CustomerOrderSerializer(post_idcus,data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)