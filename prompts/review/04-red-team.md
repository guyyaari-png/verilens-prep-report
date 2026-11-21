# 04-red-team: צוות אדום

**נשלח:** 2026-11-21 18:48 UTC · **הדוח:** [`work/review/04-red-team.md`](../../work/review/04-red-team.md)

## הפרומפט, כפי שנשלח

```text
You are a strict "red team" grader for a university course assignment. You did not write this work; be demanding and specific. Do NOT edit any project files; only write your report.

Course: "Vibe Coding and AI applications in science and daily life", University of Haifa, Dr. Yoram Segal. Assignment 2: produce a preparatory report (דוח מכין) as a PDF built in LaTeX, according to the principles of lesson 3: an organized project (main.tex that only lists chapters, one chapter per file, figures in one folder, references.bib, drafts in work/), the team's OWN CLS template file with the designs (with version number and changelog, command list, README), correct Hebrew-English (every English word and number marked, tables with first column on the right, diagrams built in an English environment), real sources (biblatex + biber), compilation in four runs (lualatex, biber, lualatex, lualatex), and several review agents each checking something different. A preparatory report in engineering is a contract between student and lecturer: what will be built, deliverables, chart types, acceptance criteria; it should include structure, problem definition, literature review, plan and risks. The lecturer encourages thinking big. Submission is via a GitHub repository with README and final files; in assignment 1 the grader also checked: a prompts folder with the real numbered sequence of prompts, meaningful commit history, both partners contributing, professional README with screenshots, creativity and personal voice, the PDF named <group-code>-ex<NN>.pdf (here Haifa-01-ex02.pdf). Students give themselves a self-grade; the grader is harsher when the self-grade is high (here 93).

Material: /home/claude/verilens-report (main.tex, my-template.cls, chapters/, figures/, references.bib, work/, report.pdf). The topic: journalistic ethics of AI-generated fake images used to drive traffic; the project is "VeriLens", an image-verification platform plus an ethics standard (TRUTH-IMG). The lecture summary PDF is /mnt/user-data/attachments/2dff8f1f-3e99-5d9c-8278-cfd416809c05/9944e85d-________l03-summary.pdf (Hebrew; pages 13-16 project structure, 17-25 Hebrew/English and CLS, 27-33 graphics, sources, quality control, page 34 assignment) — read the relevant pages.

Task: Read the PDF (render pages or extract text) and the sources. Grade the work out of 100 with a rubric you define from the requirements above (state weights). For each rubric item: score, evidence (file/page), and the single most valuable fix. Then list the top 10 issues that would cost the most points, most severe first, each with a concrete fix. Also check content quality of the report as a preparatory report: internal consistency of numbers (budget, page counts, requirement counts, dates), unsupported claims, missing elements, anything that reads like padding or AI filler. Note what cannot be judged from local files (git history, partner contributions) as separate risks.

Write the report in Markdown to /home/claude/verilens-report/work/review/04-red-team.md, starting with the overall score and one-line verdict. Then reply with a short summary (max 20 lines).
```
