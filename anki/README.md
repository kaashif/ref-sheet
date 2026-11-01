# Chaos Daemons Anki deck

Download [the Anki package](https://kaashif.github.io/ref-sheet/output/anki/chaos-daemons-skullmaster.apkg), then use **File > Import** in Anki. The package contains 115 question-and-answer cards in ten subdecks under **Chaos Daemons - Skullmaster Roster**. Re-import this package to update the existing deck; the original 92 note GUIDs and eight subdeck IDs are preserved.

| Subdeck | Cards |
| --- | ---: |
| Army | 8 |
| Detachment | 3 |
| Stratagems | 8 |
| Enhancements | 3 |
| Units | 35 |
| Core abilities | 15 |
| Unit checklists | 10 |
| Saves | 10 |
| Primary missions | 13 |
| Buff sources | 10 |

The ten units are Be'lakor, Great Unclean One, Lord of Change, Skarbrand, Skullmaster, Bloodcrushers, Plaguebearers, Flamers, Flesh Hounds and Screamers. Shared core abilities are taught once and tagged with all affected units; each unit also has its own complete ability checklist. Champion models use their parent unit's abilities, with the Gore Hound's exclusive burning roar called out explicitly.

Coverage includes every named ability on the selected datasheets, equipped wargear abilities and weapon keywords, damaged profiles, invulnerable saves, Shadow of Chaos and its subrules, Warp Rifts, all six Daemonic Incursion stratagems, Endless Gift and Everstave. Additional questions cover aura matching, charge triggers and the difference between Realm of Chaos and the Flesh Hounds' pickup. Unselected weapons and other enhancements are excluded.

Primary missions now include separate YOUR/THEIR scoring cards for all five Take and Hold matchups, two opponent-action cards and the primary VP cap. YOUR always means the Daemons player; THEIR always means the opponent. The cards explain scoring windows, round-five changes, points per objective versus fixed awards, home-objective exclusions, cumulative bonuses and alternative conditions. Death Trap includes Booby Trap and its FAQ; Secure Asset includes the action and its completion condition.

Each roster unit has a support checklist covering incoming eligible auras, attached leader/bodyguard effects, self-buffs and selected enhancements, army/territory support, all six detachment stratagems and relevant core support. GUO's enemy Toughness debuff is labelled indirect support. God restrictions and non-transferring enhancements are explicit. Snap shooting's prohibition on Hit rerolls is included. Lists and coloured ownership labels make these longer checklist cards easier to scan.

Answers paraphrase the official [Chaos Daemons Faction Pack v1.1](https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf) and [11th-edition Core Rules](https://assets.warhammer-community.com/eng_01-06_warhammer40k_new40k_core_rules-was6fbu1ix-hfewhmxyiy.pdf), checked on 1 November 2026. Both source links appear on every rules and support card. The current core rules matter: Stealth grants cover, Psychic attacks can ignore BS/WS and Hit modifiers, hazard rolls fail on 1-2, and Extra Attacks does not block attack-characteristic modifiers.

Mission scoring was checked against the Chapter Approved 2026-27 primary-card images already saved in the `40k-planner` reference library. The official [Event Companion](https://assets.warhammer-community.com/eng_12-06_warhammer40000_event_companion-s3bfb5f9s1-ivswuij3fo.pdf) verifies the mission pairings, primary caps (15VP per battle round / 45VP total) and Death Trap FAQ. The companion does not reproduce the scoring cards. Mission cards therefore identify the printed Mission Deck as the scoring source and link the companion plus the official Chapter Approved overview. Faction/core links remain on the rules and support cards.

The editable question bank is `chaos-daemons-skullmaster.json`. Rebuild from the repository root:

```sh
uv run scripts/build-chaos-daemons-anki.py
```

The script pins genanki, validates unique question/card IDs, and exports both `.apkg` and HTML-enabled `.tsv` files to `output/anki/`. Fixed deck/model IDs and stable note GUIDs allow subsequent package imports to update existing notes rather than create duplicates. Import the `.apkg` for the complete subdeck structure; TSV is a backup text format.

Validation: inspected the package archive and SQLite database, checked database integrity and all 115 notes/cards, verified field rendering against the JSON source, confirmed unique GUIDs and preservation of all original note/deck IDs, and audited ten mission-perspective cards and ten unit-support cards. Anki's graphical application was not used for the package integrity check.
