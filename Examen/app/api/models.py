from django.db import models


# Create your models here.

#category = models.ForeignKey(MovieCategories, on_delete=models.PROTECT)

class Employee(models.Model):
    name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)

class Client(models.Model):
    name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)
    address = models.CharField(max_length=250)
    age = models.IntegerField(1)


class Supplier(models.Model):
    name = models.CharField(max_length=250)
    last_name = models.CharField(max_length=250)

class Category(models.Model):
    name = models.CharField(max_length=250)

class Product(models.Model):
    name = models.CharField(max_length=250)
    description = models.CharField(max_length=250)
    price = models.IntegerField(1)
    stock = models.IntegerField(1)

    supplier = models.ForeignKey(Supplier, on_delete=models.PROTECT)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)

class Sells(models.Model):
    name = models.CharField(max_length=250)
    date = models.DateField()

    employees = models.ManyToManyField(Employee)
    products = models.ManyToManyField(Product)
    clients = models.ManyToManyField(Client)
    

    

#django many to many
#agregar ventas, relacion de muchos a muchos ventas con productos, agregar categoria, agregar claves foraneas
