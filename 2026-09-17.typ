// Dated roster: 2026-09-17. Unspecified weapons retain the user's prior selections.
// Rules: https://wahapedia.ru/wh40k11ed/factions/thousand-sons/
#set page(paper: "a4", margin: 4mm)
#set text(font: "Arial", size: 7pt, hyphenate: true)
#set par(leading: 0.26em, spacing: 0.16em)

#let ink = rgb("#171717")
#let muted = rgb("#595959")
#let linec = rgb("#bdb6aa")
#let soft = rgb("#f3efe6")
#let teal = rgb("#006b78")
#let red = rgb("#8a2634")
#let blue = rgb("#0078aa")
#let gold = rgb("#9a6500")
#let purple = rgb("#6b3fa0")
#let indigo = rgb("#3749a6")
#let teal-soft = rgb("#e3f2f2")
#let blue-soft = rgb("#e6f0f8")
#let cellpad = (x: 1.25pt, y: 0.9pt)
#let r(body) = text(fill: red, weight: "bold", body)
#let b(body) = text(fill: blue, weight: "bold", body)
#show "Psychic": b("Psychic")
#show "Psyker": b("Psyker")
#show "GRENADES": r("GRENADES")

#let head(title, pts: none, note: none, title-fill: teal) = {
  grid(columns: (1fr, auto), gutter: 2pt, align: horizon,
    text(size: 8pt, weight: "bold", fill: title-fill, upper(title)),
    if pts != none { text(size: 7pt, weight: "bold", fill: red, pts) },
  )
  if note != none { text(size: 5.5pt, fill: muted, note) }
  line(length: 100%, stroke: 0.35pt + ink)
}

#let card(title, body, pts: none, note: none, stroke: teal, title-fill: teal) = {
  rect(width: 100%, stroke: 0.45pt + stroke, inset: 1.8pt, radius: 0.7pt)[
    #head(title, pts: pts, note: note, title-fill: title-fill)
    #v(0.8pt)
    #body
  ]
}

#let group(body, stroke: blue) = rect(width: 100%, stroke: 1.5pt + stroke, inset: 1.2pt, radius: 1pt)[#body]

#let rule(name, body) = block(stroke: (left: 1pt + teal), inset: (left: 1.7pt), width: 100%)[*#name:* #body]

#let stats(rows) = table(
  columns: (2.1fr, .65fr, .6fr, .9fr, .6fr, .65fr, .6fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { teal-soft },
  table.header[*Model*][*M*][*T*][*Sv*][*W*][*Ld*][*OC*], ..rows,
)

#let weapons(rows, widths: (2.2fr, .7fr, .55fr, .62fr, .55fr, .55fr, .62fr, 2.25fr)) = table(
  columns: widths,
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { blue-soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*], ..rows,
)

#let melee-weapons(rows) = table(
  columns: (2.8fr, .85fr, .85fr, .7fr, .65fr, .65fr, .7fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { blue-soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*], ..rows,
)

#let buff-weapons(rows) = table(
  columns: (1.75fr, .62fr, .48fr, .58fr, 1.08fr, .5fr, .55fr, 2.45fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { blue-soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*], ..rows,
)

#let gap = v(2.8pt)

#grid(columns: (1fr, auto), gutter: 5pt, align: horizon)[
  #text(size: 9pt, weight: "bold")[THOUSAND SONS - GRAND COVEN]
  #text(size: 4.4pt, fill: muted)[11TH EDITION | Wahapedia Faction Pack v1.2 | New Recruit v36.2 | Data v13 | 17 Sep 2026]
][
  #text(size: 7pt, weight: "bold", fill: red)[2000 PTS]
]
#line(length: 100%, stroke: 0.8pt + teal)
#v(2pt)

