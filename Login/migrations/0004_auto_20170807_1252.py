# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-07 09:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Login', '0003_auto_20170727_1440'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='regkey',
            field=models.CharField(max_length=100, null=True),
        ),
    ]