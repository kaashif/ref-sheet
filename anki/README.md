# Chaos Daemons Anki deck

Download [the Anki package](https://kaashif.github.io/ref-sheet/output/anki/chaos-daemons-skullmaster.apkg) and import it in Anki. It contains **180 practical cards** under **Chaos Daemons - Skullmaster Roster**. Questions teach gameplay effects rather than asking you to memorize ability or mission names. Sources are collapsed below each answer.

Ordinary rules questions are short and focused. Full primary scoring stays together on YOUR/THEIR matchup cards. Each unit has one compact source/effect buff list, with ranges and Be'lakor's alternative modes explicit, instead of a long repetition of every generic stratagem. Weapon reminders explain what keywords do in play. The previous longest answer was 484 words; ordinary rule answers now have a maximum of 31 words. Mission scoring and compact buff summaries may be longer.

| Subdeck | Cards |
| --- | ---: |
| Army | 11 |
| Detachment | 7 |
| Stratagems | 24 |
| Enhancements | 8 |
| Units | 47 |
| Core abilities | 31 |
| Unit checklists | 19 |
| Saves | 10 |
| Primary missions | 13 |
| Buff sources | 10 |

All 116 original note GUIDs and all ten deck IDs remain stable. The additional 64 cards split independent rule facts and exceptions. The Unit checklists subdeck now contains focused weapon and champion reminders, not whole-unit catalogues. Re-import with **Import any learning progress** and **Import any deck presets** disabled to preserve existing study progress and settings.

The interim over-fragmented 253-card version was consolidated: 73 duplicate split questions were removed from the installed collection through Anki's own API, creating syncable deletions. Importing an `.apkg` alone does not delete old notes. The local deck was checked for exact correspondence with the final package and retained review history before confirming sync completion.

Coverage retains selected unit abilities, equipped wargear and weapon effects, damaged profiles, saves, Shadow of Chaos, Warp Rifts, all six detachment stratagems, Endless Gift, Everstave, Take and Hold matchups and roster buff sources. The ten units are Be'lakor, Great Unclean One, Lord of Change, Skarbrand, Skullmaster, Bloodcrushers, Plaguebearers, Flamers, Flesh Hounds and Screamers.

Rules follow the [Chaos Daemons Faction Pack v1.1](https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf), [11th-edition Core Rules](https://assets.warhammer-community.com/eng_01-06_warhammer40k_new40k_core_rules-was6fbu1ix-hfewhmxyiy.pdf) and [the recorded Wahapedia audit](../rules/chaos-daemons-skullmaster-audit-2026-11-01.md). Infected Outbreak uses Wahapedia's end-of-phase control comparison; Corrupt Realspace still checks start/end of a turn. No Prisoners follows Core Rule 19.02, and retained own while-leading abilities follow 19.04.

Mission scoring follows the printed Chapter Approved 2026-27 cards saved in the `40k-planner` reference library and the [October Event Companion v1.3](https://assets.warhammer-community.com/eng_14-10_wh40k_event_companion-rdwnqprl4c-nj8oqogadv.pdf), including the end-of-battle primary cap exception and Death Trap FAQ.

Edit `chaos-daemons-skullmaster.json`, then rebuild:

```sh
uv run scripts/build-chaos-daemons-anki.py
```

Build checks validate unique stable IDs/questions, reject name-recall prompts, and limit ordinary answers to 40 words and scoring/buff summaries to 120 words. Manual review checks usefulness and clarity. The build exports `.apkg` and HTML-enabled backup `.tsv` files to `output/anki/`.
