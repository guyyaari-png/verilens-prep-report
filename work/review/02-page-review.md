**Verdict: not ready to submit. There are 4 high-severity defects (undefined references, reversed Hebrew text, digits printed backwards, a chart missing a label) that a reader will notice at once. 24 findings in total: 4 high, 13 medium, 7 low.**

# Prompt 8: Page-by-page layout review

- PDF: `report.pdf`, 45 PDF pages. The cover is not numbered, so **printed page = PDF index − 1**.
- Method: every page was rendered at 75 dpi into the scratchpad `page-review/` folder and viewed. Suspicious areas were re-rendered at 150 or 300 dpi. `report.log` was checked (2 overfull hboxes, `tab:review` undefined). Every `\label{fig:…}` and `\label{tab:…}` was grepped for a matching `\ref` in `chapters/`.
- Notation: **PDF n / p. m** means PDF page index n, printed page number m.

---

## HIGH

### H1. Undefined reference "??" (review table missing)
- **PDF 28 / p. 27:** the item "בקרת איכות" in §9.5 ends with "ומסוכמים בטבלה **??**."
- **PDF 44 / p. 43:** Table א.1 shows "בטבלה ??" twice and "טבלה ?? (עמ׳ ??)" once.
- Cause: `chapters/review-summary.tex` holds only a comment line, so `tab:review` is never defined. The log confirms "There were undefined references".
- **Fix:** fill `review-summary.tex` with the review-round table labelled `\label{tab:review}`, or remove all four `\ref`/`\pageref{tab:review}` calls.

### H2. Hebrew text printed backwards in table cells that begin with an English, code or number token
- **PDF 2 / p. 1:** in the abbreviations table, the first row shows "תיתוכאלמ הניב( AI )" instead of "AI (בינה מלאכותית)".
- **PDF 22 / p. 21:** in Table 8.1, every cell in the "ממשק" column is reversed ("IF-01 תכרעמ לוהינ ןכות"). The cells also stick out past the right edge of the table.
- **PDF 32 / p. 31:** in Table 11.1, every cell in the "אבן דרך" column is reversed ("M0: ןימכ חוד רושיא" and so on).
- **PDF 38 / p. 37:** in Table 15.1, the "תמחור" column is reversed ("חפנ יפל שדוחב ₪ 15,000 דע 1,500", "הנשב ₪ 25,000").
- Cause: each cell starts with `\en{}`, `\req{}` or `\num{}`, so the paragraph is set left-to-right.
- **Fix:** start each of these cells with Hebrew (for example "אישור דוח מכין (\en{M0})", "מערכת ניהול התוכן \req{IF-01}", "החל מ-\num{1,500}"), or wrap the Hebrew part of the cell in `\he{…}`.

### H3. Digits printed backwards inside diagrams (wrong numbers)
- **PDF 23 / p. 22, Fig. 8.3:** "**08** עד 100" should read 80 to 100, and "**03** עד 79" should read 30 to 79.
- **PDF 39 / p. 38, Fig. 15.2:** "**001** לקוחות משלמים" should read 100.
- Cause: a `\he{…}` node that starts with a bare number, inside `ltrdiagram`.
- **Fix:** write the numbers as `\num{80}`, `\num{30}` and `\num{100}`, or start these nodes with a Hebrew word (for example "ציון 80 עד 100").

### H4. Fig. 7.1: the chosen alternative has no axis label
- **PDF 20 / p. 19:** the red bar (84, "ד׳ היברידי (נבחר)") has no y-tick label and sits off-centre above an empty slot. `ytick=data` takes its ticks only from the first `\addplot`.
- **Fix:** set `ytick={C,A,B,D}` explicitly and add `bar shift=0pt` to both plots, or draw a single `\addplot` and colour bar D with a `\node`/`fill` override.

---

## MEDIUM

### M1. Nearly empty page holding only Table 8.4
- **PDF 26 / p. 25:** the page contains only Table 8.4, about 20% of the page, floating in the middle. The rest is blank.
- **Fix:** place Table 8.4 with `[!htb]` right after the §8.8 text, or put `\FloatBarrier` before the chapter end so it joins p. 24.

