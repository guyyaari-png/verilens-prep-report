# BiDi audit of report.pdf (Prompt B2)

**Verdict: FAIL. Not ready to submit. 22 BiDi/layout findings: 7 critical, 4 high, 7 medium, 4 low. There are also 3 non-BiDi notes.**

Method: I extracted each page with `pdftotext -layout` (45 pages). I scanned the text for Hebrew words that start with a final letter or end with a non-final form, compared English tokens and numbers against the sources, and checked footers. I rendered every page at 70 dpi (`pdftoppm -r 70`; images are in `/tmp/claude-0/-home-claude/2dff8f1f-3e99-5d9c-8278-cfd416809c05/scratchpad/bidi-audit/`). I looked at each page and confirmed every suspect at 150–400 dpi. Every finding below was confirmed visually. Text that pdftotext scrambled but that renders correctly is not reported.

Page notation: **p.N (PDF i)**. N is the printed footer number ("עמוד N מתוך 44"). i is the PDF page index. The printed number is always the PDF index minus 1 (the cover has no footer). The footer says "מתוך 44" while the PDF has 45 pages. This is consistent because the cover is not counted.

Probable common cause of the critical items (a hypothesis to check, not verified in code): each affected table cell or TikZ node **begins with** `\num{}`, `\en{}` or `\req{}` (for example `\num{90\%} לפחות`, `\en{M0}: אישור דוח מכין`, `\req{IF-01} מערכת ניהול התוכן`). The cell's paragraph is then set LTR, and the Hebrew in that cell comes out letter-reversed.

---

## Critical: Hebrew printed letter-reversed (unreadable)

| # | Page | Location | Exact text as printed | Should read | Rule broken |
|---|------|----------|----------------------|-------------|-------------|
| 1 | p.6 (PDF 7) | Table 1.2 "היעדים המחייבים", column "יעד" (executive summary) | `תוחפל 90%` (×2, rows 1 and 5), `רתויה לכל 2%`, `םישדוח 18`, `₪ ןוילימ 9.6` | 90% לפחות / 2% לכל היותר / 18 חודשים / 9.6 מיליון ₪ | Hebrew word starting with a final letter (ם, ן) = reversed Hebrew. Source `ch01-exec.tex:38-44` |
| 2 | p.16 (PDF 17) | Table 5.1, column "מדד הצלחה", rows G-4, G-5, G-6 | `TRUTH-IMG יפל תוגיותמ ומסרופש תונומתהמ 100%`; `תובייחתמ 20 ;תוכמסומ טולייפ תוכרעמ 5`; `99.9% תונימז ;שדוחב תונומת ןוילימ 2` | 100% מהתמונות שפורסמו מתויגות לפי TRUTH-IMG; 5 מערכות פיילוט מוסמכות; 20 מתחייבות; 2 מיליון תמונות בחודש; זמינות 99.9% | Reversed Hebrew; the word order and the semicolon position are also flipped. Source `ch05-goals.tex:21-23` |
| 3 | p.21 (PDF 22) | Table 8.1, column "ממשק", all 5 rows | `ןכותה לוהינ תכרעמ IF-01`, `םלצה תייצקילפא IF-02`, `ךופה הנומת שופיח IF-03`, `לוטיב תומישר IF-04`, `םוסרפ תותשר IF-05` | IF-01 מערכת ניהול התוכן … | Reversed Hebrew. The ID also sits on the wrong side of the name. Source `ch08-design.tex:20-24` |
| 4 | p.31 (PDF 32) | Table 11.1 "אבני הדרך", column "אבן דרך", rows M0–M6 | `ןיכמ חוד רושיא :M0`, `םינכומ םירגאמ :M1`, `תומדקתה חוד :M2`, `רוביצל ןקת תטויט :M3`, `תינכט הלבק :M4`, `ליעפ טולייפ :M5`, `םויס חודו תיעצבמ הלבק :M6` | M0: אישור דוח מכין … | Reversed Hebrew. Source `ch11-management.tex:28-34` |
| 5 | p.25 (PDF 26) | Table 8.4, row "תמונות בחודש" | `ןוילימ 2`, `ןוילימ 50` | 2 מיליון / 50 מיליון | Reversed Hebrew. Source `ch08-design.tex:141` |
| 6 | p.37 (PDF 38) | Table 15.1, column "תמחור" | `חפנ יפל שדוחב ₪ 15,000 דע 1,500`; `הנשב ₪ 25,000` | 1,500 עד 15,000 ₪ בחודש לפי נפח; 25,000 ₪ בשנה | Reversed Hebrew. The price range also reads backwards. Source `ch15-business.tex:20-21` |
| 7 | p.1 (PDF 2) | Glossary "רשימת קיצורים ומונחים", first row | `AI )תיתוכאלמ הניב(` | AI (בינה מלאכותית) | Reversed Hebrew and flipped parentheses. Source `ch00-front.tex:40` |