#grid(columns: (1fr, 1fr, 1fr), gutter: 4pt, align: top)[
#card("Daemon Prince with Wings", note: "MONSTER | FLY | Eldritch Vortex applied | Deep Strike | Deadly Demise D3")[
    #stats(([Prince], [13"], [9], [2+/4++], [10], [6+], [3]))
    #v(1pt)
    #weapons((
      [Dark Blessing], [24"], [9], [2+ #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [#r("5") #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [-1], [#r("2")], [Ignores Cover, Psychic, Sustained 1],
      [Infernal cannon], [24"], [3], [2+ #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [5 #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [-2], [2], [-],
      [Hellforged - strike], [M], [6], [2+ #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [#r("9") #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [-2], [#r("4")], [Devs, Psychic],
      [Hellforged - sweep], [M], [12], [2+ #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [#r("7") #linebreak() #r("RR1 C") #linebreak() #r("RR PC")], [-1], [#r("2")], [Devs, Psychic],
    ), widths: (1.6fr, .65fr, .5fr, 1.35fr, 1.35fr, .5fr, .5fr, 1.8fr))
    - #r("Eldritch Vortex:") +1 Strength and Damage to bearer Psychic weapons (red above).
    - *Aetherstride:* Deep Strike in #r("MY Movement"): may land >6" horizontally away; Dark Blessing #r("Sustained D3"), no charge (this turn).
    - *Hunter:* #r("RR1 C: Hit/Wound 1s vs CHARACTER units. RR PC: full RR vs PSYKER CHARACTER units.") Destroy one: heal D3 (3 if PSYKER).
  ]
#gap
#group[
    #card("Exalted Sorcerer on Disc", note: "INFANTRY / MOUNTED | FLY | GRENADES | Incandaeum", stroke: blue, title-fill: blue)[
      #stats(([Exalted Sorcerer], [10"], [4], [3+/4++], [6], [6+], [2]))
      #v(1pt)
      #weapons((
        [Arcane Fire], [18"], [D6], [N/A], [6], [-2], [D3], [Ignores Cover, Psychic, Torrent],
        [Inferno bolt pistol], [12"], [1], [2+], [4], [-1], [1], [Pistol],
        [Force weapon], [M], [5], [2+], [6], [-1], [D3], [Psychic],
      ))
      - #b("INCANDAEUM:") Once/battle, select Doombolt even if another model already attempted it this phase.
      - #b("ILLUSIONS OF TZEENTCH:") This led unit can only be targeted by ranged attacks from within 18".
      - #b("BINDING TENDRILS:") in MY Shooting phase, after shooting, choose one enemy INFANTRY unit hit by Arcane Fire: -2" Move and -2 Charge until start of my next turn.
    ]
    #v(1.2pt)
    #card("Fatecaster Greatbows", note: "MOUNTED | FLY | Unit has GRENADES while Disc leads", stroke: blue, title-fill: blue)[
      #stats(([Enlightened], [10"], [4], [5+/5++], [2], [7+], [2]))
      #v(1pt)
      #weapons((
        [3x Fatecaster greatbow], [30"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal, Precision],
        [3x Close combat weapon], [M], [2], [4+], [4], [0], [1], [-],
      ))
      - #b("MALIGN TRICKERY:") Opponent Movement, if an enemy ends a move within 8" and this unit is unengaged, the whole attached unit (including Disc) may move normally up to D6".
    ]
  ]
#gap
#card("Tzaangor Enlightened - Spears", note: "MOUNTED | Fly")[
    #stats(([Enlightened], [10"], [4], [5+/5++], [2], [7+], [2]))
    #v(1pt)
    #weapons(([3x Divining spear], [M], [3], [4+], [5], [-1], [2], [Lance, Precision]))
    - *Prophesied Doom:* after charging, select an enemy in Engagement Range; roll for each model in this unit within Engagement Range of it, each 4+ inflicts 1 mortal.
  ]
  #gap

#gap
#card("Tzaangors", note: "INFANTRY | Scouts 6\"")[
    #stats(([Tzaangor], [6"], [4], [6+/6++], [1], [7+], [1]))
    #v(1pt)
    #weapons(([10x Tzaangor blades], [M], [2], [4+], [5], [0], [1], [-]))
    - *Ambushing Hunters:* end of opponent's turn, if more than 6" from all enemies, remove this unit into Strategic Reserves.
  ]
][
#card("Magnus the Red", note: "MONSTER | FLY | Must be Warlord | Deep Strike | Deadly Demise D6")[
    #stats(([Magnus], [14"], [11], [2+/4++], [16], [5+], [6]))
    #v(1pt)
    #weapons((
      [Gaze of Magnus], [24"], [3D3], [2+], [11], [-2], [3], [Devs, Psychic],
      [Tzeentch's Firestorm], [24"], [D6+3], [2+], [6], [-1], [2], [Blast, Ignores Cover, Psychic],
      [Blade - strike], [M], [7], [2+], [16], [-3], [3], [Devs, Psychic],
      [Blade - sweep], [M], [14], [2+], [8], [-1], [2], [Psychic],
    ))
    - *Unearthly Power:* start of battle round choose -1 Damage vs non-Psychic; at opponent Shooting start, one enemy within 24" gains Hazardous on ranged weapons; or #r("+2\" Move to friendly TS units within 6\" (including Magnus)"). Choice lasts until next battle round.
    - *Lord of the Planet of the Sorcerers:* attempt up to 2 Rituals/turn; +2 to Magnus's Psychic tests.
    - Damaged 1-6W: -1 to Hit.
  ]
