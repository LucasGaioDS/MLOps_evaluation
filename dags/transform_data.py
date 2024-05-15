from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import transform_functions as tf

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 5, 15),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'transform_data',
    default_args=default_args,
    description='DAG to transform raw data into a clean format for model training',
    schedule_interval=timedelta(days=1),
    catchup=False
)

transform = PythonOperator(
    task_id='transform_data',
    python_callable=tf.transform_and_load,
    dag=dag
)

transform
