# Monster Mash reference audit - 16 October 2026

Roster: `monster_mash_list`, preserved from the supplied New Recruit v36.49 / Data v2 export. The nine units total 1,990 points, including the listed enhancements. Points are roster values, not a separate audit of the current Munitorum Field Manual. Detachment: Daemonic Incursion (3DP); force disposition: Take and Hold; Strike Force limit: 2,000 points.

The reference uses the repository's dated A4 portrait layout: teal unit cards, compact profile tables, red applied self-buffs, blue Psychic keywords, and three columns of rules and phase reminders. Duplicate Flamer units share one card, explicitly marked as two separate units of three.

## Sources

Primary rules source: [official Chaos Daemons Faction Pack v1.1](https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf), labelled legal from 22 July 2026. Checked the first-page changes, army rules, Daemonic Incursion detachment, all eight distinct roster datasheets and the FAQs. The current official link was located through [Wahapedia's 11th-edition faction page](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/), which also supplied a cross-check of the detachment text and FAQ. Use the PDF's printed v1.1 label rather than the web index's differing version/date metadata.

Individual datasheet links for table use:

- [Be'lakor](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Be-lakor)
- [Great Unclean One](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Great-Unclean-One)
- [Kairos Fateweaver](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Kairos-Fateweaver)
- [Lord of Change](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Lord-of-Change)
- [Skarbrand](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Skarbrand)
- [Plaguebearers](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Plaguebearers)
- [Flamers](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Flamers)
- [Screamers](https://wahapedia.ru/wh40k11ed/factions/chaos-daemons/Screamers)

## Profile and interaction checks

- **Be'lakor:** both shooting profiles and melee profiles, Stealth, 4++ save, mandatory Warlord, Shadow area, three battle-round choices and damaged penalty checked. Wreathed limits shooting to attacking models within 18 inches. Pall checks below Starting Strength in the opponent's Battle-shock step and heals for enemy failed tests within 9 inches. Be'lakor has no god keyword, so does not receive god-specific auras.
- **Great Unclean One:** selected sword/flail plus compulsory vomit only; optional bell/bileblade excluded. Its +1 Toughness aura includes itself: displayed T13 from base T12. Endless Gift supplies FNP 5+, replacing native 6+; the current enhancement has no improved Shadow tier. Nurgle's Rot is end of own Movement, lasts until start of next own Movement and does not require visibility. Plaguebearers within 6 inches are T6.
- **Kairos:** shooting, melee, 4++, damaged penalty and matching-god Shadow aura checked. Command CP ability requires a Leadership test at the end of own Command while on the battlefield; it is not a Battle-shock test. Updated stratagem tax is optional once per turn, affects an opponent's unit within 12 inches and adds 1CP to that use. Lord of Change's ranged aura increases Gateway to S10 only while within 6 inches.
- **Lord of Change:** rod selected; optional sword excluded. Base rod S8 and Bolt S9. Self-aura adds +1 S to ranged attacks. Own Greater Daemon aura puts it in Shadow, giving Everstave +2 S/+6-inch range. Applied profiles therefore show rod S11, Bolt S12, both at 24 inches. Staff remains S6. Master of Magicks modifies Bolt only in own Shooting, with one of the three listed abilities; it does not modify the rod or Overwatch.
- **Skarbrand:** self melee aura applies +1 Attack to base 8/16, displayed 9/17. At 1-7 wounds, +2 more gives 11/19. Unlike the other four Monsters, its damaged rule does not penalise Hits. Native Advance and charge requires no Shadow or stratagem. It has no Fly keyword.
- **Plaguebearers:** ten models, including Plagueridden; common profile and plagueswords. End-of-own-Command sticky objective condition and start/end-of-turn loss condition checked. Icon and instrument were not specified, so neither is applied; optional effects are identified separately for reference. Ordinary sticky control creates no local Shadow area by itself.
- **Flamers:** two separate squads, each one Pyrocaster and two Flamers. Same profile for every model; each has one D6 Torrent weapon. Fall Back and shoot checked. Conditional nearby Lord of Change bonus makes flames S5; the enhancement on the Lord does not transfer. Torrent gives no critical Hits.
- **Screamers:** three models, three attacks each; Anti-Monster and Anti-Vehicle 4+ checked. Slashing Dive follows a Normal move in own Movement, selects an enemy moved over and rolls once per model in the unit. No native Devastating Wounds and no ranged attacks. Current keywords are Beast/Fly, without Frame.
- **Shared:** all units have Deep Strike/Shadow of Chaos; all five Monsters have Deadly Demise D6. Attacks are per model/weapon. Alternative weapon modes are exclusive; different equipped ranged weapons can both shoot.
- **Army and detachment:** checked territory-based Shadow timing/thresholds, friendly Battle-shock healing/Plaguebearer returns, enemy Battle-shock penalty/mortals, matching-god and wholly-within arrival conditions, >6-inch Warp Rifts and >8-inch default distance. FAQ prevents an arriving Monster using its own newly arriving aura to reduce its arrival distance.
- **All six stratagems:** CP costs, phase windows, eligibility and durations checked. Denizens has no printed charge prohibition. Realm of Chaos uses the updated mandatory ingress in the next own Movement phase, including turn one, and excludes engaged units. Corrupt Realspace adds a 6-inch Shadow area while the corrupted objective is controlled, unlike Plaguebearers' ordinary sticky ability.

## Validation

Compiled with Typst 0.14.2; confirmed one A4 portrait page with `pdfinfo`. Rendered with Poppler and visually inspected after the final table sizing changes: no clipped or overlapping text, complete cards and readable numerical profiles. Saved the exact roster export and documented the rebuild command in README. This is a condensed roster aid; use the full rules for mission scoring, core stratagems, terrain and opponent-specific interactions.
