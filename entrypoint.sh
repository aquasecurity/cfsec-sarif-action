#!/bin/bash

set -x

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

echo {} > ${INPUT_SARIF_FILE}

cfsec --format=sarif "${INPUT_WORKING_DIRECTORY}" > ${INPUT_SARIF_FILE}

cfsec_return="${PIPESTATUS[0]}" exit_code=$?

echo ::set-output name=cfsec-return-code::"${cfsec_return}"
