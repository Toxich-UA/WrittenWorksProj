# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-27 10:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Login', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='UsersRightsSupport',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'permissions': (('student_rights', 'Global student rights'), ('teacher_rights', 'Global teacher rights')),
                'managed': False,
            },
        ),
    ]
