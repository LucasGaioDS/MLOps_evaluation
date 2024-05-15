import requests
import pandas as pd
from sqlalchemy import create_engine
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta

# Définitions des fonctions
def check_environment_setup():
    # Vérifiez les variables d'environnement ou d'autres prérequis ici
    pass

def fetch_ademe_data():
    url = 'https://data.ademe.fr/api/records/1.0/search/?dataset=dpe-v2-logements-neufs'
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        raise Exception("Failed to fetch data")

def process_results(data):
    # Exemple simple pour obtenir la prochaine URL si la pagination est nécessaire
    if 'next_page' in data:
        next_url = data['next_page']
    else:
        next_url = None
    return next_url

def save_to_db(data):
    # Connexion à la base de données PostgreSQL
    engine = create_engine('postgresql://user:password@localhost:5432/dbname')
    df = pd.DataFrame(data)  # Assurez-vous que les données sont en format DataFrame
    df.to_sql('dpe_logement', con=engine, if_exists='append', index=False)

def drop_duplicates():
    engine = create_engine('postgresql://user:password@localhost:5432/dbname')
    with engine.connect() as conn:
        query = """
        DELETE FROM dpe_logement
        WHERE ctid IN (
            SELECT ctid
            FROM (
                SELECT ctid, row_number() OVER (PARTITION BY n_dpe ORDER BY ctid) AS rnum
                FROM dpe_logement
            ) t
            WHERE t.rnum > 1
        );
        """
        conn.execute(query)

# Configuration du DAG
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
    'load_data',
    default_args=default_args,
    description='DAG to load data from ADEME API',
    schedule_interval=timedelta(days=1),
    catchup=False
)

t1 = PythonOperator(
    task_id='check_environment_setup',
    python_callable=check_environment_setup,
    dag=dag
)

t2 = PythonOperator(
    task_id='fetch_ademe_data',
    python_callable=fetch_ademe_data,
    dag=dag
)

t3 = PythonOperator(
    task_id='process_results',
    python_callable=process_results,
    dag=dag
)

t4 = PythonOperator(
    task_id='save_postgresdb',
    python_callable=save_to_db,
    dag=dag
)

t5 = PythonOperator(
    task_id='drop_duplicates',
    python_callable=drop_duplicates,
    dag=dag
)

t1 >> t2 >> t3 >> t4 >> t5