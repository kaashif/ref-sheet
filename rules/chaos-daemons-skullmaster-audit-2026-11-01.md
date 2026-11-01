# Chaos Daemons / Skullmaster reference audit - 1 November 2026

The supplied New Recruit v37.8 export is preserved in `chaos_daemons_skullmaster_list`. Its ten roster entries total 1,995 points (the Great Unclean One and Lord of Change entries already include their enhancements). The sheet omits points and roster quantities per AGENTS.md. The attached leader and bodyguard share one reference card, giving nine cards for ten roster entries.

This is a separate variant of the existing Monster Mash sheet. Kairos and the second Flamer squad are removed; Skullmaster, Bloodcrushers and Flesh Hounds are added. Be'lakor remains Warlord, GUO has bilesword/flail and Endless Gift, and LoC has rod and Everstave. The original roster and reference remain available.

## Primary sources

- [Official Chaos Daemons Faction Pack v1.1](https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf), printed legal date 22 July 2026. Downloaded and extracted with Poppler. Rechecked the army rule, Warp Rifts, stratagems, new datasheets, icon/instrument rules and Skarbrand aura. Existing unchanged profiles and enhancement calculations follow the [previous audit](monster-mash-audit-2026-10-16.md).
- [Official 11th-edition Core Rules](https://assets.warhammer-community.com/eng_01-06_warhammer40k_new40k_core_rules-was6fbu1ix-hfewhmxyiy.pdf), especially Extra Attacks 24.11, Lance 24.21 and Attached Units 19. Downloaded and extracted with Poppler. Extra Attacks in this edition does not prohibit attack characteristic modifiers; Skarbrand's +1 melee Attack therefore applies to the horns as well as the rider weapons.

## Updated cards and interactions

- **Skullmaster + Bloodcrushers:** separate model profiles retain Skullmaster's 6 wounds and 4++ and Bloodcrushers' 4 wounds and 5++. All are M10, T7, Sv3+, OC2. The equipped icon supplies Ld6+ to every model in the attached unit; the instrument supplies +1 Charge. These effects depend on their respective bearers remaining alive. Shared horn profile: A4, WS4+, S6, AP-1, D1, Extra Attacks and Lance. Skullmaster's blade is A5, WS2+, S6, AP-2, D3; Bloodcrusher hellblades are A2, WS3+, S5, AP-2, D2. Attacks are per model/weapon.
- **Charge triggers:** Brass Stampede rolls once per model in the attached unit, including Skullmaster, against one engaged enemy; each 4+ inflicts D3 mortals. Devastating Charge forces every engaged enemy unit to test Battle-shock. While Skullmaster leads, Skullmaster's Fury gives all the unit's horns Devastating Wounds after a charge, until end of turn. Lance adds 1 to Wound rolls if the unit charged that turn. These are separate effects; no unconditional Devastating Wounds is printed on the horn profile.
- **Skarbrand's incoming auras:** Skullmaster/Bloodcrushers and Flesh Hounds gain Shadow and +1 melee Attack while within 6 inches. Numeric cells show blade A5/6*, hellblade A2/3*, horn A4/5*, and fangs A3/4*. Skarbrand's own A8/9* and A16/17* remain. No Khorne buff is applied to other gods or Be'lakor.
- **Flesh Hounds:** all models have M12, T4, Sv7+/5++, W2, Ld7+, OC1, fangs and Collar of Khorne (FNP3+ against Psychic Attacks). The unit's mandatory Gore Hound alone carries burning roar. The terse supplied export does not enumerate its submodels; use the compulsory datasheet composition. Hunters from the Warp is a free end-of-opponent-turn reserve pickup if unengaged, with no Shadow requirement. It is separate from Realm of Chaos and its mandatory next-Movement ingress clause.
- **Plaguebearers:** the explicitly equipped icon is applied as Ld6+ in the profile; the instrument's +1 Charge is shown. GUO's conditional T6* and sticky objective rule remain.
- **Removed Kairos:** no Kairos profile, aura source, CP generation or stratagem-tax reminder remains. LoC alone supplies the Tzeentch Shadow source for Flamers and Screamers, alongside Be'lakor. LoC's ranged Strength aura does not affect melee weapons or the Flesh Hound roar.
- **Shared aura audit:** every card carries Be'lakor's conditional ranged screen and its available Shadow sources. Every non-Torrent Hit cell carries RR1*, keyed to Be'lakor within 6 inches with Shadow Lord selected. Wreathed, Shadow Lord and Pall are alternative battle-round choices. GUO and LoC self-buffs and Everstave remain as in the previous audit. No Torrent weapon receives Hit rerolls.

## Validation

### In-profile reminders and phase ownership

Rebuilt the sheet after the AGENTS.md clarification. Every named phase now explicitly highlights YOUR, THEIR or EITHER PLAYER'S ownership, including expiry windows. Every non-Torrent weapon retains bold red RR1* in its Hit box, conditional on Be'lakor's Shadow Lord mode. Every recipient card highlights Wreathed's shooting restriction and its Shadow sources; the key keeps Be'lakor's three modes exclusive.

Both Bolt of Change keyword cells now show bold red Sustained Hits D3*, selected through Master of Magicks in YOUR Shooting phase only. The horn keyword cell shows conditional Devs* from Skullmaster's Fury. Incoming Lord of Change, GUO and Skarbrand auras are highlighted on their recipients. Icon Leadership shows base 7+ beside 6+*, and GUO's note shows native FNP6+ beside Endless Gift's FNP5+*.

All 24 weapon profiles show the improved AP from Draught of Terror beside base AP, explicitly conditional on spending its CP in YOUR Shooting phase or EITHER PLAYER'S Fight phase. Damaged Be'lakor/GUO Hit values are in the affected Hit cells; Skarbrand's damaged attacks appear in its Attacks cells. Double-star markers distinguish damaged profiles, and Psychic's ability to ignore Hit modifiers is explained. Existing base values and Strength calculations were compared against the previous committed sheet. No roster export changes.

Clarified the AP key, stratagem text and phase reminder to emphasize **1CP, ONE selected unit only**. The AP asterisk on every weapon records potential eligibility, not an army-wide or continuously active AP buff.

Compiled with Typst 0.14.2 into `output/pdf/chaos-daemons-skullmaster-reference.pdf`. Poppler confirms one A4 portrait page. Rendered and visually inspected the final page for readable profiles, intact cards, alignment and complete army/stratagem/phase reminders. Checked extracted text for all ten roster unit names, absence of Kairos and points, equipped icons/instruments, and the three new unit abilities. This is a condensed table aid; consult the full source rules for complete wording.
