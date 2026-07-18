#set page(paper: "a4", margin: 5mm)
#set text(font: "Arial", size: 6.0pt)
#set par(leading: 0.36em, spacing: 0.22em)

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
#let cellpad = (x: 1.8pt, y: 1.2pt)

#show "Psychic": b("Psychic")
#show "Psyker": b("Psyker")
#show "Sekhetar Robots": g("Sekhetar Robots")

#let head(title, tag: none, tag-fill: ink, note: none) = {
  grid(columns: (1fr, auto), gutter: 4pt, align: horizon)[
    #text(size: 8.2pt, weight: "bold", fill: ink, upper(title))
  ][
    #if tag != none { text(size: 7.0pt, weight: "bold", fill: tag-fill, upper(tag)) }
  ]
  if note != none { text(size: 5.7pt, fill: muted, note) }
  line(length: 100%, stroke: 0.45pt + ink)
}

#let card(title, body, tag: none, tag-fill: ink, note: none) = {
  rect(width: 100%, stroke: 0.55pt + linec, inset: 2.7pt, radius: 1pt)[
    #head(title, tag: tag, tag-fill: tag-fill, note: note)
    #v(1.6pt)
    #body
  ]
}

#let rule(name, body) = block(stroke: (left: 1.3pt + accent), inset: (left: 2.6pt), width: 100%)[*#name:* #body]

#let stats(rows) = table(
  columns: (2.2fr, .75fr, .75fr, .9fr, .75fr, .75fr, .75fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Model*][*M*][*T*][*SV*][*W*][*LD*][*OC*],
  ..rows,
)

#let weapons(rows) = table(
  columns: (2.35fr, .78fr, .72fr, .72fr, .66fr, .66fr, .66fr, 2.55fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
  ..rows,
)

#let strat(name, cost, det, when, target, effect, hot: false) = {
  rect(width: 100%, stroke: if hot { 1pt + red } else { 0.45pt + linec }, inset: 2.4pt)[
    #grid(columns: (1fr, auto), gutter: 4pt)[
      #text(size: 7.2pt, weight: "bold", fill: if hot { red } else { ink })[#name]
    ][
      #text(size: 7.2pt, weight: "bold", fill: if hot { red } else { ink })[#cost]
    ]
    #text(size: 5.4pt, fill: muted)[#det]
    #linebreak()
    *When:* #when \
    *Target:* #target \
    *Effect:* #effect
  ]
}

#let ritual-table() = table(
  columns: (.58fr, 1.28fr, 4.5fr),
  inset: cellpad,
  stroke: 0.32pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*WC*][*Ritual*][*Effect*],
  [5/10], [Destiny's Ruin], [Enemy within 24\" visible: Thousand Sons / Scintillating attacks re-roll Hit 1. On 10+, re-roll Hits.],
  [6/10], [Temporal Surge], [Friendly Thousand Sons / Scintillating unit within 24\" visible and not engaged makes a Normal move up to D6\". On 10+, up to 6\". Cannot charge.],
  [7/11], [Doombolt], [Enemy within 24\" visible takes D3 mortal wounds. On 11+, D3+3. Lone Operative exclusion outside 12\".],
  [9/12], [Twist of Fate], [Enemy within 24\" visible: Thousand Sons / Scintillating attacks improve AP by 1. On 12+, improve AP by 2.],
)

#text(size: 12pt, weight: "bold")[Thousand Sons 11th - Robots + Defiler Reference]
#h(6pt)
#text(size: 7.2pt, fill: muted)[Hexwarp Thrallband + Sekhetar Cohort | Take and Hold | Faction pack PDF saved in rules/]
#v(3pt)

#columns(2, gutter: 4pt)[
  #card("Faction Rules")[
    #rule("Cabal of Sorcerers")[Start of your Shooting phase, eligible models attempt Rituals. Roll 2D6; optionally Channel the Warp with +1D6. If Channelled and any doubles/triples are rolled, that model's unit suffers D3 mortal wounds. Magnus attempts 2 Rituals per turn and gets +2.]
    #v(2pt)
    #ritual-table()
  ]

  #card("Detachment Rules")[
    #rule("Hexwarp - Flow of Magic")[Your deployment zone is always in Flow. At the start of any phase, if you control at least half the objective markers in No Man's Land or the opponent's deployment zone, that area is in Flow until end of phase. Thousand Sons Psychic Attacks re-roll Wound 1; wholly within Flow, add 1 to Wound instead.]
    #v(2pt)
    #rule("Sekhetar - Ensorcelled Animus")[Friendly Sekhetar Robots attacks have Psychic. Friendly Thousand Sons Psyker units have Infusion aura: while a friendly Sekhetar Robots unit is within 12\", that unit's melee attacks have +1 WS.]
    #v(2pt)
    #rule("Enhancements in list")[Empyric Onslaught: while bearer is wholly within Flow, add 3 Attacks to bearer's ranged Psychic weapons.]
  ]
]

#v(3pt)

