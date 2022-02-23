from django.urls import include,path
from . import views
from rest_framework import routers


router = routers.DefaultRouter()
router.register(r'employee', views.EmployeeViewSet)
router.register(r'client', views.ClientViewSet)
router.register(r'supplier', views.SupplierViewSet)
router.register(r'category', views.CategoryViewSet)
router.register(r'product', views.ProductViewSet)
router.register(r'sells', views.SellsViewSet)


urlpatterns = [
    #path('', views.index, name='index'),
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]