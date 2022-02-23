from re import search
from django.http import HttpResponse
from django.shortcuts import render

from .models import *
from rest_framework import viewsets
from rest_framework import serializers
from rest_framework import permissions
from rest_framework import filters
from .serializers import *
#from api.serializers import MovieSerializer, MovieCategoriesSerializer

# def index(request):
#     return HttpResponse("ONICHAAAN TASUKETE")

class EmployeeViewSet(viewsets.ModelViewSet):
    search_fields = ['name','last_name']
    filter_backends = (filters.SearchFilter,)
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer
    #permission_classes = [permissions.IsAuthenticated]

class ClientViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Client.objects.all()
    serializer_class = ClientSerializer
    #permission_classes = [permissions.IsAuthenticated]

class SupplierViewSet(viewsets.ModelViewSet):
    search_fields = ['name','last_name']
    filter_backends = (filters.SearchFilter,)
    queryset = Supplier.objects.all()
    serializer_class = SupplierSerializer
    #permission_classes = [permissions.IsAuthenticated]

class CategoryViewSet(viewsets.ModelViewSet):
    search_fields = ['name']
    filter_backends = (filters.SearchFilter,)
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    #permission_classes = [permissions.IsAuthenticated]

class ProductViewSet(viewsets.ModelViewSet):
    search_fields = ['name','price','stock']
    filter_backends = (filters.SearchFilter,)
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    #permission_classes = [permissions.IsAuthenticated]

class SellsViewSet(viewsets.ModelViewSet):
    search_fields = ['name','date']
    filter_backends = (filters.SearchFilter,)
    queryset = Sells.objects.all()
    serializer_class = SellsSerializer
    #permission_classes = [permissions.IsAuthenticated]