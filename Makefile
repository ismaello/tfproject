DEFAULT_ENV := dev
DEFAULT_PROJECT := k8testserver

POSSIBLE_PROJECTS := k8testserver sek8s
POSSIBLE_ENVS := prod dev

PROJECT ?= ${DEFAULT_REGION}
ENV ?= ${DEFAULT_ENV}

ifeq ($(filter $(PROJECT),$(POSSIBLE_PROJECTS)),)
    $(error PROJECT "$(PROJECT)" not in [$(POSSIBLE_PROJECT)])
endif

ifeq ($(filter $(ENV),$(POSSIBLE_ENVS)),)
    $(error ENV "$(ENV)" not in [$(POSSIBLE_ENVS)])
endif

INITED_WITH_ENV := $(shell cat project/.inited_with_env.txt 2> /dev/null)
INITED_WITH_PROJECT := $(shell cat project/.inited_with_project.txt 2> /dev/null)



GLOBAL_CONFIG := ../config/global/global.tfvars
PROJECT_CONFIG := ../config/${ENV}/${PROJECT}/variables.tfvars

# help by default
.DEFAULT_GOAL := help
.PHONY: default
default: help ;

.ONESHELL:
apply: fail_if_not_initialized_properly
	cd project
	terraform apply -var-file="${GLOBAL_CONFIG}" -var-file="${PROJECT_CONFIG}" -var="environment_name=${PROJECT}"

.ONESHELL:
plan: fail_if_not_initialized_properly
	cd project
	terraform plan -var-file="${GLOBAL_CONFIG}" -var-file="${PROJECT_CONFIG}" -var="environment_name=${PROJECT}"

.ONESHELL:
destroy: fail_if_not_initialized_properly
	cd project
	terraform destroy -var-file="${GLOBAL_CONFIG}" -var-file="${PROJECT_CONFIG}" --var="environment_name=${PROJECT}"

fail_if_not_initialized_properly:
	@if [ -z "${INITED_WITH_PROJECT}" ]; then echo NOT INITED. please make init; exit 1; fi
	@if [ -z "${INITED_WITH_ENV}" ]; then echo NOT INITED. please make init; exit 1; fi
	@if [ "${ENV}" != "${INITED_WITH_ENV}" ]; then echo NOT INITED PROPERLY. please make init; exit 1; fi
	@if [ "${PROJECT}" != "${INITED_WITH_PROJECT}" ]; then echo NOT INITED PROPERLY. please make init; exit 1; fi

.ONESHELL:
init: clean
	cd project
	terraform init 
	$(shell echo "${ENV}" > project/.inited_with_env.txt)
	$(shell echo "${PROJECT}" > project/.inited_with_project.txt)

clean:
	rm -rf project/.terraform/
	rm -f  project/.inited_with_region.txt
	rm -f  project/.inited_with_env.txt

help:
	@echo "Usage:"
	@echo " make init ACCESS_KEY=\"XXXXXXXXXXXXXXXXXXXXXXX\" ENV=[${POSSIBLE_ENVS}]? PROJECT=[${POSSIBLE_PROJECTS}]?"
	@echo " make apply ENV=[${POSSIBLE_ENVS}]? REGION=[${POSSIBLE_PROJECTS}]?"
	@echo " make clean"
	@echo ""
	@echo " make plan ENV=[${POSSIBLE_ENVS}]? REGION=[${POSSIBLE_PROJECTS}]?"
	@echo " make destroy ENV=[${POSSIBLE_ENVS}]? REGION=[${POSSIBLE_PROJECTS}]?"
