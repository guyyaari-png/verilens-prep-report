# 02-page-review: עמוד אחר עמוד

**נשלח:** 2026-11-21 18:48 UTC · **הדוח:** [`work/review/02-page-review.md`](../../work/review/02-page-review.md)

## הפרומפט, כפי שנשלח

```text
You are a page-by-page layout reviewer for a Hebrew LaTeX report. Do NOT edit any project files; only write your report.

PDF: /home/claude/verilens-report/report.pdf (about 45 pages, Hebrew RTL with English words). Sources are in /home/claude/verilens-report (main.tex, my-template.cls, chapters/, figures/).

Task (the course's "Prompt 8 — page-by-page review"): Render every page to an image (pdftoppm -r 75 -png into /tmp/claude-0/-home-claude/2dff8f1f-3e99-5d9c-8278-cfd416809c05/scratchpad/page-review/) and look at EACH page carefully. Report:
- a heading at the bottom of a page (heading with no text after it on the same page),
- a split box or table that breaks badly,
- a nearly empty page or a large empty area (more than about a third of a page) that is not the end of a chapter,
- overlapping labels or text inside diagrams (TikZ figures, charts, Gantt chart, heat map),
- text or graphics outside the margins,
- a figure or table that is never mentioned in the text (check with grep for \ref{label} in chapters/),
- unreadably small text in figures,
- anything that looks unprofessional on the cover, table of contents, lists of figures/tables, headers or footers.

For each finding give: PDF page index and printed page number, what you see, and a concrete suggested fix (one line). Rank by severity. Do not fix anything.

Write the report in Markdown to /home/claude/verilens-report/work/review/02-page-review.md, starting with a one-line verdict and a count of findings. Then reply with a short summary (max 15 lines).
```
