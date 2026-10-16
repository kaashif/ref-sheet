# Thousand Sons Reference Sheet

Printable Warhammer 40,000 10th edition reference sheet for a 2000 point Thousand Sons Grand Coven list.

The canonical printable artifact is `thousand-sons-reference.pdf`, generated from `sheet.typ`.

To rebuild it:

```sh
typst compile sheet.typ thousand-sons-reference.pdf
```

`index.html` is kept as the earlier browser-print version.

## Additional reference sheets

- `output/pdf/chaos-daemons-monster-mash-reference.pdf` is the one-page A4 portrait Monster Mash Daemonic Incursion sheet for the 1,990-point New Recruit v36.49 / Data v2 roster, saved verbatim in `monster_mash_list`. Rebuild with `typst compile chaos-daemons-monster-mash-reference.typ output/pdf/chaos-daemons-monster-mash-reference.pdf`. Rules sources, applied buffs and loadout assumptions are in `rules/monster-mash-audit-2026-10-16.md`.
- `output/pdf/2026-09-17.pdf` is the dated A4 portrait Thousand Sons sheet for New Recruit v36.2 / Data v13: the original one-page reference plus a second page of Priority Assets mirror deployment examples against big Knights. Rebuild with `typst compile 2026-09-17.typ output/pdf/2026-09-17.pdf`. Deployment notes live in `deployment-examples.typ`; attributed map artwork is in `assets/deployments/`. Unspecified weapons retain the previously requested Rubric warpflamers/Soulreaper and Terminator Soulreapers.
- `output/pdf/tsons-grand-coven-2000-reference.pdf` is the one-page A4 portrait Grand Coven sheet for the New Recruit v35.82 roster.
- `necrons-reference.pdf` is the Triple C'tan Awakened Dynasty sheet built from `necrons_list`.
- `necrons-nekrosor-reference.pdf` is the Nekrosor Awakened Dynasty sheet built from `necrons_nekrosor_list`.