### M2. About a third of the page empty after §8.3
- **PDF 22 / p. 21:** heading 8.3 and one line of text, then roughly 35% of the page is blank because Fig. 8.2 did not fit.
- **Fix:** give Fig. 8.2 the option `[!htbp]` and move it before the §8.2 paragraph, or reduce its height a little.

### M3. Heading at the bottom of a page: §9.4
- **PDF 27 / p. 26:** "9.4 כלים וסביבת עבודה" is the last line on the page. Its content, Table 9.1, starts on p. 27.
- **Fix:** add `\needspace{5\baselineskip}` to the section style in `my-template.cls`, or add one lead-in sentence after the heading.

### M4. Heading at the bottom of a page: §11.3
- **PDF 31 / p. 30:** "11.3 אבני דרך" is the last line on the page, under the Gantt chart. Table 11.1 is on p. 31.
- **Fix:** use the same `\needspace` fix as M3, or add a lead-in sentence and place Table 11.1 with `[h]`.

### M5. Page that carries one line
- **PDF 8 / p. 7:** the only content is "נמצאת בנספח א.", the last line of Chapter 1, carried over to a new page.
- **Fix:** shorten one sentence in the executive summary, or use `\enlargethispage{\baselineskip}` on p. 6.

### M6. Heat map alone on a page
- **PDF 36 / p. 35:** Fig. 13.1 sits alone in the middle of the page, leaving about 70% blank.
- **Fix:** place it `[!b]` on p. 34 by reducing the cell height (0.95 to 0.8 cm), or put it before Table 13.1.

### M7. Text running into the left margin
- **PDF 28 / p. 27:** two lines in the §9.5 bullets run past the left margin: "(TEMPLATE.md-ב" by 19 pt and "work/)" by 9.5 pt. These are the two overfull hboxes in the log.
- **Fix:** allow line breaks inside `\code{}` paths (`\allowbreak` after "/"), or rephrase so the paths do not sit at the line end.

### M8. Fig. 2.1: boxes overlap
- **PDF 10 / p. 9:** the centre "נקודות שבירה" box overlaps the "הכנסות פרסום" and "מעורבות רגשית" boxes. The two bottom boxes touch, and one arrowhead lands inside the "טראפיק" box text.
- **Fix:** increase the circle radius or node distance by about 20%, or shrink the centre box text width.

### M9. Fig. 10.1 ROC: label on top of the curve
- **PDF 30 / p. 29:** the "אזור היעד" label sits on top of the orange curve. The tick labels "0" and "2%" also crowd each other.
- **Fix:** move the label to the right of the green box with a short pin line, and drop the "0" tick.

### M10. Fig. 11.2 Gantt: milestone outside the frame and reversed labels
- **PDF 31 / p. 30:** the "קבלה מבצעית" diamond at month 18 sticks out half past the chart's right border. The row labels read "3א." and "3ב.", with the number and letter in the wrong order.
- **Fix:** extend the frame to 18.5 (or place the diamond at 17.9), and write the labels as `\he{3א.}` with a right-to-left mark, or as "3 (א)".

### M11. Figures and tables never referenced in the text (grep of `\ref{…}` in `chapters/`)
- **Figures (9 of 17):** `fig:altscore` 7.1, `fig:labels` 8.5, `fig:vmodel` 9.1, `fig:wbs` 11.1, `fig:gantt` 11.2, `fig:budget` 12.1, `fig:heat` 13.1, `fig:tam` 15.1, `fig:roadmap` 15.2.
- **Tables (26 of 48):** `tab:versions`, `tab:sign`, `tab:exec`, `tab:stake`, `tab:scope`, `tab:approaches`, `tab:ethics`, `tab:frameworks`, `tab:rivals`, `tab:freq`, `tab:nfr`, `tab:decision`, `tab:icd`, `tab:subsys`, `tab:truth`, `tab:capacity`, `tab:tools`, `tab:tests`, `tab:miles`, `tab:raci`, `tab:risks`, `tab:deliv`, `tab:revenue`, `tab:actions`, `tab:comply`, `tab:trace`.
- **Fix:** add a one-line "(ראו איור~\ref{…})" or "טבלה~\ref{…} מציגה…" in the paragraph before each float. Front-matter tables 0.1 and 0.2 may stay exempt.

