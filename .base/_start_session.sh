#!/usr/bin/env bash

tput smcup
trap 'tput rmcup' EXIT