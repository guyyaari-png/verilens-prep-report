# Re-check of the rebuilt report.pdf (after fixes)

**Verdict: Much better, but not clean yet. Every critical and high item is fixed: there is no reversed Hebrew, no reversed digits and no "??" left. Still open: 3 medium layout items (pages with a single float, a two-line orphan page, a heading at the bottom of a page), the inconsistent appendix table number in the List of Tables, and several low cosmetic items.**

Method: I checked `report.pdf` (48 pages; printed page = PDF index − 1; footer "מתוך 47"). I rendered every page at 75 dpi as two-page spreads and confirmed suspects at 150–300 dpi (images are in `/tmp/claude-0/-home-claude/2dff8f1f-3e99-5d9c-8278-cfd416809c05/scratchpad/recheck/`). I also ran glyph-level scans with pdfplumber: Hebrew words read in visual order (final-letter test), unbalanced parentheses per line, glyphs outside the text block, and numbers with a leading zero. I checked `report.log` for undefined references and overfull boxes (it has none) and grepped `chapters/` for unreferenced labels. Notation: **PDF n / p. m**.

## 1. Status of the earlier findings

### 01-bidi-audit.md

| Original finding | Status | Evidence in the new PDF |
|---|---|---|
| #1 Table 1.2: "יעד" column has reversed Hebrew | fixed | PDF 7 / p.6: "90% לפחות", "2% לכל היותר", "18 חודשים", "9.6 מיליון ₪" |
| #2 Table 5.1 G-4..G-6: reversed Hebrew | fixed | PDF 18 / p.17: "100% מהתמונות שפורסמו מתויגות לפי TRUTH-IMG", "5 מערכות פיילוט מוסמכות; 20 מתחייבות", "קיבולת של 2 מיליון תמונות בחודש…; זמינות 99.9%" |
| #3 Table 8.1 "ממשק" column: reversed Hebrew | fixed | PDF 24 / p.23: "IF-01 מערכת ניהול התוכן" … "IF-05 רשתות פרסום". The ID is on the right |
| #4 Table 11.1 milestones: reversed Hebrew | fixed | PDF 35 / p.34: "M0: אישור דוח מכין" … "M6: קבלה מבצעית ודוח סיום" |
| #5 Table 8.4 "ןוילימ 2" | fixed | PDF 28 / p.27: "2 מיליון", "50 מיליון" |
| #6 Table 15.1 pricing: reversed | fixed | PDF 41 / p.40: "1,500 עד 15,000 ₪ בחודש לפי נפח", "25,000 ₪ בשנה" |
| #7 Glossary: "AI )תיתוכאלמ הניב(" | fixed | PDF 2 / p.1: "AI (בינה מלאכותית)" |
| #8 Fig 8.3: 08/03 and ")15 דק׳)" | fixed | PDF 25 / p.24: "80 עד 100", "30 עד 79", "0 עד 29", "בודק אנושי, עד 15 דק׳" |
| #9 Table 8.3 caption "גרסה 0.1" | fixed | PDF 27 / p.26 and the List of Tables (PDF 6): "גרסה 1.0" |
| #10 Fig 15.2 "001 לקוחות" | fixed | PDF 42 / p.41: "100 לקוחות משלמים" |
| #11 §8.4 time "50:42:23" | fixed | PDF 26 / p.25 item 3: "23:42:50". This is a valid HH:MM:SS that fits between 23:42 and 23:44. It is the only item with seconds (cosmetic) |
| #12 Fig 9.1: "(פרק 6(" | fixed | PDF 29 / p.28: "דרישות מערכת, פרק 6", "ארכיטקטורה, פרק 8" (the parentheses were removed) |
| #13 Fig 12.1 legend: "(72%(" | fixed | PDF 36 / p.35: "כוח אדם: 72%", "מחשוב ונתונים: 9%" … |
| #14 Fig 15.1: "$ )2031(" | fixed | PDF 41 / p.40: "7.27 מיליארד $ עד 2031" |
| #15 Bibliography footer is mirrored | fixed | PDF 44–46: the footer now reads "גיא יערי ופז ניסים" (the IDs were removed) and is not mirrored |
| #16 WBS runs LTR; Gantt labels "3א." | fixed | PDF 34 / p.33: the WBS runs "1. ניהול" (right) to "6. פיילוט" (left). The Gantt labels read "מנוע: שכבות 1 עד 3" and "מנוע: שקלול וכיול" |
| #17 Appendix table number: caption and LOT in opposite order | **still present** | Glyph positions show the caption on PDF 47 reading "טבלה א.1" (correct, and it matches the text "(טבלה א.1)"). In the List of Tables (PDF 6 / p.5) the glyphs sit as "א" on the left and "1" on the right, so in RTL it reads **"1.א"**, and likewise **"1.ב"**. The List of Tables is now the reversed one |
| #18 Table 14.1 D-02: "-Word / Press" | **still present** | PDF 40 / p.39: "תוספים למערכות ניהול תוכן: ‎-Word" / "Press ‏Arc XP-ו" |
| #19 Wide gaps in narrow justified cells | **still present** | Table 10.1 T-08/T-10 (PDF 32), Table 13.1 R-01, R-05, R-08, R-10 (PDF 38), Table 14.1 D-03 "ממשק   API   מתועד,   כולל", D-08, D-09 (PDF 40) |
| #20 Charts run left to right (inconsistent) | still present (design choice) | Fig 2.2 (PDF 10), Fig 8.2 (PDF 25), Gantt 11.2 (PDF 34), Fig 15.2 (PDF 42) still run LTR. Only the WBS was mirrored |
| #21 ROC: label on the curve; LTR legend | partly | PDF 33 / p.32: "אזור היעד" now sits off the curve with a pin line (fixed). The legend keys are still on the LEFT of the Hebrew labels (key x=304–321 pt, text x=322–398 pt) |
| #22 Fig 8.4: ambiguous legend swatches | partly | PDF 26 / p.25: now one swatch per entry, but each swatch still sits to the left of its label, between the two labels: "[■]תמונות אמיתיות [■]תמונות סינתטיות" |
| Note: "??" (§9.5 and Table א.1) | fixed | No "??" in the text, and the log has no undefined references. Table 9.2 (PDF 31) now exists and Table א.1 refers to it correctly ("בטבלה 9.2", "טבלה 9.2 (עמ׳ 30)", which is correct) |
| Note: PDF 8 holds one orphan line | **still present** | PDF 8 / p.7 holds only 2 lines ("הבקשה. אישור הדוח…" / "נמצאת בנספח א.") |
| Note: Table 8.4 alone on a half-empty page | **still present** | PDF 28 / p.27: Table 8.4 alone, about 20% of the page |

