# 01-bidi: כיווניות

**נשלח:** 2026-11-21 18:48 UTC · **הדוח:** [`work/review/01-bidi-audit.md`](../../work/review/01-bidi-audit.md)

## הפרומפט, כפי שנשלח

```text
You are a Hebrew/English BiDi reviewer for a LaTeX report. Do NOT edit any project files; only write your report.

Project: /home/claude/verilens-report (Hebrew RTL report with English LTR words, compiled with LuaLaTeX + babel bidi=basic). The compiled PDF is /home/claude/verilens-report/report.pdf (about 45 pages). Sources: main.tex, my-template.cls, chapters/*.tex, figures/*.tex.

Task (this is the course's "Prompt B2 — BiDi audit of the finished PDF"):
Extract the text of the PDF (pdftotext, page by page) and check it, page by page, for:
- Hebrew words that start with a final letter (ך ם ן ף ץ at the start of a word = reversed Hebrew).
- Reversed English words and acronyms.
- Numbers split or reversed: decimals (e.g. 0.1 vs 1.0), ranges, currency, percentages, dates, IDs.
- Table of contents: reversed section numbers (e.g. 1.2 instead of 2.1), left-aligned rows.
Note: pdftotext output of RTL text can itself be scrambled, so confirm every suspected issue visually.
Then render every page to an image (pdftoppm -r 70 -png, put images in /tmp/claude-0/-home-claude/2dff8f1f-3e99-5d9c-8278-cfd416809c05/scratchpad/bidi-audit/) and look at each page for: diagrams or backgrounds touching the page edge, large gaps inside a line, mirrored headers and footers, table columns in the wrong order (the first column must be on the RIGHT), English inside Hebrew in the wrong order, parentheses flipped.

Report page number (as printed in the footer, "עמוד N מתוך M", and the PDF page index), the exact text, and the rule it breaks. Rank by severity. Do not fix anything.

Write your report in Markdown (English is fine; quote Hebrew as it appears) to /home/claude/verilens-report/work/review/01-bidi-audit.md, starting with a one-line verdict and a count of findings. Then reply with a short summary (max 15 lines) of the most important findings.
```
