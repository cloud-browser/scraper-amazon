
requirements.txt: requirements.in
	pip-compile --output-file requirements.txt requirements.in --resolver=backtracking

venv: requirements.txt
	python3 -m venv venv
	./venv/bin/pip install -r requirements.txt
	touch venv


run: venv
	./venv/bin/scrapy crawl amazon_search
