# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-27 11:40
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Login', '0002_usersrightssupport'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='group',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.Studgroup'),
        ),
    ]