### M12. Appendix pages labelled "פרק" instead of "נספח"
- **PDF 44 / p. 43 and PDF 45 / p. 44:** the appendix pages are titled "פרק א" and "פרק ב", while the TOC, LOT and the text call them נספח א and נספח ב.
- **Fix:** in `my-template.cls`, redefine the chapter label to "נספח" after `\appendix`.

### M13. Footer with mirrored parentheses on one page
- **PDF 42 / p. 41** (bibliography): the footer reads "גיא יערי )[הוסר]( ופז ניסים )[הוסר](". Every other page renders it correctly.
- **Fix:** wrap the footer text in `\he{…}` (`\foreignlanguage{hebrew}`) in the fancyhdr definition, so the bibliography's English context does not apply to it.

---

## LOW

### L1. Mirrored or misplaced parentheses in diagram labels
- **Fig. 7.1 axis** (p. 19): "(מתוך 100(".
- **Fig. 8.1** (p. 21): "(חתימת C2PA".
- **Fig. 8.3** (p. 22): "בודק אנושי )15 דק׳)".
- **Fig. 8.5** (p. 24): "(עריכה מוצהרת(".
- **Fig. 12.1 legend** (p. 32): "(72%" and similar entries.
- **Fig. 13.1 axes** (p. 35): "השפעה )I(" and "הסתברות )P(".
- **Fig. 15.1** (p. 37): "(2031 7.27 מיליארד $".
- **Fix:** in `ltrdiagram` nodes, keep the parenthesised LTR item away from the start or end of the `\he{}` group, or set nodes with `align=right` plus `\he` and `\textdir TRT`.

### L2. Fig. 2.2 timeline: citation markers in the wrong place
- **PDF 10 / p. 9:** citation markers "[1]", "[2]" and "[10]" jump to the start of their lines, and the box text reads out of order.
- **Fix:** put the citation inside the `\he{}` text with a non-breaking space before it, or move the citations into the caption.

### L3. Text too small to read in figures
- **PDF 36 / p. 35:** the heat-map risk badges are `\tiny` (about 5 pt), and R07 touches the cell edge.
- **PDF 33 / p. 32:** the Fig. 12.1 axis and legend are `\scriptsize` on a thin bar.
- **PDF 31 / p. 30:** the WBS leaf boxes in Fig. 11.1 are `\scriptsize`.
- **Fix:** use `\footnotesize` as the minimum for figure text. For the heat map, enlarge the cells or use `\scriptsize` badges.

### L4. Fig. 8.4: two swatches per legend entry
- **PDF 24 / p. 23:** each legend entry shows two swatches ("▮▮ תמונות אמיתיות").
- **Fix:** add `area legend` (or a single `legend image code`) to the ybar plots.

### L5. Over-spaced URLs in the bibliography
- **PDF 41 / p. 40:** the URLs in [4], [6] and [10] are stretched with wide letter gaps ("h t t p s : / / r s f . o r g …").
- **Fix:** set `\setcounter{biburlnumpenalty}{9000}` and `\setcounter{biburllcpenalty}{9000}`, or set the bibliography ragged-right.

### L6. Backslashes and slashes mirrored in code
- **PDF 28 / p. 27:** in §9.5, "‎\en" and "‎\num" render as "en\" and "num\", and the folder paths render with the slash on the wrong side.
- **Fix:** wrap these in `\en{\code{…}}` so the whole token is set left-to-right.

### L7. Timeline diagrams read left to right in an RTL document
- **PDF 10 / p. 9 (Fig. 2.2) and PDF 39 / p. 38 (Fig. 15.2):** both timelines run left to right.
- This is optional: it is not wrong, but a Hebrew reader may expect right-to-left.
- **Fix:** mirror the x-axis, or leave it as is and keep it consistent.

---

## Checked with no finding
- **Cover (PDF 1):** clean and centred, all details present.
- **TOC (PDF 3–4), LOT (PDF 5) and LOF (PDF 6):** aligned, page numbers correct, nothing overflows.
- **Running headers:** consistent on every content page. Chapter-opening pages correctly have no header.
- **Footer** "עמוד X מתוך 44": consistent. The count of 44 excludes the unnumbered cover, which is acceptable.
- **No table is split across pages.**
- **Half-empty pages at chapter ends are not flagged:** PDF 16, 21, 28, 30, 34, 37, 39, 40 and 43.