#gap
#group(stroke: purple)[
    #card("Sorcerer", note: "INFANTRY | GRENADES | Attached to Rubric Marines", stroke: purple, title-fill: purple)[
      #stats(([Sorcerer], [6"], [4], [3+/5++], [4], [6+], [1]))
      #v(1pt)
      #buff-weapons((
        [Inferno bolt pistol], [12"], [1], [3+], [4 #r("RR1W/RRW obj")], [-1], [1], [Pistol, #r("LETHAL HITS")],
        [Pandaemonic Delusion], [24"], [6 #r("+3A")], [3+], [5 #r("+3S") #r("RR1W/RRW obj")], [-1], [1], [Psychic, Sustained Hits 3, #r("LETHAL HITS")],
        [Force weapon], [M], [4 #r("+3A")], [3+], [6 #r("+3S")], [-1], [D3], [Psychic, #r("LETHAL HITS")],
      ))
      - #r("EMPYRIC GUIDANCE:") While leading, #r("ALL WEAPONS IN THE UNIT GAIN LETHAL HITS") (shown red on both cards).
      - *Twisted Sorceries:* once/battle in MY Shooting or either Fight phase: this Sorcerer only gets +3 Strength/Attacks on Psychic weapons for the phase.
    ]
    #v(1.2pt)
    #card("Rubric Marines", note: "INFANTRY | Unit has GRENADES while Sorcerer leads", stroke: purple, title-fill: purple)[
      #stats((
        [Rubric Marine], [6"], [4], [3+/5++], [2], [7+], [2],
        [Aspiring Sorcerer], [6"], [4], [3+/5++], [3], [6+], [2],
      ))
      #v(1pt)
      #buff-weapons((
        [3x Warpflamer], [12"], [D6], [N/A], [4 #r("RR1W/RRW obj")], [-1], [1], [Torrent, #r("LETHAL HITS"), #r("IGNORES COVER")],
        [1x Soulreaper cannon], [24"], [6], [3+], [6 #r("RR1W/RRW obj")], [-2], [1], [Devs, #r("LETHAL HITS"), #r("IGNORES COVER")],
        [Warpflame pistol], [12"], [D6], [N/A], [3 #r("RR1W/RRW obj")], [-1], [1], [Pistol, Torrent, #r("LETHAL HITS"), #r("IGNORES COVER")],
        [Malefic Curse], [24"], [3], [3+], [4 #r("RR1W/RRW obj")], [-3], [1], [Anti-Inf 4+, Devs, Psychic, #r("LETHAL HITS"), #r("IGNORES COVER")],
        [Force weapon], [M], [3], [3+], [6], [-1], [D3], [Psychic, #r("LETHAL HITS")],
        [4x Close combat weapon], [M], [2], [3+], [4], [0], [1], [#r("LETHAL HITS")],
      ))
      - #r("BRINGERS OF CHANGE:") #r("Entire attached unit, INCLUDING SORCERER:") ranged attacks re-roll Wound 1; full Wound re-roll against a target within range of an objective you do not control. *Icon:* non-Character models' ranged weapons gain Ignores Cover.
    ]
  ]
][
#group(stroke: indigo)[
    #card("Sorcerer in Terminator Armour", note: "INFANTRY | Deep Strike | Umbralefic Crystal", stroke: indigo, title-fill: indigo)[
      #stats(([Terminator Sorcerer], [5"], [5], [2+/4++], [5], [6+], [1]))
      #v(1pt)
      #buff-weapons((
        [Inferno combi-bolter], [24"], [2], [3+ #r("+1H")], [4], [-2], [1], [Rapid Fire 2, #r("LETHAL HITS")],
        [Gaze of Hate], [18"], [3], [3+ #r("+1H")], [4], [-3], [2], [Anti-Monster/Vehicle 4+, Devs, Psychic, #r("LETHAL HITS")],
        [Force weapon], [M], [5], [3+], [6], [-1], [D3], [Psychic, #r("LETHAL HITS")],
      ))
      - #r("EMPYRIC GUIDANCE:") While leading, #r("ALL WEAPONS IN THE UNIT GAIN LETHAL HITS") (shown red on both cards).
      - #r("MARKED BY FATE:") start of MY Shooting, select enemy visible to this Sorcerer; #r("EVERY MODEL IN THE ATTACHED UNIT GETS +1 TO HIT") against it for the phase (red on both cards).
      - *Umbralefic Crystal:* once/battle/army in #r("MY COMMAND PHASE"), if unengaged, place the attached unit in Strategic Reserves. Deep Strike until my next Shooting phase; #r("MUST ingress in MY next Movement phase") (even turn 1).
    ]
    #v(1.2pt)
    #card("Scarab Occult Terminators", note: "INFANTRY | Bodyguard | Soulreaper cannons | Hellfyre missile racks", stroke: indigo, title-fill: indigo)[
      #stats((
        [Scarab Sorcerer], [5"], [5], [2+/4++], [4], [6+], [1],
        [Scarab Occult], [5"], [5], [2+/4++], [3], [7+], [1],
      ))
      #v(1pt)
      #buff-weapons((
        [8x Inferno combi-bolter], [24"], [2], [3+ #r("+1H")], [4], [-2], [1], [Rapid Fire 2, #r("LETHAL HITS")],
        [2x Soulreaper cannon], [24"], [6], [3+ #r("+1H")], [6], [-2], [1], [Devs, #r("LETHAL HITS")],
        [2x Hellfyre missile rack], [36"], [2], [3+ #r("+1H")], [10], [-2], [3], [#r("LETHAL HITS")],
        [Malefic Curse], [24"], [3], [3+ #r("+1H")], [4], [-3], [1], [Anti-Inf 4+, Devs, Psychic, #r("LETHAL HITS")],
        [Force weapon], [M], [4], [3+], [6], [-1], [D3], [Psychic, #r("LETHAL HITS")],
        [9x Prosperine khopesh], [M], [3], [3+], [5], [-2], [2], [#r("LETHAL HITS")],
      ))
      - Deep Strike. #r("Rites of Coalescence:") while unit contains a Psyker, attacks against the #r("WHOLE ATTACHED UNIT are -1 TO WOUND").
    ]
  ]
  #gap

  #card("Sekhetar Robots", note: "VEHICLE / WALKER | Infiltrators | Stealth")[
    #stats(([Sekhetar Robot], [8"], [6], [3+/5++], [4], [7+], [1]))
    #v(1pt)
    #weapons((
      [2x Pyreflux meltagun], [12"], [1], [4+], [10], [-4], [D6], [Melta 2],
      [2x Heavy warpflamer], [12"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [2x Hellfyre missile rack], [36"], [2], [4+], [10], [-2], [3], [-],
      [2x Close combat weapon], [M], [3], [4+], [5], [0], [1], [-],
    ))
    - *Prophetic Sentinels:* once/turn, when targeted with Fire Overwatch/Heroic Intervention, that use costs 1CP less.
  ]
#gap
#card("Chaos Spawn", note: [BEAST | #r("FEEL NO PAIN 5+")], stroke: blue, title-fill: blue)[
    #stats(([Chaos Spawn], [8"], [5], [4+ #linebreak() #b("5++") #linebreak() #r("5+++")], [4], [7+], [1]))
    #v(1pt)
    #melee-weapons(([2x Hideous mutations], [M], [D6+2], [4+], [5], [-1], [2]))
    - #b("REGENERATING MONSTROSITIES:") #b("At the start of each player's Command phase, one model regains up to 3 lost wounds.")
  ]
]
#v(4pt)
#line(length: 100%, stroke: 1.2pt + gold)
#text(size: 7pt, weight: "bold", fill: gold)[ARMY RULES, STRATAGEMS & PHASE REMINDERS]
#v(2pt)
#set text(size: 6.4pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 3pt, align: top)[
#card("Grand Coven Detachment Rule")[
    #rule("Kindred Sorcery - MY Command")[Choose one until your next Command phase; each choice is once per battle:]
    - *Imbued Manifestation:* +6" range to ranged Psychic weapons.
    - *Psychic Maelstrom:* +1 to Wound with Psychic weapons.
    - *Wrath of the Immaterium:* Psychic weapons gain Devastating Wounds.
  ]
  #gap

  #card("Rituals")[
    #table(
      columns: (.52fr, 1.12fr, 4fr), inset: cellpad, stroke: 0.25pt + linec,
      fill: (x, y) => if y == 0 { soft },
      table.header[*WC*][*Ritual*][*Effect*],
      [5/10], [Destiny's Ruin], [Visible enemy within 24": TS/Scintillating attacks re-roll Hit 1; 10+ re-roll Hits. This phase.],
      [6/10], [Temporal Surge], [Visible friendly TS/Scintillating within 24", not engaged: Normal move D6"; 10+ move 6". Cannot charge.],
      [7/11], [Doombolt], [Visible enemy within 24" suffers D3 mortals; 11+ D3+3. Exclude unattached Lone Operatives beyond 12".],
      [9/12], [Twist of Fate], [Visible enemy within 24": TS/Scintillating attacks improve AP by 1; 12+ by 2. This phase.],
    )
  ]
#gap
#card("Weapon Interactions", stroke: purple, title-fill: purple)[
    - *Torrent:* auto-hits; #r("no Lethal/Sustained triggers").
    - *Lethal + Sustained:* original critical hit may auto-wound; extra hits still roll wounds.
    - *11e Lethal is optional:* may roll to wound instead to seek Devastating Wounds. Anti 4+ triggers Devs on unmodified 4+ vs its listed target.
    - *Pistols:* each model shoots pistols OR its other ranged weapons.
  ]
][
#card("Grand Coven Stratagems", stroke: red, title-fill: red)[
    #rule("DESTINED BY FATE - 1CP, any phase")[After a save fails for a TS Psyker model, change that attack's Damage to 0.]
    #rule("ARCANE FOCUS - 1CP, Shooting")[After a Channelled Psychic test, re-roll every D6 in that test.]
    #rule("DEVASTATING SORCERY - 2CP, Shooting")[One TS Psyker unit not yet selected to shoot: Psychic weapons get +9" range and full Hit/Wound re-rolls for the phase.]
    #rule("PSYCHIC DOMINION - 1CP, any phase")[After enemy selects targets: its Psychic weapons gain Hazardous; targeted TS unit gets FNP 4+ vs Psychic Attacks.]
    #rule("EGOTISTICAL POWER - 1CP, MY Command")[One TS Psyker unit gets a selected Kindred Sorcery ability instead of army choice until MY next Command; may reuse a spent choice.]
    #rule("DESECRATION OF WORLDS - 1CP, MY Command")[One TS Psyker unit on an objective you control makes it sticky.]
  ]
  #gap
  #card("Attached-unit Interactions", stroke: purple, title-fill: purple)[
    - *Psychic buffs:* weapon attacks only; no +range, +wound or +Damage to Rituals.
    - *Buffs end with their source:* leader must be leading for Lethals/Illusions; Rubric re-rolls end when bodyguard dies; Icon ends when its bearer dies.
    - *GRENADES:* only foot/Disc Sorcerer models have it here. Their attached units qualify; measure Explosives from the Sorcerer, not bodyguards.
  ]
][
#card("Don't Forget - Phase Triggers", stroke: gold, title-fill: gold)[
    #rule("START OF BATTLE ROUND")[*Magnus:* choose one Unearthly Power ability.]
    #rule("MY COMMAND PHASE")[Choose *Kindred Sorcery*. *Umbralefic Crystal:* #r("MY COMMAND PHASE ONLY"), once/battle/army if unengaged. Reserve the attached unit; #r("MUST ingress in MY next Movement phase").]
    #rule("START OF EACH PLAYER'S COMMAND PHASE")[#b("CHAOS SPAWN: one model regains up to 3 lost wounds.")]
    #rule("START OF MY SHOOTING PHASE")[Attempt Rituals. *Marked by Fate:* select one visible enemy for the Terminator unit's +1 to Hit.]
    #rule("MY SHOOTING - AFTER DISC SHOOTS")[#b("If Arcane Fire hit enemy Infantry, apply Binding Tendrils: -2\" Move and -2 Charge until your next turn.")]
    #rule("START OF OPPONENT SHOOTING")[*Magnus:* if Treason chosen, select one enemy within 24"; its ranged weapons gain Hazardous this phase.]
    #rule("OPPONENT'S MOVEMENT PHASE")[#b("GREATBOWS: after an enemy ends a move within 8\", if unengaged, make a Normal move up to D6\".")]
    #rule("AFTER THE SPEARS CHARGE")[Roll one D6 per engaged model; each 4+ inflicts 1 mortal wound.]
    #rule("END OF OPPONENT'S TURN")[*Tzaangors:* if more than 6" from every enemy, you may put the unit into Strategic Reserves.]
  ]
]
