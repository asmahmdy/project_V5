# Generated by Django 4.2.3 on 2023-09-11 11:12

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0002_employee'),
    ]

    operations = [
        migrations.CreateModel(
            name='Detailemp',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('salary', models.IntegerField(null=True)),
                ('drawamount', models.IntegerField(blank=True, null=True)),
                ('drawdate', models.DateField(default=datetime.date.today)),
                ('idemployee', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='startapp.employee')),
            ],
        ),
    ]