# take Airflow base image
FROM apache/airflow:1.10.12-python3.7

RUN pip install apache-airflow[celery,postgres,redis]==1.10.12

# add dags
ADD dags /opt/airflow/dags