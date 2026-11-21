# 06-final-grade: ציון סופי

**נשלח:** 2026-11-21 19:23 UTC · **הדוח:** [`work/review/06-final-grade.md`](../../work/review/06-final-grade.md)

## הפרומפט, כפי שנשלח

```text
You are a strict, independent grader for a university course assignment. You did NOT write this work. Grade it as harshly as Dr. Yoram Segal would; he is known to grade harder when the self-grade is high (self-grade is 85, target is 100).

Repo: /home/claude/verilens-report (also public at https://github.com/guyyaari-png/verilens-prep-report). Submission PDF: /home/claude/verilens-report/Haifa-01-ex02.pdf (45 pages, Hebrew RTL with English). Group Haifa-01, students Guy Yaari and Paz Nisim. Course: "יישומי Vibe Coding ו-AI במדע וביום-יום", University of Haifa. Assignment 2 = a preparatory report (דוח מכין) for a project: VeriLens image-verification platform + TRUTH-IMG ethics standard, on journalistic ethics of AI fake images made for traffic.

Assignment 2 requirements (from lesson 3): PDF built in LaTeX per lesson 3 structure: main.tex is only a list of chapters, one chapter per file, figures/ folder, references.bib, work/ folder; the students' own CLS template with version number, changelog, command list and README; correct Hebrew and English (BiDi correct, no reversed text/numbers/parentheses); real sources via biblatex+biber; four-run compile; several review agents each checking something different; submission via GitHub repo with README and final files, plus a form with self-grade.
Expectations from Assignment 1 feedback (they got 67 on assignment 1): PDF named Haifa-01-ex02.pdf; numbered REAL prompts folder (not polished after-the-fact summaries); meaningful incremental commits; BOTH partners push and pull (currently only Guy has commits — note it but it's being fixed by the students); README with screenshots; personal voice of the students; an unopenable/private repo gets 0.

Method:
1. Read the repo structure, main.tex, my-template.cls, TEMPLATE.md, README.md, prompts/, work/review/, git log.
2. Render the PDF pages to PNG (pdftoppm -r 60, then view at higher res where needed) and actually LOOK at every page: BiDi errors, reversed numbers, mirrored parentheses, near-empty pages, overflowing lines, broken references (??), figure quality, typos in Hebrew. Use the Read tool on the PNGs.
3. Check 5 random numeric claims against references.bib sources (WebFetch if needed) for consistency; check internal number consistency between chapters (budget, timeline, requirement counts).
4. Check whether the report reads as a real preparatory report for this course, not just a generic corporate proposal: is it in scope, is the personal voice there, is the AI process visible.

Output: write the full report in HEBREW to /home/claude/verilens-report/work/review/06-final-grade.md with: a score out of 100 with a breakdown per criterion (state the weights you assume), then a prioritized list of every deduction: page number / file, what is wrong, how many points it costs, and the concrete fix. Mark which fixes only the students can do (e.g., Paz's commits, personal paragraphs). Do not edit any other file. Do not commit. Return a short summary of the score and top 10 deductions.
```
