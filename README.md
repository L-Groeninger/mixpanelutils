
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mixpanelutils

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/L-Groeninger/mixpanelutils/branch/main/graph/badge.svg)](https://app.codecov.io/gh/L-Groeninger/mixpanelutils?branch=main)
<!-- badges: end -->

The goal of mixpanelutils is to provide certain utility functions to
work with Mixpanel and enrich some functionality. It is a package that
wraps the [Mixpanel Ingestion
API](https://developer.mixpanel.com/reference/ingestion-api).

It is suggested to use environmental variables to store certain
credentials:

- MP_SERVICE_ACCOUNT_NAME
- MP_SERVICE_ACCOUNT_TOKEN
- MP_PROJECT_ID

These credentials can be found in the Project Settings in Mixpanel.

## Installation

You can install the development version of mixpanelutils from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("L-Groeninger/mixpanelutils")
```

## Documentation

Full documentation website on:
<https://L-Groeninger.github.io/mixpanelutils>

## Example

This is a basic example which shows you which lookup tables are
currently present in your Project:

``` r
library(mixpanelutils)

get_lookup_tables(mp_service_account_name = Sys.getenv("MP_SERVICE_ACCOUNT_NAME"),
                  mp_service_account_secret = Sys.getenv("MP_SERVICE_ACCOUNT_TOKEN"),
                  mp_project_id = Sys.getenv("MP_PROJECT_ID"))
```

The function `replace_lookup_table()` helps at as the name suggests
replacing a lookup table with an updated version.

``` r
replace_lookup_table(mp_service_account_name = Sys.getenv("MP_SERVICE_ACCOUNT_NAME"),
                    mp_service_account_secret = Sys.getenv("MP_SERVICE_ACCOUNT_TOKEN"),
                    mp_project_id = Sys.getenv("MP_PROJECT_ID"),
                    lookup_table_id = "1234",
                    table_to_replace = df)
```
