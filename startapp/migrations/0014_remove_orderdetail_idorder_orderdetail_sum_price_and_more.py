# Generated by Django 4.2.3 on 2023-09-13 07:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0013_alter_message_time'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderdetail',
            name='idorder',
        ),
        migrations.AddField(
            model_name='orderdetail',
            name='sum_price',
            field=models.IntegerField(default=0, null=True),
        ),
        migrations.DeleteModel(
            name='Order',
        ),
    ]