## High: wrong numbers (reversed digits or decimals)

| # | Page | Location | Exact text as printed | Should read | Rule broken |
|---|------|----------|----------------------|-------------|-------------|
| 8 | p.22 (PDF 23) | Figure 8.3 (decision flow), the two lower-right boxes | `08 עד 100: "חשד גבוה"`; `03 עד 79: "לא ודאי"`; `בודק אנושי )15 דק׳)` | 80 עד 100; 30 עד 79; (15 דק׳) | Reversed numbers in a range (80→08, 30→03) and a flipped parenthesis. These thresholds are the core decision rule. Source `figures/fig-flow.tex:15-16` |
| 9 | p.24 (PDF 25) and List of Tables p.5 (PDF 6) | Caption of Table 8.3 | `עשרת הכללים של TRUTH-IMG גרסה 0.1` | גרסה 1.0 | Reversed decimal (1.0→0.1). It contradicts "TRUTH-IMG 1.0" in Tables 11.1 and 14.1. Source `ch08-design.tex:110` `\num{1}.0` |
| 10 | p.38 (PDF 39) | Figure 15.2 (roadmap), milestone under "שנה 2" | `001 לקוחות משלמים` | 100 לקוחות משלמים | Reversed number. Source `figures/fig-roadmap.tex:8` |
| 11 | p.23 (PDF 24) | Section 8.4, list item 3 | `50:42:23` | A single HH:MM time (the other items are 23:41, 23:42, 23:44 …) | Reversed or split time. Source `ch08-design.tex:72` `23:\num{42}:50`; the intended value is unclear and needs an author decision |

## Medium: flipped parentheses, order and punctuation

| # | Page | Location | Exact text as printed | Rule broken |
|---|------|----------|----------------------|-------------|
| 12 | p.26 (PDF 27) | Figure 9.1 (V-model), left boxes | `דרישות מערכת (פרק 6(`, `ארכיטקטורה (פרק 8(` | Parenthesis flipped (both parens face the same way). `figures/fig-vmodel.tex:7-8` |
| 13 | p.32 (PDF 33) | Figure 12.1 legend | `כוח אדם (72%(`, `מחשוב ונתונים (9%(`, `משפט, אבטחה, תקן ותפעול (7%(`, `רזרבה ועיגול (12%(` | Parentheses flipped around percentages. `figures/fig-budget.tex:12` |
| 14 | p.37 (PDF 38) | Figure 15.1 (TAM circle) | `7.27 מיליארד $ )2031(` | Parentheses flipped around the year |
| 15 | p.41 (PDF 42) | Page footer (bibliography page) | `גיא יערי )[הוסר]( ופז ניסים )[הוסר](` | Mirrored footer: the parentheses are flipped on this page only, while every other footer is correct. This is likely an LTR context from the English bibliography running into the footer |
| 16 | p.30 (PDF 31) | Figure 11.1 (WBS) and Figure 11.2 (Gantt) | WBS boxes run `1. ניהול` … `6. פיילוט` from **left to right**. Gantt labels print as `3א. שכבות 1 עד 3`, `3ב. שקלול וכיול`, and `2. מאגרי נתונים` with the period on the LTR side | In an RTL document the first item should be on the right. Inside the LTR TikZ box, "3א." reads as "א3" and the list period is on the wrong side |
| 17 | p.43 (PDF 44), p.44 (PDF 45) | Appendix table captions vs the List of Tables (p.5, PDF 6) | The caption shows `טבלה א.1` / `ב.1` in LTR order, while the List of Tables shows `1.א` / `1.ב` in RTL order | The two places show the same table number in opposite orders, so one of them is reversed (the caption is the LTR one) |
| 18 | p.36 (PDF 37) | Table 14.1, row D-02 | `תוספים למערכות ניהול תוכן: -Word` / `Press Arc XP-ו` | An English word is hyphenated across lines with the hyphen shown on the wrong (left) side: "WordPress" is split as "-Word / Press" |

