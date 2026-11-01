# Chaos Daemons Anki deck

Download [the Anki package](https://kaashif.github.io/ref-sheet/output/anki/chaos-daemons-skullmaster.apkg), then use **File > Import** in Anki. The package contains 92 question-and-answer cards in eight subdecks under **Chaos Daemons - Skullmaster Roster**:

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

The ten units are Be'lakor, Great Unclean One, Lord of Change, Skarbrand, Skullmaster, Bloodcrushers, Plaguebearers, Flamers, Flesh Hounds and Screamers. Shared core abilities are taught once and tagged with all affected units; each unit also has its own complete ability checklist. Champion models use their parent unit's abilities, with the Gore Hound's exclusive burning roar called out explicitly.

Coverage includes every named ability on the selected datasheets, equipped wargear abilities and weapon keywords, damaged profiles, invulnerable saves, Shadow of Chaos and its subrules, Warp Rifts, all six Daemonic Incursion stratagems, Endless Gift and Everstave. Additional questions cover aura matching, charge triggers and the difference between Realm of Chaos and the Flesh Hounds' pickup. Unselected weapons and other enhancements are excluded.

Answers paraphrase the official [Chaos Daemons Faction Pack v1.1](https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf) and [11th-edition Core Rules](https://assets.warhammer-community.com/eng_01-06_warhammer40k_new40k_core_rules-was6fbu1ix-hfewhmxyiy.pdf), checked on 1 November 2026. Both source links appear on every card. The current core rules matter: Stealth grants cover, Psychic attacks can ignore BS/WS and Hit modifiers, hazard rolls fail on 1-2, and Extra Attacks does not block attack-characteristic modifiers.

The editable question bank is `chaos-daemons-skullmaster.json`. Rebuild from the repository root:

```sh
uv run scripts/build-chaos-daemons-anki.py
```

The script pins genanki, validates unique question/card IDs, and exports both `.apkg` and HTML-enabled `.tsv` files to `output/anki/`. Fixed deck/model IDs and stable note GUIDs allow subsequent package imports to update existing notes rather than create duplicates. Import the `.apkg` for the complete subdeck structure; TSV is a backup text format.

Validation: inspected the package archive and SQLite database, checked database integrity and note/card counts, verified all questions and answers against the JSON source, confirmed unique GUIDs, and audited required named-ability coverage against the faction pack. Anki's graphical application was not used for the import check.