### 02-page-review.md

| Original finding | Status | Evidence in the new PDF |
|---|---|---|
| H1 "??" undefined `tab:review` | fixed | See the note above. The log is clean |
| H2 Hebrew reversed in cells that start with an LTR token | fixed | Glossary (PDF 2), Table 8.1 (PDF 24), Table 11.1 (PDF 35), Table 15.1 (PDF 41) are all correct. The glyph-level scan found no reversed Hebrew word in the whole PDF |
| H3 Reversed digits in diagrams | fixed | Fig 8.3 (PDF 25) and Fig 15.2 (PDF 42) are correct |
| H4 Fig 7.1: the chosen bar has no label | fixed | PDF 23 / p.22: four labels, "ד׳ היברידי, נבחר" sits on the red bar (84) |
| M1 Table 8.4 alone on a page | **still present** | PDF 28 / p.27 |
| M2 A third of the page empty after §8.3 | fixed (mostly) | PDF 24 / p.23 now ends with heading 8.3 plus one sentence, then about 15% blank. Fig 8.3 is on PDF 25 |
| M3 §9.4 heading at the page bottom | fixed | PDF 30 / p.29: 9.4 is at the top of the page |
| M4 §11.3 heading at the page bottom | **partly** | PDF 34 / p.33: "11.3 אבני דרך" is followed only by the stub "ראו טבלה 11.1.", and Table 11.1 starts on PDF 35. It is still effectively a heading at the bottom of the page |
| M5 One-line page | **still present** | PDF 8 / p.7 (2 lines) |
| M6 Heat map alone on a page | **still present** | PDF 39 / p.38: Fig 13.1 alone, centred, about 70% blank |
| M7 Text running into the left margin in §9.5 | fixed | The text is now in §9.6 (PDF 30). The log has no overfull boxes, and the glyph scan found nothing outside the 65–530 pt text block |
| M8 Fig 2.1: boxes overlap | fixed | PDF 10 / p.9: the centre box is clear of the ring, and the arrowheads touch only box edges |
| M9 ROC label on the curve; "0"/"2%" crowding | fixed | PDF 33 / p.32 |
| M10 Gantt: milestone outside the frame; "3א." labels | fixed | PDF 34 / p.33: the "קבלה מבצעית" diamond is inside the frame, and the labels are fixed |
| M11 Floats never referenced | fixed (only `tab:versions` and `tab:sign` remain, and those are exempt) | All other labels are now referenced, but 21 of them through one-line stub paragraphs "ראו טבלה X." / "ראו איור X." (see N5) |
| M12 Appendix titled "פרק" | fixed | PDF 47–48: "נספח א" and "נספח ב" |
| M13 Mirrored footer on the bibliography page | fixed | PDF 44–46 |
| L1 Mirrored parentheses in diagram labels | fixed | Fig 7.1 axis "ציון משוקלל, מתוך 100"; Fig 8.1 "חתימת C2PA"; Fig 8.3; Fig 8.5; Fig 12.1; Fig 13.1 "השפעה I", "הסתברות P"; Fig 15.1. None are mirrored |
| L2 Fig 2.2: citation markers jump | fixed | PDF 10: the citations moved into the caption "[1], [2], [10], [11]" |
| L3 Figure text too small | partly | The heat-map badges no longer clip (R07 is inside the cell). The badges are still small, and the WBS leaf boxes and Fig 12.1 axis are still `\scriptsize` |
| L4 Fig 8.4: two swatches per legend entry | fixed | PDF 26: one swatch per entry (but see #22 for the placement) |
| L5 Spaced-out URLs in the bibliography | **still present** | PDF 44: [3] "https : / / the - decoder . com / ai - spam …", [4], [6] "https : / / rsf . org / en / paris - charter …"; PDF 45: [12] canon-europe |
| L6 `\en`, `\num` and paths mirrored in §9.5 | fixed | PDF 30 §9.6: the glyph order is "\en", "\num", "chapters/", "work/review/" |
| L7 Timelines run LTR | still present (optional) | Same as #20 |

## 2. New findings (fresh scan of all 48 pages)

No new reversed Hebrew, reversed or split digits inside numbers, mirrored parentheses in running text, wrong table column order (the first column is on the right in every table, including the new Table 9.2 and the double-width Table ב.1), text outside the margins, or "??" were found.

| # | PDF / p. | Exact text / location | Problem | Suggested fix |
|---|---|---|---|---|
| N1 | PDF 6 / p.5 | List of Tables: "1.א  עמידה בדרישות המטלה…" and "1.ב  עקיבות דרישות חובה" | The appendix table number reads reversed (this is #17, now on the List of Tables side). The caption and the text say "א.1" | Make the LOT number RTL the same way as the caption, e.g. define `\thetable` for the appendix as `\thechapter.\arabic{table}` inside `\he{}` or with `\textdir TRT`, or patch `\numberline` in the LOT for the appendix |
| N2 | PDF 45 / p.44 | Bibliography [18]: `[18] .מצה, ל. “?AI העתיד של הבינה המלאכותית … תמונות”, mako / N12` | Inside the LTR entry, the Hebrew author "מצה, ל." appears at the far LEFT, after the title in RTL reading order, with a stray period before it. Every other entry starts with the author | Set `langid = {hebrew}` for this entry (or wrap author+title in `\foreignlanguage{hebrew}{…}`), or give the title in English transliteration with the Hebrew in `titleaddon` |
| N3 | PDF 11 / p.10 | Fig 3.1 (stakeholder map): "מועצת העיתונות / גופי אתיקה", "יצרני מצלמות ו-C2PA", "פלטפורמות רשת חברתית" | The labels cross the vertical dashed quadrant line, and "יצרני מצלמות ו-C2PA" sits on the horizontal dashed line | Anchor these labels `left`/`right` of the dot away from x=2.5, or move the dots a little (e.g. x ≥ 2.9) |
| N4 | PDF 24 / p.23 | Fig 8.1: arrow labels "תמונה / החלטה", "תמונה חתומה", "ציון מצרפי" | The sloped labels are drawn across the arrow lines (the arrow passes through the text) | Add `above`/`below` with `sloped, fill=white, inner sep=1pt`, or `pos=0.35` with an offset |
| N5 | PDF 7, 11, 12, 15, 19, 20, 22, 24 (×2), 30, 32, 34 (×2), 35, 36, 38 (×2), 40, 41, 42, 43 | 21 stand-alone paragraphs "ראו טבלה X." / "ראו איור X." (e.g. PDF 11 bottom "ראו טבלה 3.1." under Fig 3.1, PDF 24 "ראו טבלה 8.2." right after "איור 8.2 מציג…") | A mechanical fix for M11. It reads as filler, and on PDF 11 and PDF 34 the stub ends up as the last line of the page | Fold each into the preceding sentence ("…כמפורט בטבלה~\ref{…}"), then delete the stub lines |
| N6 | PDF 31 / p.30 | Table 9.2 (new, "סוכני הבדיקה") | It sits alone on the last page of chapter 9, vertically centred, with about 65% of the page blank (end of chapter, so low) | Use `[!htbp]` with `\FloatBarrier` or place it `[t]`, or move it before the §9.6 closing paragraph so it joins PDF 30 |
| N7 | PDF 24 / p.23 | "8.3 זרימת ההחלטה" + one line at the page bottom | Heading with one line at the bottom, and its figure on the next page (borderline) | The same `\needspace{5\baselineskip}` in the section style fixes this, M4 and N5 together |
| N8 | PDF 10 / p.9 (Fig 2.2); PDF 41 / p.40 (Fig 15.1) | "…תמונה סינתטית; כ-" / "45 מיליון שיתופים"; "מנוי ממוצע של 3,500" / "₪ בחודש…" | The line break separates a prefix or unit from its number | Use `כ-\num{45}` with a non-breaking hyphen (`כ\nobreakdash-45`), and `3,500~₪` |
| N9 | PDF 26 (Fig 8.4), PDF 33 (Fig 10.1), PDF 36 (Fig 12.1) | Legend swatches and keys sit on the LEFT of the Hebrew label | In RTL the swatch should be on the right of its label. As drawn, each swatch sits between two entries (see #21, #22) | In pgfplots: `legend style={…}, legend plot pos=right` (and `legend cell align=right`) |
| N10 | PDF 41 / p.40 | Fig 15.1 annotation texts "SAM: …" / "SOM: …" | Hebrew text in the side notes is left-aligned (ragged on the right) | Add `align=right` to those nodes |
| N11 | PDF 43 / p.42 | Heading "סוגיות פתוחות לסגירה לפני חודש 1" | The only unnumbered section in a numbered chapter (it should be 16.1) | Use `\section` instead of `\section*`, or make it intentional |

## 3. What still needs fixing before submission

1. M1, M5 and M6: pages that hold only a float or 2 lines (PDF 8, PDF 28, PDF 39, and also PDF 31).
2. #17/N1: the appendix table numbers in the List of Tables read "1.א" / "1.ב".
3. #18: "-Word / Press" in Table 14.1 D-02 (use `WordPress` inside `\mbox{}` or `\en{\mbox{WordPress}}`).
4. M4/N7: §11.3 and §8.3 headings at the bottom of the page, with stub lines (N5).
5. Low: L5 spaced-out URLs, #19 justified gaps, N2 Hebrew bibliography entry, N3/N4 label overlaps, N8 split prefix and unit, N9 legend side.
