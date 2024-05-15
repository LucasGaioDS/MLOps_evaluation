install:
	pip install -r requirements.txt

pylint:
	pylint --disable=R,C,W dags/*.py

black:
	black --line-length 100 dags/*.py

format: black

lint: pylint
