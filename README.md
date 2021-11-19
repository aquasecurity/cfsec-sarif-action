[![GitHub All Releases](https://img.shields.io/github/downloads/aquasecurity/cfsec-sarif-action/total)](https://github.com/aquasecurity/cfsec-sarif-action/releases)
# cfsec-sarif-action

## Description

This Github Action will run the cfsec sarif check then add the report to the repo for upload.

Example usage

```yaml
name: cfsec
on:
  push:
    branches:
      - main
  pull_request:
jobs:
  cfsec:
    name: cfsec sarif report
    runs-on: ubuntu-latest

    steps:
      - name: Clone repo
        uses: actions/checkout@master

      - name: cfsec
        uses: cfsec/cfsec-sarif-action@master
        with:
          sarif_file: cfsec.sarif         
          github_token: ${{ secrets.GITHUB_TOKEN }}

      - name: Upload SARIF file
        uses: github/codeql-action/upload-sarif@v1
        with:
          # Path to SARIF file relative to the root of the repository
          sarif_file: cfsec.sarif         
```
