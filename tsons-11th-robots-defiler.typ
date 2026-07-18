#set page(paper: "a4", flipped: true, margin: 5mm)
#set text(font: "Arial", size: 6.1pt)
#set par(leading: 0.38em, spacing: 0.24em)

#let ink = rgb("#171717")
#let muted = rgb("#595959")
#let linec = rgb("#bdb6aa")
#let soft = rgb("#f3efe6")
#let accent = rgb("#006b78")
#let red = rgb("#8a2634")
#let blue = rgb("#0078aa")
#let green = rgb("#16804a")
#let gold = rgb("#8a6b1f")

#let r(body) = text(fill: red, weight: "bold", body)
#let b(body) = text(fill: blue, weight: "bold", body)
#let g(body) = text(fill: green, weight: "bold", body)
#let cellpad = (x: 2pt, y: 1.3pt)

#show "Psychic": b("Psychic")
#show "Psyker": b("Psyker")

#let head(title, tag: none, tag-fill: ink, note: none) = {
  grid(columns: (1fr, auto), gutter: 4pt, align: horizon)[
    #text(size: 8.4pt, weight: "bold", fill: ink, upper(title))
  ][
    #if tag != none { text(size: 7.2pt, weight: "bold", fill: tag-fill, upper(tag)) }
  ]
  if note != none { text(size: 5.9pt, fill: muted, note) }
  line(length: 100%, stroke: 0.45pt + ink)
}

#let card(title, body, tag: none, tag-fill: ink, note: none) = {
  rect(width: 100%, stroke: 0.55pt + linec, inset: 3pt, radius: 1pt)[
    #head(title, tag: tag, tag-fill: tag-fill, note: note)
    #v(1.8pt)
    #body
  ]
}

#let rule(name, body) = block(stroke: (left: 1.35pt + accent), inset: (left: 2.8pt), width: 100%)[*#name:* #body]

#let stats(rows) = table(
  columns: (2.2fr, .75fr, .75fr, .9fr, .75fr, .75fr, .75fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Model*][*M*][*T*][*SV*][*W*][*LD*][*OC*],
  ..rows,
)

#let weapons(rows) = table(
  columns: (2.55fr, .8fr, .72fr, .72fr, .68fr, .68fr, .68fr, 2.8fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
  ..rows,
)

#let strat(name, cost, when, target, effect, hot: false) = {
  rect(width: 100%, stroke: if hot { 1pt + red } else { 0.45pt + linec }, inset: 2.6pt)[
    #grid(columns: (1fr, auto), gutter: 4pt)[
      #text(size: 7.4pt, weight: "bold", fill: if hot { red } else { ink })[#name]
    ][
      #text(size: 7.4pt, weight: "bold", fill: if hot { red } else { ink })[#cost]
    ]
    *When:* #when \
    *Target:* #target \
    *Effect:* #effect
  ]
}

#let ritual-table() = table(
  columns: (.55fr, 1.25fr, 4.5fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*WC*][*Ritual*][*Effect*],
  [5/10], [Destiny's Ruin], [Enemy within 24\" visible: Thousand Sons / Scintillating attacks re-roll Hit 1. On 10+, re-roll Hits.],
  [6/10], [Temporal Surge], [Friendly Thousand Sons / Scintillating unit within 24\" visible and not engaged makes a Normal move up to D6\". On 10+, up to 6\". Cannot charge.],
  [7/11], [Doombolt], [Enemy within 24\" visible takes D3 mortal wounds. On 11+, D3+3. Lone Operative exclusion outside 12\".],
  [9/12], [Twist of Fate], [Enemy within 24\" visible: Thousand Sons / Scintillating attacks improve AP by 1. On 12+, improve AP by 2.],
)

#let roster() = table(
  columns: (1.8fr, .55fr, 3.4fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Unit*][*Pts*][*Loadout / role*],
  [Magnus the Red], [455], [Warlord. Primary damage and ritual battery.],
  [Sorcerer], [110], [Empyric Onslaught, khopesh, Pandaemonic Delusion. Leads Rubrics.],
  [Sorcerer], [85], [Khopesh, Pandaemonic Delusion. Leads Rubrics.],
  [Sorcerer in Terminator Armour], [95], [Gaze of Hate, combi-bolter. Leads Scarabs.],
  [5 Rubric Marines], [100], [3 warpflamers, soulreaper, icon, warpflame pistol.],
  [5 Rubric Marines], [100], [3 warpflamers, soulreaper, icon, warpflame pistol.],
  [10 Scarab Occult Terminators], [370], [2 soulreapers, 2 missile racks, combi-bolters.],
  [Defiler], [310], [Ectoplasma, 2 excruciator cannons, 2 heavy reapers, claws.],
  [4 Sekhetar Robots], [160], [Power claws, warpflame projectors, heavy flamers, missile racks.],
  [4 Sekhetar Robots], [160], [Pyreflux meltaguns, heavy flamers, missile racks.],
  [3 Tzaangor Enlightened], [55], [Fatecaster greatbows. Screen, score, move-block.],
)

#text(size: 13pt, weight: "bold")[Thousand Sons 11th - Robots + Defiler Reference]
#h(8pt)
#text(size: 8pt, fill: muted)[2000 pts | Hexwarp Thrallband + Sekhetar Cohort | Take and Hold | Built for the 2x4 Sekhetar Robots + Defiler shell]
#v(3pt)

#columns(3, gutter: 4.5pt)[
  #card("Army List")[
    #roster()
    #v(2pt)
    #rule("Basic plan")[Magnus + Scarabs pressure the center. Rubrics generate Cabal utility and trade. One Robot unit brawls, one hunts hard targets. Defiler anchors fire lanes and overwatch threat. Enlightened score and screen.]
  ]

  #card("Faction Rules")[
    #rule("Cabal of Sorcerers")[Start of your Shooting phase, eligible models attempt Rituals. Roll 2D6; optionally Channel the Warp with +1D6. If Channelled and any doubles/triples are rolled, that model's unit suffers D3 mortal wounds. Magnus attempts 2 Rituals per turn and gets +2.]
    #v(2pt)
    #ritual-table()
    #v(2pt)
    #rule("Kindred Sorcery")[Command phase: choose one once per battle until next Command phase - +6\" range to Psychic weapons, +1 to Wound with Psychic weapons, or Psychic weapons gain Devastating Wounds.]
  ]

  #card("Priority Reminders")[
    - #r("Protect Magnus") from early angles; his aura/rules are worth more than one extra shot.\
    - #r("Temporal Surge") is often your best scoring ritual; use it before damage rituals when mission tempo matters.\
    - #r("Twist of Fate") stacks best into the unit your Scarabs / Magnus / Defiler are already deleting.\
    - #r("Robots") can force awkward screens: one unit trades forward, one stages as counterpunch.\
    - #r("Defiler") wants lanes plus Psyker proximity for improved Overwatch thresholds.\
    - #r("Enlightened") are not damage pieces; keep them alive for late primary/secondary flips.
  ]
]

