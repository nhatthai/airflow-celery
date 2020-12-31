# airflow-celery
Using Celery Executor

### Prerequisites
+ Docker Compose
+ Postgres 12
+ Airflow 1.10.12
+ Redis

### Docker Compose
+ Build Docker Image
    ```
    docker build  --tag=[image_name] .
    docker push [image_name]
    ```

+ Create a file .env
    ```
    AIRFLOW__CORE__LOAD_DEFAULT_CONNECTIONS=False
    AIRFLOW__CORE__EXECUTOR=CeleryExecutor
    AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgres+psycopg2://airflow:airflow@postgres:5432/airflow
    AIRFLOW__CORE__FERNET_KEY=81HqDtbqAywKSOumSha3BhWNOdQ26slT6K0YaZeZyPs=
    AIRFLOW_CONN_METADATA_DB=postgres+psycopg2://airflow:airflow@postgres:5432/airflow
    AIRFLOW_VAR__METADATA_DB_SCHEMA=airflow
    AIRFLOW__SCHEDULER__SCHEDULER_HEARTBEAT_SEC=10

    AIRFLOW__CELERY__BROKER_URL=redis://redis:6379/1
    AIRFLOW__CELERY__RESULT_BACKEND=db+postgres://airflow:airflow@postgres:5432/airflow

    ```

+ Run webserver & scheduler
    ```
    docker-compose up
    ```

+ Open Airflow
    ```
    http://localhost:8080
    ```

+ Open Flower
    ```
    http://localhost:5555
    ```

+ Start Airflow Workers
    ```
    docker exec -it [airflow-celery_worker_1] bash
    airflow worker -q queue1
    ```

### Reference
+ [Docker Airflow](https://github.com/puckel/docker-airflow)
+ [Scale-out with Redis & Celery](https://www.cloudwalker.io/2019/09/30/airflow-scale-out-with-redis-and-celery/)
+ [Airflow Executor Explained](https://www.astronomer.io/guides/airflow-executors-explained)