# Generated by Django 4.2.3 on 2023-09-12 06:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0010_alter_detailorderproducttostore_name_product'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fix',
            name='fprice',
            field=models.IntegerField(default=0, null=True),
        ),
    ]