#v(4pt)

#columns(3, gutter: 4.5pt)[
  #card("Magnus the Red", note: r("Warlord. Deep Strike. Deadly Demise D6."))[
    #stats(([Magnus], [14\"], [11], [2+/4++], [16], [5+], [6]))
    #v(1.5pt)
    #weapons((
      [Gaze of Magnus], [24\"], [3D3], [2+], [11], [-2], [3], [Dev Wounds, Psychic],
      [Tzeentch's Firestorm], [24\"], [D6+3], [2+], [6], [-1], [2], [Blast, Ignores Cover, Psychic],
      [Blade - strike], [Melee], [7], [2+], [16], [-3], [3], [Dev Wounds, Psychic],
      [Blade - sweep], [Melee], [14], [2+], [8], [-1], [2], [Psychic],
    ))
    - Damaged 1-6W: -1 to Hit. Start of battle round choose defensive, anti-shooting Hazardous aura, or +2\" Move aura.
  ]

  #card("Sorcerer + Rubrics", note: r("Two 5-model units. One Sorcerer has Empyric Onslaught."))[
    #stats((
      [Sorcerer], [6\"], [4], [3+/5++], [4], [6+], [1],
      [Rubric / Aspiring], [6\"], [4], [3+/5++], [2/3], [7+/6+], [2],
    ))
    #v(1.5pt)
    #weapons((
      [Pandaemonic Delusion], [24\"], [6], [3+], [5], [-1], [1], [Psychic, Sustained 3],
      [Malefic Curse], [24\"], [3], [3+], [4], [-3], [1], [Anti-Inf 4+, Devs, Psychic],
      [Warpflamers x3], [12\"], [D6], [N/A], [4], [-1], [1], [Torrent, Ignores Cover],
      [Soulreaper], [24\"], [6], [3+], [6], [-2], [1], [Dev Wounds, Ignores Cover],
      [Force weapon], [Melee], [3/4], [3+], [6], [-1], [D3], [Psychic],
    ))
    - Sorcerer gives led Rubrics Lethal Hits. Rubrics re-roll Wound 1; full Wound re-roll into targets on objectives you do not control.
  ]

  #card("Terminator Sorcerer + Scarabs", note: r("10 Scarabs: 2 soulreapers, 2 missile racks."))[
    #stats((
      [Terminator Sorcerer], [5\"], [5], [2+/4++], [5], [6+], [1],
      [Scarab Occult], [5\"], [5], [2+/4++], [3], [6+], [1],
    ))
    #v(1.5pt)
    #weapons((
      [Gaze of Hate], [18\"], [D6], [3+], [6], [-2], [2], [Dev Wounds, Psychic],
      [Inferno combi-bolters], [24\"], [2], [3+], [4], [-1], [1], [Rapid Fire 2],
      [Soulreaper x2], [24\"], [6], [3+], [6], [-2], [1], [Dev Wounds],
      [Hellfyre rack x2], [36\"], [2], [3+], [10], [-2], [3], [-],
      [Prosperine khopesh], [Melee], [3], [3+], [5], [-2], [2], [-],
    ))
    - Scarabs are Deep Strike. While the unit contains a Psyker, subtract 1 from Wound rolls for attacks targeting it.
  ]
]

#v(4pt)

#columns(3, gutter: 4.5pt)[
  #card("Sekhetar Robots - Brawler", tag: "Infiltrate", tag-fill: green)[
    #stats(([Sekhetar Robot], [8\"], [6], [3+/5++], [4], [7+], [1]))
    #v(1.5pt)
    #weapons((
      [Heavy warpflamer x4], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [Hellfyre rack x4], [36\"], [2], [4+], [10], [-2], [3], [-],
      [Warpflame projector x4], [12\"], [D6], [N/A], [5], [-1], [1], [Torrent],
      [Power claw x4], [Melee], [3], [4+], [10], [-2], [3], [-],
    ))
    - Infiltrators, Stealth. Once per battle round, Fire Overwatch or Heroic Intervention for 0CP.
  ]

  #card("Sekhetar Robots - Pyreflux", tag: "Anti-tank", tag-fill: gold)[
    #stats(([Sekhetar Robot], [8\"], [6], [3+/5++], [4], [7+], [1]))
    #v(1.5pt)
    #weapons((
      [Pyreflux meltagun x4], [12\"], [1], [4+], [10], [-4], [D6], [Melta 2],
      [Heavy warpflamer x4], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [Hellfyre rack x4], [36\"], [2], [4+], [10], [-2], [3], [-],
      [Close combat weapon x4], [Melee], [3], [4+], [5], [0], [1], [-],
    ))
    - Stage within 12\" threat but do not expose early. Best into vehicles, monsters and elite save profiles.
  ]

  #card("Defiler", note: r("Ectoplasma build. Deadly Demise D6. FNP 6+."))[
    #stats(([Defiler], [12\"], [11], [3+/5++], [18], [6+], [5]))
    #v(1.5pt)
    #weapons((
      [Ectoplasma destructor], [36\"], [D6], [3+], [12], [-3], [3], [Blast],
      [Excruciator cannons x2], [36\"], [6], [3+], [6], [-2], [2], [-],
      [Heavy reapers x2], [48\"], [4], [3+], [9], [-2], [3], [Dev Wounds, Sustained 1],
      [Shearing claws - strike], [Melee], [5], [3+], [16], [-3], [D6+1], [-],
      [Shearing claws - sweep], [Melee], [10], [3+], [6], [-2], [1], [-],
    ))
    - Moves through models/terrain during Normal, Advance and Fall Back moves. Overwatch hits on 5+; on 4+ if target is within 9\" of a friendly TS Psyker.
  ]
]

