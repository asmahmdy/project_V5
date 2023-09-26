from django.db import router
from django.urls import path
from .import views
from django .conf.urls.static import static
from django.conf import settings

urlpatterns = [
     # path('',views.getRoutes),
    path('register',views.post_register),
    path('get-profile/<int:id>',views.get_profile),
    path('login',views.post_login),
    path('post-fixer',views.post_fixer),
    path('get-fixer/<int:id>',views.get_fixer),
    path('get-hisfix/<int:id>/',views.get_hisfix),
    path('update-fix/<int:fid>',views.update_fix),
    path('get-status/<int:id>',views.get_status),

    path('post-slip',views.upload_slip),

    path('post-msg',views.post_msg),
    path('get-msg/<int:id>',views.get_msg),
    
    path('get-ordertostore/<int:id>',views.get_ordertostore),
    path('get-products/',views.get_Product),
    path('post_ctm_order<int:id>/',views.post_ctm_order),
    # path('customer/',views.getdata)
    # # path('payment',views.post_payment),
    # path('confirm-fixer',views.get_fixer),
]