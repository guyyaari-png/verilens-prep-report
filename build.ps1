# build.ps1 — PowerShell 7 (Windows / MiKTeX): ארבע הרצות
lualatex -interaction=nonstopmode -jobname=report main.tex
biber report
lualatex -interaction=nonstopmode -jobname=report main.tex
lualatex -interaction=nonstopmode -jobname=report main.tex
Select-String -Path report.log -Pattern "^!","Output written"
