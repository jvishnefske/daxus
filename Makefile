.PHONY: test coverage lint clean

test:
	python -m pytest tests/ -v

coverage:
	python -m pytest tests/ --cov=daxus --cov-report=html --cov-report=xml

lint:
	python -m flake8 daxus/ tests/
	python -m mypy daxus/

clean:
	rm -rf __pycache__ .pytest_cache .coverage htmlcov coverage.xml
	rm -rf daxus/__pycache__ tests/__pycache__
	rm -rf *.egg-info dist build .mypy_cache
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
