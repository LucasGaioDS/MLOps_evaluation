from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
from fetch_transform import fetch_data, save_to_db, check_environment_setup

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 5, 15),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG('load_data',
          default_args=default_args,
          schedule_interval=timedelta(days=1),
          catchup=False)

t1 = PythonOperator(
    task_id='check_environment_setup',
    python_callable=check_environment_setup,
    dag=dag)

t2 = PythonOperator(
    task_id='fetch_data',
    python_callable=fetch_data,
    dag=dag)

t1 >> t2
