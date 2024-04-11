# MLOps_evaluation

A rendre dans un dépôt GitHub, avant le vendredi 3 mai. Travaille en groupe de 1 à 3 personnes.

Membre : 
- Lucas GAIO DOS SANTOS.

## Introduction

Nous souhaitons déployer une application, basé sur les logements neufs étudiés de l'Ademe (https://data.ademe.fr/datasets/dpe-v2-logements-neufs/), ayant pour objectif de prédire l'étiquette GES, sans utiliser la viarable étiquette DPE dans le modèle. 

### Contribution au projet

Personne ne peut participer au projet.

### Etapes imposées

- Créer 3 dags AirFlow (extraction des données, trnasofrmation, entraînement & promotion du modèle) ;
- Traquer les modèles dans MLFlow ;
- Servir le modèle en utilisant Airflow ;
- Créer une interface Streamlit.

Mettre les dags et les datas dans le même dépît que Airflow.

Le dépôt doit contenir :
- /dags
- docker-compose.yaml
- Dockerfile.airflow
- Dockerfile.mlflow
- requirements.txt
- Makefile
- dotenv
- .github/workflows/mlops.yml

## Fonctionement