# Generated by Django 4.2.3 on 2023-09-12 07:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0011_alter_fix_fprice'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fix',
            name='fspay',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='startapp.paymentstatus'),
        ),
        migrations.AlterField(
            model_name='message',
            name='reply',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='message',
            name='time',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]