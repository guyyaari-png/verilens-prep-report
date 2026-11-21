# Red-team review 04: VeriLens preparatory report (Haifa-01, assignment 2)

**Overall score: 56 / 100. Self-grade 93 is not defensible.**
**Verdict:** The engineering contract looks impressive, but the submission fails its own compliance table. It claims a README, a prompts folder, TEMPLATE.md, review-agent reports and a correctly named PDF, and none of them exist locally. The executive summary also shows reversed Hebrew on page 6 and the PDF prints "??" five times.

Reviewer stance: strict, as the course grader is when a self-grade is high. Sources used: `/home/claude/verilens-report/*` (all .tex, .cls, .bib, build scripts, report.log/.blg), `report.pdf` rendered page by page, and the L03 lecture summary (pp. 13-35: project structure, BiDi, CLS, graphics/sources, QA, assignment 2). I had no network access, so I checked citations for plausibility but did not open them live.

---

## 1. Rubric (weights derived from the L03 assignment and the assignment-1 grading criteria)

| # | Criterion | Weight | Score | Evidence | Single most valuable fix |
|---|---|---|---|---|---|
| 1 | Organized project (main.tex only lists chapters, one chapter per file, figures in one folder, references.bib, drafts in work/) | 10 | 7 | `main.tex` is clean (only `\input`s). There are 17 chapter files and 17 TikZ figure files in `figures/`. **But** `work/` was empty before this review: no drafts, no notes. `prompts/` does not exist. Build artifacts (`report.aux/.bcf/.log/...`) sit in the root. | Put real drafts and notes in `work/` and add `prompts/`. Add a `.gitignore` for build artifacts. |
| 2 | Own CLS template (designs, version number + changelog, command list, README, example) | 12 | 7 | `my-template.cls` is genuinely the team's own and was built in the six stages the lecture describes. It has v1.0, four box types, a safe-diagram environment and RTL-first tables. **But** the header says "command list and examples: TEMPLATE.md", and **TEMPLATE.md does not exist**. There is no README, no example document and no help/command-list output (lecture §11.4, "a template that explains itself"). The changelog has a single entry. | Write `TEMPLATE.md` (every command, one line each, plus an example) and `example.tex`. Bump to v1.1 with a changelog line for every fix in this review. |
| 3 | Correct Hebrew-English (every English word and number marked, first table column on the right, diagrams in an English environment) | 12 | 6 | Prose is well marked, first columns are on the right, and diagrams use `ltrdiagram`. **But** there are systematic reversed-Hebrew cells (§2.1 below) in Tables 1.2, 5.1, 8.4, 11.1 and 15.1. Numbers inside `\he{}` in figures are unmarked, giving "08 עד 100" and "03 עד 79" in Fig 8.3 and "001 לקוחות" in Fig 15.2. The TRUTH-IMG version prints as **"0.1"** (Table 8.3 and the list of tables). The Hebrew mako entry in the bibliography is mis-ordered ("?AI"). These are exactly the "six classic errors" from lecture §9.3. | Fix the column-direction bug **in the template** (§2.1), then wrap every number in figures in `\num`. Re-run the B2 BiDi audit page by page. |
| 4 | Real sources, biblatex + biber | 10 | 6 | biber runs with 29 entries in IEEE style. **But** about half are secondary or aggregator pages instead of primary sources: Reuters Institute via NewscastStudio, NewsGuard via The Decoder, AP via The Decoder, the C2PA "<1%" figure via a SoftwareSeni blog, competitors via "tech-insider.org", and Clarity via "Let's Data Science". "Liar's dividend" is used without citing Chesney and Citron. Detection literature is a single arXiv paper. Four entries use types the IEEE style has no driver for (`legislation`, `standard`; see report.log). The claim about a suspended camera C2PA signature has no citation. | Replace aggregators with primary sources and add 4-6 peer-reviewed papers (deepfakes and liar's dividend, AI-image detection, visual journalism ethics). Change `@standard`/`@legislation` to `@manual`/`@misc`. |
| 5 | Four-run build, clean log, correct output | 6 | 3 | `build.sh` and `build.ps1` do lualatex, biber, lualatex, lualatex. **But** the log has an undefined reference (`tab:review`, which prints as ?? 5×), two overfull boxes over 5pt (19.2pt and 9.5pt in ch09 lines 45-46), `No driver` warnings and a missing `csquotes`. The output is `report.pdf`, not **Haifa-01-ex02.pdf**: the assignment-1 grader already flagged the name and said deductions start now. PDF Title/Author metadata is empty. | Change to `-jobname=Haifa-01-ex02` and get a log with 0 undefined references and 0 overfull boxes over 5pt (lecture Prompt 7). |
| 6 | Several review agents, each checking something different | 8 | 1 | `chapters/review-summary.tex` contains only a comment, and `work/review/` held no reports. Yet the version history (v2.0: "סבב סוכני בדיקה"), §9.5 and Appendix A all claim a completed review round. | Run at least three distinct agents (BiDi/typography, sources/citations, numbers/consistency, layout). Save `01-…md`, `02-…md` and `03-…md`, fill Table `tab:review` with finding, fix and status, and recompile. |
| 7 | Preparatory-report content: structure, problem definition, literature review | 12 | 10 | This is a strong part. It has a problem statement box, stakeholder map plus table, scope in/out, assumptions with fallbacks, a taxonomy (Table 2.1), an ethics frameworks table and counter-arguments, a competitor matrix and a stated gap. | Add an academic core to the literature review (see 4) and shorten the business material in the literature chapter. |
| 8 | Contract quality: what will be built, deliverables, chart types, acceptance criteria, plan, risks | 15 | 9 | The form is excellent: D-01…D-10 with acceptance criteria, chart types fixed (histogram, ROC, bar: FR-19/D-06/T-08), 12 tests, traceability matrix, WBS, Gantt, RACI, risk register and heat map. **But** the contract cannot be fulfilled by the people who sign it. It needs 18 months, ₪9.6M, a 14-person staff with CEO/CTO, 1.2M licensed images, 5 newsroom pilots and an external pen test, running Jan 2027 to Jun 2028. The semester (א׳ תשפ״ז) ends long before M2, which promises a "progress report per the course template" in month 7 (Jul 2027). Nothing defines what Guy and Paz will actually deliver in this course. | Add a "course scope" chapter: an MVP the two of you will deliver this semester (for example a C2PA reader, 2 open-source detectors, a calibrated score, a decision log, the three charts on a public benchmark and TRUTH-IMG v0.9), with dates inside the semester. Keep the 18-month plan as the "think big" roadmap. |
| 9 | Internal consistency of numbers and claims | 5 | 2.5 | Several things check out: the decision matrix (68/70/54/84 and all three sensitivity runs), budget sums (8,430, then 9,442, then 9,600), the 99.9% availability figure (44 min), peak-hour capacity, the 3 red risks, and the counts 34/12/10/6. **But** there are 8 real contradictions (§3). | Fix the eight contradictions in §3. |
| 10 | Repo and process (README with screenshots, numbered real prompts, meaningful commits, both partners) | 6 | 1 | Local evidence only: no README.md, no prompts/ and no git repo. Appendix A says these exist. | Create them for real. See §5 for what cannot be judged locally. |
| 11 | Creativity, personal voice, thinking big | 4 | 3.5 | Thinking big, TRUTH-IMG, the night-shift scenario (§8.4) and the "rule 7: traffic is not a reason" idea are original. The voice is consultant-generic (§4), and no link to either author's own field or experience is stated. | Add one paragraph on why *you* chose this topic, from your own field or work. |
| | **Total** | **100** | **56** | | |

Upside: fixing issues 1-4 and 7 in §2 is mostly mechanical and would plausibly bring this to about 75-80. Fixing issue 5 (course scope) as well is the route to 85+.

---

## 2. Top 10 issues by points at risk (most severe first)

1. **False compliance claims (Appendix A, Table A.1, p. 43).** It lists `README.md` with screenshots, `prompts/` with numbered prompts, `TEMPLATE.md`, `Haifa-01-ex02.pdf` and review reports in `work/review/`. None of these exist in the project folder. A grader who checks one row and finds it false will distrust every other row. **Fix:** create each artifact for real, or delete the claim. Never submit a compliance row you have not verified.

2. **No review agents, and "??" printed in the PDF.** `review-summary.tex` is an empty stub, so `\ref{tab:review}` is undefined. "??" appears on p. 27 (§9.5) and four times on p. 43 (Appendix A). This requirement is explicit in assignment 2. **Fix:** run 3-4 differently scoped agents (lecture §15: "the checker is never the writer"). Save the numbered reports, add a table (agent, scope, findings, fixed/open) in `review-summary.tex` and recompile.

3. **Reversed Hebrew in tables, starting on page 6.** Root cause: in `l`/`c` columns, a cell that *starts* with `\num{}`/`\en{}` takes LTR direction, and the Hebrew after it is laid out backwards. pdftotext confirms these cells:
   - Table 1.2 (exec summary): "תוחפל 90%", "רתויה לכל 2%", "םישדוח 18", "ןוילימ 9.6 ₪"
   - Table 5.1, G-4…G-6 (success-metric column)
   - Table 8.4: "ןוילימ 2/50"
   - Table 11.1: **all seven** milestone names, e.g. "ןיכמ חוד רושיא :M0"
   - Table 15.1: "חפנ יפל שדוחב … דע", "הנשב"

   The `p{}`/`Y` cells (for example Table 14.1) are fine, which confirms the diagnosis. **Fix in the template, not in the text** (lecture §12): give RTL tables a paragraph-type column (for example `>{\raggedleft\arraybackslash}p{..}`, or the existing `Y`) for any cell that can begin with a number or English. Add it to the command list, or force Hebrew direction at the start of every cell. Then run Prompt B2 on every page.

4. **Unmarked numbers inside Hebrew in figures, plus the "1.0 → 0.1" error.**
   - Fig 8.3 (the binding decision flow!) prints "**08** עד 100" and "**03** עד 79" (`fig-flow.tex` l.15-16).
   - Fig 15.2 prints "**001** לקוחות משלמים".
   - Gantt labels "3א/3ב" and the parentheses in Fig 15.1 ("(2031)") render inconsistently.
   - Table 8.3's caption `\num{1}.0` prints as **"גרסה 0.1"** in both the table and the list of tables.

   **Fix:** grep `figures/*.tex` for digits inside `\he{}` (about 40 hits) and wrap each in `\num{}`. Change the caption to `\num{1.0}`.

5. **The contract is not executable by its signatories.** See rubric item 8. The lecturer is cast as a "client" approving an ₪9.6M, 14-person, 18-month startup. Acceptance tests (T-09…T-11) depend on 5 newsrooms that have not signed. VL-Wild is to be held by "המוסד האקדמי" without its consent. **Fix:** add a two-tier scope. (a) A *course deliverable* with dates inside the semester and acceptance criteria you control, for example detection and false-positive rates on a named public benchmark, the three binding charts produced from real runs, and a TRUTH-IMG draft. (b) The *vision* (the current chapters 10-15) clearly labelled as post-course.

6. **The template is not self-documenting.** There is no TEMPLATE.md, README, example file or command list, even though `my-template.cls` l.6, §9.5 and Table A.1 all point to TEMPLATE.md. The changelog has one entry dated the same day as the report. **Fix:** write `TEMPLATE.md` (each command with its one purpose and a one-line example), add `example.tex`, and record every fix from this review as v1.1, v1.2 and so on.

7. **Build and submission hygiene.** The output name is wrong (`report.pdf`): the assignment-1 report warned about this, and the rule allows a 30-point deduction for format violations. There are 2 overfull boxes over 5pt (19.2pt and 9.5pt in the §9.5 `\code` paths), 4 `No driver` biblatex warnings, a missing `csquotes`, and empty PDF metadata. **Fix:** use `-jobname=Haifa-01-ex02`, add `\hypersetup{pdftitle=…,pdfauthor=…}`, allow `\code` to break (or shorten the paths), and add `\usepackage{csquotes}`.

8. **Internal inconsistencies.** These are listed in §3.

9. **Source quality and uncited claims.**
   - Key numbers are cited to secondary blogs: Reuters Institute 12%/62%/43% via NewscastStudio; "<1% of news images", the camera list and Pixel 10 via SoftwareSeni; NewsGuard 3,006 via The Decoder; "300-500 new sites per month" is unattributed in the source note.
   - "A camera's C2PA signing was suspended after a vulnerability" (§4.1.3) has no citation.
   - "Liar's dividend" (§2.1) is uncited (Chesney and Citron, 2019).
   - The watermark grace date ("2 December 2026", §4.1.2) comes from a law-firm blog. Verify it against the Official Journal or Commission text.
   - Standards (GAO, Shipley, ISO 31000/15288/29148) are cited as authority for routine practice. This reads as name-dropping.

   **Fix:** use the primary source for every number and add peer-reviewed papers on detection and on deepfakes and trust.

10. **Layout defects (lecture Prompt 8 checklist).**
    - p. 7 is nearly empty: one spilled line ("נמצאת בנספח א.").
    - Heading 11.3 "אבני דרך" is stranded at the bottom of p. 30, with its table on p. 31.
    - pp. 33, 35, 36, 39 and 42 are one-half to two-thirds empty; the heat map sits alone on p. 35.
    - Front-matter tables are numbered "0.1/0.2".

    **Fix:** use `[H]`/`\FloatBarrier` for tables directly under their heading, tighten the exec summary by 2 lines, and number front-matter tables without a chapter prefix.

---

## 3. Content audit as a preparatory report

### 3.1 Numbers that check out
- Decision matrix: A = 68, B = 70, C = 54, D = 84. All three sensitivity scenarios recompute correctly (80/72, 82/79, 81/~77).
- Budget: line sum 8,430; 12% reserve = 1,012; total 9,442; rounded to 9,600. The "reserve + rounding = 1.17M", "+10% salary ≈ 0.7M" and "3-month slip ≈ 1.2M" figures are right. The budget pie shares (72/9/7/12) are right.
- Capacity: 2M/month ×4 peak ≈ 11,000/h; 50M ≈ 280,000/h. 99.9% availability = 44 min. 3 red risks (20/16/15).
- Summary counts: 6 goals; 34 requirements (21 FR + 5 PR + 4 SR + 4 CR); 12 tests; 10 deliverables. Every M requirement appears in the traceability matrix.

### 3.2 Contradictions and errors
1. **The planned histogram (Fig 8.4, `fig-dist.tex`) contradicts the targets.**
   - Real bars sum to 69.4 and synthetic bars to 43.6, although the y-axis says "% of images".
   - Synthetic images scoring ≥80 are 34/43.6 = **78%**, below the 90% detection target.
   - The uncertain band (30-80) holds (9.8+8.2)/113 ≈ **16%**, above the claimed "<15%".
2. **VL-Wild timeline is impossible.** Its real images come "from the pilot newsrooms, last 12 months" (§10.1) and it must be ready at M1 (month 5). Pilots only sign by month 10 (A-01) and go live at M5 (month 13).
3. **A-01 against OP-04.** A-01 and R-08 say "7 candidates for 5 slots". OP-04 says letters of intent from even 3 newsrooms are still to be obtained.
4. **Revenue against price per image.**
   - SOM: 1,000 orgs × ₪3,500/month = ₪42M/yr.
   - Gross margin (§12.2) assumes ₪0.15 per image. At the stated 50M images/month that is ₪90M/yr.
   - At ₪3,500 per org the implied price is ₪0.07 per image, which changes the margin claim.
   - The ImageWhisperer comparison (€500-900 for 1,500-6,000 checks ≈ €0.15-0.60 per check) means VeriLens undercuts it 4-15×. The report calls this "the same price range".
5. **Pilot volume.** 2M images/month across 5 pilot newsrooms is about 400k per newsroom per month, roughly 13k per day. The 3-year target implies about 50k per newsroom per month. The pilot load is about 8× the steady-state per-customer load, and no source supports it.
6. **Scenario logic (§8.4).** The image's earliest appearance is "an hour before the fire" on an AI-image account. That is the γ₂ context contradiction, so it should push the score into "חשד גבוה", not 64 "לא ודאי". Separately, "we published 16 minutes after competitors" is inconsistent: the story was published at 23:44 and the photo replaced at 23:58.
7. **Undefined actors and processes.** "Weights were set by the expert committee" (§7.2) and "first draft by the committee" (§9.3): no committee is defined anywhere. The RACI matrix uses CEO/CTO/Head-of-ML roles that do not exist on a 2-person team.
8. **Reverse-image-search budget.** ₪6k/month for 2M lookups/month is about ₪0.003 per lookup, which is implausibly low for commercial APIs. Cite a quote or raise it.

Also: R-02 is garbled ("לא מושג יעד שיעור התרעות שווא מעל 2%"). The G-6 measurement is due in month 16, but T-07 (load) is part of the month-12 acceptance. Some traceability links are weak: FR-01 and FR-02 are traced to the load test T-07, and FR-10 and FR-13 to T-01.

### 3.3 Unsupported claims
- "A market with no local supplier" for Hebrew and Arabic. Clarity itself was Israeli, and there are local fact-checkers.
- "Almost all model errors reach a human" (§8.5).
- "SAM ≈ 10% of TAM" (Fig 15.1): no basis given.
- "Gross margins >90%": this ignores human reviewer and search-API costs.
- "VeriLens will meet the EU labelling obligation" (exec summary). Article 50(4) binds deployers that *generate* deepfakes. How it applies to newsrooms that verify third-party images is not argued.

### 3.4 Missing elements
- What the students will build and deliver this semester (see issue 5).
- A data-ethics and licensing note for scraped or "in the wild" fake images.
- Evaluation on a **public** benchmark, so that results are reproducible without pilots.
- An explicit statement of which deliverables use AI, and how prompts are logged.

---

## 4. Padding and AI-filler signals

The tone is polished consultant prose that could have been written about any startup. Examples:
- "זה הערך שהמוצר מוכר"
- "את הפער הזה VeriLens סוגרת"
- "הפרויקט מאפשרי להכרחי"

Other filler patterns:
- **Authority padding.** Shipley is cited to justify having a compliance table, and the GAO guide to justify listing assumptions. ISO 31000 is invoked for a plain P×I matrix.
- **Contract theatre.** A signature table for the lecturer as "client (הלקוח)", a "Change Request" regime and "the lecturer is not bound to check unapproved changes". This does not fit a course report.
- **Business scope creep.** The TAM/SAM/SOM chart, funding sources and a 5-year roadmap take about 3 pages a course grader will not reward.

No personal voice: nothing says why *these* students chose this topic or what they bring to it. Assignment 1 was marked down for "creativity, originality and personal voice" and "project tied to the student's own field".

Privacy: both national ID numbers are printed on the cover **and in the footer of every page**, and the repo will be public. Remove them, or keep them on the cover only if the course explicitly requires it.

---

## 5. What cannot be judged from local files (separate risks)

| Risk | Why it matters | What to verify before submitting |
|---|---|---|
| Git history | Assignment 1: "6 of 11 commit messages generic". This time it is graded. | Frequent commits with meaningful messages that show incremental work (template stages, chapters, review fixes). |
| Both partners contributing | Assignment 1: "only ONE account appears … no pulls". This time it is graded. | Commits **and pulls** from both Guy's and Paz's accounts. |
| Prompts folder | Assignment 1: "one summary file written after the work". | `prompts/` with the real, numbered, timestamped sequence, including corrections. No after-the-fact summary. |
| README with screenshots | Graded in assignment 1. Currently missing locally. | README with PDF page screenshots, build instructions, structure tree and a template section. |
| PDF file name | Possible 30-point format deduction. | `Haifa-01-ex02.pdf` in the repo root and in the Moodle form. |
| Self-grade field | The grader is harsher at 93. | Consider a self-grade that matches the evidence, or close the gaps first. |
| Repo accessibility | An unopenable repo means a grade of 0 with no bonus. | Test the link from a logged-out browser. |
| Citations live | The bib header claims every entry was checked against its page. I could not verify this offline. | Open every URL, and replace aggregator pages with primary sources. |
