# Nekrosor reference sheet - BSData 11th edition audit

Audited 4 August 2026.

## GitHub data audited

- Repository: https://github.com/BSData/wh40k-11e
- Commit: https://github.com/BSData/wh40k-11e/commit/d1a6efc2f220963a4528b797fa81510d5b38f8ce
- Faction data: https://github.com/BSData/wh40k-11e/blob/d1a6efc2f220963a4528b797fa81510d5b38f8ce/Necrons.json
- Core data: https://github.com/BSData/wh40k-11e/blob/d1a6efc2f220963a4528b797fa81510d5b38f8ce/Warhammer%2040%2C000.json

BSData describes this as its Warhammer 40,000 11th Edition repository. It is
community-maintained and is not endorsed by Games Workshop.

## Official files cross-checked

- `necrons-faction-pack-2026-06-09-v1.0.pdf`
- `warhammer-40000-core-rules-2026-06-01.pdf`
- `munitorum-field-manual-necrons-2026-07-22-v1.1.html`

Official source URLs and hashes are recorded in
`necrons-reference-materials-2026-07.md`.

## Results

All displayed model characteristics and weapon profiles were checked against
the BSData 11th-edition JSON for:

- C'tan Shard of the Nightbringer
- C'tan Shard of the Void Dragon
- Nekrosor Ammentar
- Skorpekh Lord
- Technomancer
- Canoptek Reanimator
- Canoptek Wraiths
- Flayed Ones
- Lokhust Destroyers
- Skorpekh Destroyers

The displayed M, T, Sv, W, Ld, OC, invulnerable saves, weapon ranges, attacks,
hit characteristics, strength, AP, damage and weapon abilities match commit
`d1a6efc`.

Corrections made during this audit:

- Infiltrators changed from more than 9 inches to more than 8 inches from the
  opponent's deployment zone and all enemy units.
- Deep Strike reminders changed from more than 9 inches to more than 8 inches
  from all enemy units.
- Veil of Darkness updated to its current Strategic Reserves, temporary Deep
  Strike and mandatory next-Movement-phase ingress wording.
- Nekrosor Ammentar's native Feel No Pain 5+ added.
- Distortion Fields and its optional 3-mortal-wound range boost added for both
  C'tan.
- Reanimation Protocols and the Canoptek Reanimator reminder updated to the
  current BSData "heals" wording.

The Awakened Dynasty stratagem text is not encoded in BSData's roster JSON. It
was therefore cross-checked separately against Wahapedia's Necrons 11th edition
version 1.1 reference (https://wahapedia.ru/wh40k11ed/factions/necrons/) and the
official 2026 rules updates rather than claimed as a BSData validation.
