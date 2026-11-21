# 07-regrade: ציון חוזר

**נשלח:** 2026-11-21 22:51 UTC · **הדוח:** [`work/review/07-regrade.md`](../../work/review/07-regrade.md)

## הפרומפט, כפי שנשלח

```text
You are a strict, independent grader for a university course assignment. You did NOT write this work and have not seen earlier grades. Grade it as harshly as Dr. Yoram Segal would; he grades harder when the self-grade is high (self-grade on the form: 85).

Repo: /home/claude/verilens-report (public at https://github.com/guyyaari-png/verilens-prep-report). Submission PDF: /home/claude/verilens-report/Haifa-01-ex02.pdf (Hebrew RTL with English). Group Haifa-01, students Guy Yaari and Paz Nisim. Course: "יישומי Vibe Coding ו-AI במדע וביום-יום", University of Haifa. Assignment 2 = a preparatory report (דוח מכין) for a project: VeriLens image-verification platform + TRUTH-IMG ethics standard, on journalistic ethics of AI fake images made for traffic. Deadline: 24.11.2026.

Assignment 2 requirements (lesson 3): PDF built in LaTeX per lesson 3 structure: main.tex is only a list of chapters, one chapter per file, figures/ folder, references.bib, work/ folder; the students' own CLS template with version number, changelog, command list and README; correct Hebrew and English (BiDi correct, no reversed text/numbers/parentheses); real sources via biblatex+biber; four-run compile; several review agents each checking something different; submission via GitHub repo with README and final files, plus a form with self-grade.
Expectations from Assignment 1 feedback (they got 67 on assignment 1): PDF named Haifa-01-ex02.pdf; numbered REAL prompts folder; meaningful incremental commits; BOTH partners push and pull; README with screenshots; personal voice of the students; an unopenable/private repo gets 0.

Known state you should verify, not assume: chapters/ch17-reflection.tex has Guy's personal section but Paz's is still empty and the chapter is not yet in main.tex (the students say Paz will push it before the deadline). Only Guy's account has commits so far.

Method:
1. Read repo structure, main.tex, my-template.cls, TEMPLATE.md, README.md, prompts/ (incl. prompts/review/), work/ (incl. work/review/), references.bib, git log.
2. Render every PDF page to PNG (pdftoppm -r 60; zoom where needed) and LOOK at each page with the Read tool: BiDi errors, reversed numbers, mirrored parentheses, near-empty pages, overflow, '??' references, typos.
3. Spot-check 5 numeric claims against their cited sources (WebFetch allowed) and internal consistency of numbers across chapters.
4. Judge course fit, scope, and visibility of the AI process and personal voice.

Output: write the full report in HEBREW to /home/claude/verilens-report/work/review/07-regrade.md: a score out of 100 with a per-criterion breakdown (state assumed weights), then two scores: (a) as the repo stands now, (b) if Paz pushes his own reflection section and the chapter is added to main.tex. Then a prioritized list of every remaining deduction with page/file, cost in points, and the concrete fix; mark which only the students can do. Do not edit any other file. Do not commit. Never copy any national ID numbers into your report. Return a short summary: both scores and top 8 deductions.
```
