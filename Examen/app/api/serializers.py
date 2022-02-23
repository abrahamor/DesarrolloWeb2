import re
from .models import *
from rest_framework import serializers



class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['name','last_name']

class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = ['name','last_name','address']

class SupplierSerializer(serializers.ModelSerializer):
    class Meta:
        model = Supplier
        fields = ['name','last_name']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['name']

class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ['name','description','price','stock','supplier','category']

class SellsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sells
        fields = ['name','date','employees','products','clients']



    