## Low: layout

| # | Page | Location | Issue |
|---|------|----------|-------|
| 19 | p.36 (PDF 37); p.28 (PDF 29); p.34 (PDF 35) | Table 14.1 (D-03 `ממשק   API   מתועד,   כולל`, D-05, D-08, D-09); Table 10.1 (T-08, T-10 `ירידה  ≥  80%`); Table 13.1 (R-01, R-05, R-06, R-10) | Large gaps inside a line: justified narrow `p{}`/X cells stretch the spaces between words |
| 20 | p.9 (PDF 10), p.22 (PDF 23), p.30 (PDF 31), p.32 (PDF 33), p.38 (PDF 39) | Figures 2.2 (timeline), 8.2 (layers), 11.2 (Gantt), 12.1 (stacked bar), 15.2 (roadmap) | Time and flow run left to right in an RTL document. This is acceptable for charts, but the direction is not consistent (the Fig 15.2 arrow points right toward "שנה 5", while Fig 8.2 flows from קליטה on the left to the editor on the right). It needs a conscious decision |
| 21 | p.29 (PDF 30) | Figure 10.3 ROC | The label `אזור היעד` overlaps the orange curve. The legend keys sit on the left of the Hebrew labels (LTR legend) |
| 22 | p.23 (PDF 24) | Figure 8.4 histogram legend | The legend swatches sit between the two labels, so it is ambiguous which swatch belongs to `תמונות אמיתיות` and which to `תמונות סינתטיות` |

## Non-BiDi notes (outside the B2 scope, but blocking)

- **Unresolved references `??`**: p.27 (PDF 28) §9.5 "ובסיכום בטבלה ??"; p.43 (PDF 44) Table א.1 has three: "בדיקת כיווניות בטבלה ??", "בדיקת מקורות בטבלה ??", "טבלה ?? (עמ׳ ??)".
- p.7 (PDF 8) contains only one line, "נמצאת בנספח א.", which is an orphan line at the end of chapter 1.
- p.25 (PDF 26) is half empty: Table 8.4 floats alone in the middle of the page.

## Checked and passed

- **Table of contents (p.2–3)**: all section numbers are in the correct order (2.1, 2.2 … 15.4, not reversed), all rows are right-aligned, and the page numbers are on the left with leaders. The List of Figures and List of Tables are also correct, apart from item 17.
- **Table column order**: in every table the first column (מזהה / מונח / גרסה / בעל עניין etc.) is on the RIGHT.
- **Headers and footers**: they are not mirrored on any page except p.41 (item 15). The header has "דוח מכין · VeriLens" on the right and the chapter name on the left. The footer has "עמוד N מתוך 44" in the centre and the author line on the left.
- **English words and acronyms**: none are reversed. Every English token in the PDF text matches the sources (differences were only hyphenation and URL line breaks).
- **Diagrams and backgrounds**: none touch the page edge, and the cover frame and callout boxes stay inside the margins.
- **Other numbers in running text**: dates (10.11.2026, 21.11.2026), currency (9.6 מיליון ₪, 0.25 ₪, 0.012 ₪), percentages (12%, 99.9%), ranges (300 עד 500, 1 עד 5) and IDs (FR-01, T-01, R-01 …) render correctly.
