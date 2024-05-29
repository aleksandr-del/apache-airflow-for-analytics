#!/usr/bin/env bash

sleep 10
airflow db
sleep 10

airflow user create --username admin --firstname admin --lastname admin --role Admin --email admin@example.org -p 12345

airflow scheduler &
airflow webserver
