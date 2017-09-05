# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-09-05 12:41
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Login', '0004_auto_20170807_1252'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Document',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('path', models.CharField(max_length=100)),
                ('creation_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'Document',
            },
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('dep', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.Department')),
            ],
            options={
                'db_table': 'Subject',
            },
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('description', models.TextField()),
                ('start_time', models.DateTimeField()),
                ('end_time', models.DateTimeField()),
                ('estimated_time', models.DateTimeField()),
                ('creation_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('group', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.Studgroup')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Task.Subject')),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.Teacher')),
            ],
            options={
                'db_table': 'Task',
            },
        ),
        migrations.CreateModel(
            name='Task_doc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('doc', models.OneToOneField(on_delete=django.db.models.deletion.DO_NOTHING, to='Task.Document')),
                ('task', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Task.Task')),
            ],
            options={
                'db_table': 'Task_doc',
            },
        ),
        migrations.CreateModel(
            name='Teacher_Subject',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Task.Subject')),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='Login.Teacher')),
            ],
            options={
                'db_table': 'Teacher_Subject',
            },
        ),
    ]