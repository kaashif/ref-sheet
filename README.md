# Thousand Sons Reference Sheet

Printable Warhammer 40,000 10th edition reference sheet for a 2000 point Thousand Sons Grand Coven list.

The canonical printable artifact is `thousand-sons-reference.pdf`, generated from `sheet.typ`.

To rebuild it:

```sh
typst compile sheet.typ thousand-sons-reference.pdf
```

`index.html` is kept as the earlier browser-print version.

## Additional reference sheets

- `output/pdf/2026-09-17.pdf` is the dated, one-page A4 portrait Thousand Sons sheet for New Recruit v36.2 / Data v13. Rebuild with `typst compile 2026-09-17.typ output/pdf/2026-09-17.pdf`. Unspecified weapons retain the previously requested Rubric warpflamers/Soulreaper and Terminator Soulreapers.
- `output/pdf/tsons-grand-coven-2000-reference.pdf` is the one-page A4 portrait Grand Coven sheet for the New Recruit v35.82 roster.
- `necrons-reference.pdf` is the Triple C'tan Awakened Dynasty sheet built from `necrons_list`.
- `necrons-nekrosor-reference.pdf` is the Nekrosor Awakened Dynasty sheet built from `necrons_nekrosor_list`.
