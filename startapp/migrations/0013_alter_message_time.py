# Generated by Django 4.2.3 on 2023-09-12 07:34

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('startapp', '0012_alter_fix_fspay_alter_message_reply_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='message',
            name='time',
            field=models.DateField(default=datetime.date.today),
        ),
    ]
