ifdef OS
	PYTHON = python
	PIP = venv\Scripts\pip
	SCRAPY = venv\Scripts\scrapy
else
	PYTHON = python3
	PIP = ./venv/bin/pip
	SCRAPY = ./venv/bin/scrapy
endif

requirements.txt: requirements.in
	pip-compile --output-file requirements.txt requirements.in --resolver=backtracking

venv: requirements.txt
	$(PYTHON) -m venv venv
	$(PIP) install -r requirements.txt


run: venv
	$(SCRAPY) crawl amazon_search
