#!/bin/bash
# build.sh — ארבע הרצות: lualatex, biber, lualatex, lualatex
set -e
cd "$(dirname "$0")"
lualatex -interaction=nonstopmode -jobname=report main.tex >/dev/null || true
biber report >/dev/null
lualatex -interaction=nonstopmode -jobname=report main.tex >/dev/null || true
lualatex -interaction=nonstopmode -jobname=report main.tex >/dev/null || true
grep -E "^!|Output written" report.log || true
