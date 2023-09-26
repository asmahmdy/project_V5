# Generated by Django 4.2.3 on 2023-09-11 11:16

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0005_paymentstatus_typeproduct'),
    ]

    operations = [
        migrations.CreateModel(
            name='Fix',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fdate', models.DateField(default=datetime.date.today)),
                ('product', models.CharField(max_length=500, null=True)),
                ('product_price', models.IntegerField(default=0, null=True)),
                ('used_equipment_not_exhausted', models.TextField(max_length=1000, null=True)),
                ('equipment_used_up', models.TextField(max_length=1000, null=True)),
                ('equipment_price', models.IntegerField(default=0, null=True)),
                ('emp_price', models.IntegerField(default=0, null=True)),
                ('fprice', models.IntegerField(null=True)),
                ('fspay', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='startapp.paymentstatus')),
                ('idcustomer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='startapp.customer')),
                ('idemp', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='startapp.employee')),
                ('idfixer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='startapp.fixer')),
                ('typepd', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='startapp.typeproduct')),
            ],
        ),
    ]