#columns(2, gutter: 4pt)[
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
    - Sorcerer in Terminator Armour: at start of your Shooting phase select one visible enemy; this unit gets +1 to Hit into it.
  ]

  #colbreak()

  #card("Sekhetar Robots - Brawler", tag: "Infiltrate", tag-fill: green)[
    #stats(([Sekhetar Robot], [8\"], [6], [3+/5++], [4], [7+], [1]))
    #v(1.5pt)
    #weapons((
      [Heavy warpflamer x4], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent, Psychic],
      [Hellfyre rack x4], [36\"], [2], [4+], [10], [-2], [3], [Psychic],
      [Warpflame projector x4], [12\"], [D6], [N/A], [5], [-1], [1], [Torrent, Psychic],
      [Power claw x4], [Melee], [3], [4+], [10], [-2], [3], [Psychic],
    ))
    - Infiltrators, Stealth. Prophetic Sentinels: once per turn, Fire Overwatch / Heroic Intervention use is -1CP.
  ]

  #card("Sekhetar Robots - Pyreflux", tag: "Anti-tank", tag-fill: gold)[
    #stats(([Sekhetar Robot], [8\"], [6], [3+/5++], [4], [7+], [1]))
    #v(1.5pt)
    #weapons((
      [Pyreflux meltagun x4], [12\"], [1], [4+], [10], [-4], [D6], [Melta 2, Psychic],
      [Heavy warpflamer x4], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent, Psychic],
      [Hellfyre rack x4], [36\"], [2], [4+], [10], [-2], [3], [Psychic],
      [Close combat weapon x4], [Melee], [3], [4+], [5], [0], [1], [Psychic],
    ))
    - Keep near a Psyker to access Infusion and Sekhetar Cohort stratagem targeting clauses.
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

  #card("Tzaangor Enlightened - Greatbows")[
    #stats(([Enlightened], [10\"], [4], [5+/5++], [2], [7+], [2]))
    #v(1.5pt)
    #weapons((
      [Fatecaster greatbow x3], [30\"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal Hits, Precision],
      [Close combat weapon x3], [Melee], [2], [4+], [4], [0], [1], [-],
    ))
    - Malign Trickery: in opponent's Movement phase, if enemy ends a move within 8\" and this unit is not engaged, it can make a Normal move up to D6\".
  ]
]

#pagebreak()

#text(size: 11pt, weight: "bold")[Stratagems - Faction Pack Detachments]
#h(6pt)
#text(size: 7pt, fill: muted)[Hexwarp Thrallband and Sekhetar Cohort only. Grand Coven stratagems intentionally removed.]
#v(3pt)

#columns(2, gutter: 4pt)[
  #card("Sekhetar Cohort Stratagems")[
    #strat("Arcane Venting", "1CP", "Sekhetar Cohort", "End of your Movement phase.", "One friendly Sekhetar Robots unit.", "Select one objective your unit is controlling. That objective is secured.", hot: true)
    #v(2pt)
    #strat("Ectoplasmic Extrusion", "1CP", "Sekhetar Cohort", "Your Shooting phase, when a friendly Sekhetar Robots unit within 12\" of a friendly Thousand Sons Psyker starts an action.", "That Sekhetar Robots unit.", "That action does not prevent your unit from being eligible to shoot.", hot: true)
    #v(2pt)
    #strat("Warp Fields", "1CP", "Sekhetar Cohort", "Opponent's Shooting phase, when an enemy targets a friendly Sekhetar Robots unit within 12\" of a friendly Thousand Sons Psyker.", "That Sekhetar Robots unit.", "Ranged attacks with Strength greater than your unit's Toughness have -1 to Wound.", hot: true)
  ]

  #colbreak()

  #card("Hexwarp Thrallband Stratagems")[
    #strat("Warding Hex", "1CP", "Hexwarp Thrallband", "Command phase.", "One Thousand Sons Psyker unit within range of an objective you control, if that objective is wholly within Flow of Magic.", "That objective remains yours until opponent's Level of Control is greater at the end of a phase.", hot: true)
    #v(2pt)
    #strat("Wrath of the Doomed", "1CP", "Hexwarp Thrallband", "Fight phase, just after an enemy unit selects targets.", "One Thousand Sons unit selected as a target.", "Destroyed models that have not fought can fight on a 4+ before removal; add 1 if wholly within Flow.", hot: true)
    #v(2pt)
    #strat("Strands of Time", "1CP", "Hexwarp Thrallband", "Your Movement phase, just after a Thousand Sons Psyker unit Falls Back.", "That Thousand Sons Psyker unit.", "Eligible to shoot or charge after Falling Back; if wholly within Flow, eligible to shoot and charge.", hot: true)
    #v(2pt)
    #strat("Through the Veil", "1CP", "Hexwarp Thrallband", "Start of the Reinforcements step of your Movement phase.", "One Rubric Marines or Scarab Occult Terminators unit in Strategic Reserves.", "Rubrics gain Deep Strike for the phase. Scarabs can set up wholly within Flow and more than 6\" away; Scarabs cannot charge that turn.", hot: true)
    #v(2pt)
    #strat("Scouring Warpflame", "1CP", "Hexwarp Thrallband", "Your Shooting phase.", "One Thousand Sons Psyker unit not yet selected to shoot and wholly within Flow.", "Ranged weapons gain Ignores Cover. After shooting, one enemy hit cannot have Benefit of Cover until end of phase.", hot: true)
    #v(2pt)
    #strat("Kaleidoscopic Tempest", "1CP", "Hexwarp Thrallband", "Opponent's Shooting phase, just after an enemy unit selects targets.", "One Thousand Sons Psyker unit selected as a target.", "Your unit has Stealth; if wholly within Flow, your unit has Benefit of Cover against those attacks.", hot: true)
  ]
]
