from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import model_functions as mf

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
    'model_training_promotion',
    default_args=default_args,
    description='DAG for training and promoting ML models using MLflow',
    schedule_interval=timedelta(days=1),
    catchup=False
)

train_model = PythonOperator(
    task_id='train_model',
    python_callable=mf.train_model,
    dag=dag
)

create_champion_model = PythonOperator(
    task_id='create_champion_model',
    python_callable=mf.create_champion_model,
    dag=dag
)

evaluate_and_promote_model = PythonOperator(
    task_id='evaluate_and_promote_model',
    python_callable=mf.evaluate_and_promote_model,
    dag=dag
)

train_model >> create_champion_model >> evaluate_and_promote_model
