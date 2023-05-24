PYTHON_VERSION := python3

.PHONY: install run clean quality quality_fix security quality_docker test stop restart

install:
	pip install -r ./api/requirements/dev.txt
	pre-commit install

stop:
	docker-compose stop

restart:
	docker-compose restart

run:
	docker-compose -f docker-compose.app.yml up --detach --build --remove-orphans
	docker image prune -a -f
	docker volume prune -f

clean:
	find . -type d -name "__pycache__" -depth -exec rm -rf '{}' \;

quality_docker:
	docker exec -ti app black --check app
	docker exec -ti app isort --check app
	docker exec -ti app flake8 app --count --show-source --statistics

quality:
	black --check api
	isort --check api

quality_fix:
	black api
	isort api

security:
	bandit -v -r . -c pyproject.toml --exit-zero

test:
	pytest -c pyproject.toml
