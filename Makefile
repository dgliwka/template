

# Porcelain
# ###############
.PHONY: env-up env-down env-recreate container run build lint test

run: setup ## run the app
	@echo "Not implemented"; false

env-up: ## set up dev environment
	@echo "Not implemented"; false

env-down: ## tear down dev environment
	@echo "Not implemented"; false

env-recreate: env-down env-up ## deconstruct current env and create another one

build: setup ## create artifact
	@echo "Not implemented"; false

lint: setup ## run static analysis
	@echo "Not implemented"; false

test: setup ## run all tests
	@echo "Not implemented"; false

container: build ## create container
	#docker build -t lmap .
	@echo "Not implemented"; false

# Plumbing
# ###############
.PHONY: setup gitclean gitclean-with-libs

setup:

gitclean:
	@# will remove everything in .gitignore expect for blocks starting with dep* or lib* comment
	diff --new-line-format="" --unchanged-line-format="" <(grep -v '^#' .gitignore | grep '\S' | sort) <(awk '/^# *(dep|lib)/,/^$/' testowy | head -n -1 | tail -n +2 | sort) | xargs rm -rf

gitclean-with-libs:
	diff --new-line-format="" --unchanged-line-format="" <(grep -v '^#' .gitignore | grep '\S' | sort) | xargs rm -rf

# Utilities
# ###############
.PHONY: help todo clean really_clean init
init: ## one time setup
	direnv allow .

todo: ## list all TODOs in the project
	git grep -I --line-number TODO | grep -v 'list all TODOs in the project' | grep TODO

clean: gitclean ## remove artifacts

really_clean: gitclean-with-libs ## remove EVERYTHING

help: ## print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help
