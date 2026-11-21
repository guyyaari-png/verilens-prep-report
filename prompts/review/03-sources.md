# 03-sources: מקורות

**נשלח:** 2026-11-21 18:48 UTC · **הדוח:** [`work/review/03-sources-check.md`](../../work/review/03-sources-check.md)

## הפרומפט, כפי שנשלח

```text
You are a sources and fact-checking reviewer for a Hebrew preparatory report (דוח מכין) about a startup idea, "VeriLens": a platform that verifies news images and an ethics standard against AI-generated fake images used to drive traffic. Do NOT edit any project files; only write your report.

Files: /home/claude/verilens-report/references.bib (all sources), /home/claude/verilens-report/chapters/*.tex (the text; citations appear as \cite{key}). Today is 2026-11-21.

Task:
1. For every entry in references.bib that has a URL, open the page (WebFetch; use WebSearch if a page fails) and check that it exists and that title, author/organization and date match the bib entry. For entries without URL (journal article with DOI, arXiv eprint 2502.10920, ISO standards, Shipley Proposal Guide, GAO-20-195G, EU Regulation 2024/1689), confirm they exist via search.
2. For each \cite in the chapters, check that the specific claim or number in that sentence is actually supported by the cited source. Prioritize claims with numbers. Known key claims to check include: Pentagon fake image May 2023 and market dip; DiResta & Goldstein 125 Facebook pages, 40 million views, Meta feed share 8% to 24%; NewsGuard 3,006 AI content farms and 300-500 per month; EU AI Act Article 50 from 2 August 2026 and grace period to 2 December 2026; C2PA under 1% of news images, cameras list; Canon May 2026 system tested with Reuters; Reuters Institute 12% / 62% / 43%; "All Eyes on Rafah" about 45 million shares; ImageWhisperer 18 models, clients Axel Springer and Mediahuis NRC, price 500-900 euro per month; Reality Defender ~33M, Hive ~120M, Sensity ~3.2M, GetReal 17.5M; TrueMedia shut down Jan 2025 and moved to Georgetown; Clarity acquired by Deel Aug 2026; MarketsandMarkets 857M (2025) to 7.27B (2031), CAGR 42.8%.
3. Flag any number in the text that has no citation but looks like an external fact (as opposed to the team's own targets/estimates).

Do not invent sources. If you cannot verify something, say "unverified" rather than guessing.

Write the report in Markdown to /home/claude/verilens-report/work/review/03-sources-check.md: a one-line verdict, then a table (key | exists? | metadata OK? | claims checked | problems), then a list of unsupported or wrong claims with file and line and the suggested correction. Then reply with a short summary (max 15 lines).
```