#v(4pt)

#columns(3, gutter: 4.5pt)[
  #card("Tzaangor Enlightened - Greatbows")[
    #stats(([Enlightened], [10\"], [4], [5+/5++], [2], [7+], [2]))
    #v(1.5pt)
    #weapons((
      [Fatecaster greatbow x3], [30\"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal Hits, Precision],
      [Close combat weapon x3], [Melee], [2], [4+], [4], [0], [1], [-],
    ))
    - Malign Trickery: once per turn, when enemy ends a Normal, Advance or Fall Back move within 9\" and this unit is not engaged, make a Normal move up to D6\".
  ]

  #colbreak()

  #card("Key Stratagems")[
    #strat("Destined by Fate", "1CP", "After a saving throw is failed for a Thousand Sons Psyker model.", "That Psyker model.", "Change the Damage characteristic of one failed-save attack to 0.", hot: true)
    #v(2pt)
    #strat("Arcane Focus", "1CP", "Your Shooting phase, after a Channelled Psychic test, before resolving the Ritual.", "That Thousand Sons model.", "Re-roll all dice for the Psychic test, including the Channel die.", hot: true)
    #v(2pt)
    #strat("Devastating Sorcery", "2CP", "Your Shooting phase.", "One Thousand Sons Psyker unit not yet selected to shoot.", "Psychic weapons get +9\" range and re-roll Hit and Wound rolls.", hot: true)
  ]

  #colbreak()

  #card("More Stratagems / Calls")[
    #strat("Psychic Dominion", "1CP", "After an enemy unit selects targets.", "One Thousand Sons unit selected as a target.", "Attacking Psychic weapons gain Hazardous; your unit has FNP 4+ vs Psychic Attacks.")
    #v(2pt)
    #strat("Desecration of Worlds", "1CP", "Your Command phase.", "One Thousand Sons Psyker unit on an objective you control.", "That objective remains yours until opponent's Level of Control exceeds yours at end of a phase.")
    #v(2pt)
    #rule("Pre-game")[Confirm mission pack, points, enhancements and exact datasheets in the official app before submitting.]
  ]
]
