#!/bin/bash

set -o errexit

__DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export ENVIRONMENT=BUILD

[[ -f "${__DIR}/pipeline.sh" ]] && source "${__DIR}/pipeline.sh" || \
    echo "No pipeline.sh found"

export CUSTOM_SCRIPT_IDENTIFIER="${CUSTOM_SCRIPT_IDENTIFIER:-custom}"
echo "Custom Script Identifier is [${CUSTOM_SCRIPT_IDENTIFIER}]"
mkdir -p "${__ROOT}/${CUSTOM_SCRIPT_IDENTIFIER}"

export CUSTOM_SCRIPT="$(basename "${BASH_SOURCE}")"
echo "Custom script name is [${CUSTOM_SCRIPT}]"

[[ -f "${__ROOT}/${CUSTOM_SCRIPT_IDENTIFIER}/${CUSTOM_SCRIPT}" ]] && source "${__ROOT}/${CUSTOM_SCRIPT_IDENTIFIER}/${CUSTOM_SCRIPT}" || \
    echo "No ${__ROOT}/${CUSTOM_SCRIPT_IDENTIFIER}/${CUSTOM_SCRIPT} found"

build
