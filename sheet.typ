#set page(paper: "a4", flipped: true, margin: 6mm)
#set text(font: "Arial", size: 6.8pt)
#set par(leading: 0.38em, spacing: 0.28em)

#let ink = rgb("#171717")
#let muted = rgb("#595959")
#let ruleline = rgb("#bdb6aa")
#let soft = rgb("#f3efe6")
#let accent = rgb("#006b78")
#let red = rgb("#8a2634")

#let cellpad = (x: 2pt, y: 1.4pt)

#let head(title, pts: none, note: none) = {
  grid(
    columns: (1fr, auto),
    gutter: 4pt,
    align: horizon,
    text(size: 9pt, weight: "bold", upper(title)),
    if pts != none { text(size: 8.5pt, weight: "bold", pts) },
  )
  if note != none { text(size: 6.1pt, fill: muted, note) }
  line(length: 100%, stroke: 0.45pt + ink)
}

#let card(title, pts: none, note: none, body) = {
  rect(width: 100%, stroke: 0.55pt + ruleline, inset: 3.4pt)[
    #head(title, pts: pts, note: note)
    #v(2pt)
    #body
  ]
}

#let rule(name, body) = {
  block(stroke: (left: 1.6pt + accent), inset: (left: 3pt), width: 100%)[
    *#name:* #body
  ]
}

#let stats(rows) = table(
  columns: (2.5fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  inset: cellpad,
  stroke: 0.35pt + ruleline,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Model*][*M*][*T*][*SV*][*W*][*LD*][*OC*],
  ..rows,
)

#let weapons(rows) = table(
  columns: (2.8fr, 1.05fr, .85fr, .9fr, .8fr, .8fr, .8fr, 2.8fr),
  inset: cellpad,
  stroke: 0.35pt + ruleline,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
  ..rows,
)

#let twocol(items) = grid(columns: (1fr, 1fr), gutter: 4pt, ..items)

#rect(width: 100%, stroke: 1pt + ink, inset: 5pt)[
  #grid(columns: (1fr, auto), gutter: 8pt, align: horizon)[
    #text(size: 15pt, weight: "bold")[Thousand Sons - Grand Coven]
    #linebreak()
    #text(size: 7pt, fill: muted)[2000pts, 15 units. Warlord: Magnus the Red. Leaders: Terminator Sorcerer with Scarab Occult; each Rubric unit has one Sorcerer attached.]
  ][
    #grid(columns: (auto, auto, auto, auto), gutter: 3pt,
      rect(fill: soft, stroke: 0.35pt + ruleline, inset: 2pt)[*Kindred Sorcery*],
      rect(fill: soft, stroke: 0.35pt + ruleline, inset: 2pt)[*6 Characters*],
      rect(fill: soft, stroke: 0.35pt + ruleline, inset: 2pt)[*Bring It Down 10*],
      rect(fill: soft, stroke: 0.35pt + ruleline, inset: 2pt)[*Assassination 6*],
    )
  ]
]

#v(4pt)

#grid(columns: (1fr, 1fr, 1fr), gutter: 5pt, align: top)[
  #card("Army Rules")[
    #rule("Flow of Magic")[Your deployment zone is always in Flow. At the start of any phase, No Man's Land is in Flow if you control at least half its objectives; the enemy deployment zone is in Flow if you control at least half its objectives. Psychic Attacks re-roll Wound rolls of 1; if wholly within Flow, add 1 to Wound instead.]
    #rule("Kindred Sorcery, Command phase")[Choose one, once per battle each, until your next Command phase: +6\" range to ranged Psychic weapons; +1 to Wound for Psychic weapons; or Psychic weapons gain Devastating Wounds.]
    #rule("Cabal of Sorcerers")[Start of Shooting phase, each eligible model can attempt one Ritual not already attempted this turn. Roll 2D6, optionally Channel the Warp with +1D6; doubles/triples cause D3 mortal wounds to that unit. Magnus can attempt 2 Rituals per turn and gets +2 to tests.]
    #rule("Mortal Sorcery Aura")[Friendly Scintillating Legions Psyker units within 6\" and visible to this unit have Cabal of Sorcerers.]
  ]

  #v(4pt)

  #card("Rituals")[
    #table(
      columns: (.55fr, 1.5fr, 4.2fr),
      inset: cellpad,
      stroke: 0.35pt + ruleline,
      fill: (x, y) => if y == 0 { soft },
      table.header[*WC*][*Ritual*][*Effect*],
      [5], [Destiny's Ruin], [Enemy within 24\" visible: TS/Scintillating attacks re-roll Hit 1; on 10+ re-roll Hit roll.],
      [6], [Temporal Surge], [Friendly TS/Scintillating unit within 24\" visible, not engaged: Normal move D6\"; on 10+ move 6\". Cannot charge.],
      [6], [Sorcerous Facade], [Friendly TS Infantry/Mounted within 24\" visible: remove to Strategic Reserves; on 10+ set up immediately using Deep Strike.],
      [7], [Doombolt], [Enemy within 24\" visible suffers D3 mortals; on 11+ D3+3. Lone Operative restriction outside 12\".],
      [7], [Warp Reality], [Area terrain within 24\" visible: roll per enemy model inside; each 6 causes 1 mortal, max 6. On 11+, triggers on 5+.],
      [8], [Shadow Puppeteer], [Enemy within 24\" visible: -1 Hit until next Shooting phase; on 12+, also -1 Wound.],
      [8], [Divine the Future], [Gain 1CP; on 11+, manifesting model gains 1 Lore point.],
      [9], [Twist of Fate], [Enemy within 24\" visible: TS/Scintillating attacks improve AP by 1; on 12+, improve AP by 2.],
    )
  ]

  #v(4pt)

  #card("Magnus the Red", pts: "435", note: "Warlord. Deep Strike. Deadly Demise D6.")[
    #stats((
      [Magnus], [14\"], [11], [2+], [16], [5+], [6],
    ))
    #v(2pt)
    #weapons((
      [Gaze of Magnus], [24\"], [3D3], [2+], [11], [-2], [3], [Dev Wounds, Psychic],
      [Tzeentch's Firestorm], [24\"], [D6+3], [2+], [6], [-1], [2], [Blast, Ignores Cover, Psychic],
      [Blade strike], [Melee], [7], [2+], [16], [-3], [3], [Dev Wounds, Psychic],
      [Blade sweep], [Melee], [14], [2+], [8], [-1], [2], [Psychic],
    ))
    - *4++.* Damaged 1-6W: -1 to Hit for Magnus's attacks.
    - *Unearthly Power:* start of battle round choose Impossible Form (-1 Damage vs non-Psychic attacks), Treason of Tzeentch (enemy ranged weapons within 24\" gain Hazardous for their Shooting phase), or Time Flux aura (+2\" Move for friendly TS within 6\").
  ]
][
  #card("Daemon Prince with Wings", pts: "205", note: "Eldritch Vortex of E'taph applied below. Deep Strike. Deadly Demise.")[
    #stats((
      [Prince], [13\"], [9], [2+], [10], [6+], [3],
    ))
    #v(2pt)
    #weapons((
      [Dark Blessing], [24\"], [9], [2+], [5], [-1], [2], [Ignores Cover, Psychic, Sustained Hits 1],
      [Infernal cannon], [24\"], [3], [2+], [5], [-2], [2], [-],
      [Hellforged strike], [Melee], [6], [2+], [9], [-2], [4], [Dev Wounds, Psychic],
      [Hellforged sweep], [Melee], [12], [2+], [7], [-1], [2], [Dev Wounds, Psychic],
    ))
    - *4++.* *Eldritch Vortex:* +1 Strength and Damage to bearer's Psychic weapons.
    - *Aetherstride:* when set up with Deep Strike in Movement phase, can arrive more than 6\" away; Dark Blessing gains Sustained Hits D3; cannot charge.
    - *Hunter of Souls:* into Character units, re-roll Hit 1 and Wound 1; into Psyker Character, re-roll Hits and Wounds. Destroy Character: heal D3, or 3 if Psyker.
  ]

  #v(4pt)

  #card("3x Rubric Marines + Sorcerer", pts: "540", note: "Each unit: 5 Rubrics plus one attached Sorcerer. Each block costs 180.")[
    #stats((
      [Rubric Marine], [6\"], [4], [3+], [2], [7+], [2],
      [Aspiring Sorcerer], [6\"], [4], [3+], [3], [6+], [2],
      [Attached Sorcerer], [6\"], [4], [3+], [4], [6+], [1],
    ))
    #v(2pt)
    #weapons((
      [3x Warpflamer], [12\"], [D6], [N/A], [4], [-1], [1], [Ignores Cover, Torrent],
      [1x Soulreaper cannon], [24\"], [6], [3+], [6], [-2], [1], [Dev Wounds; Icon adds Ignores Cover],
      [Aspiring Malefic Curse], [24\"], [3], [3+], [4], [-3], [1], [Anti-Inf 4+, Dev Wounds, Psychic],
      [Sorcerer Pandaemonic Delusion], [24\"], [6], [3+], [5], [-1], [1], [Psychic, Sustained Hits 3],
      [Sorcerer force weapon], [Melee], [4], [3+], [6], [-1], [D3], [Psychic],
    ))
    - *5++.* *Empyric Guidance:* while Sorcerer leads, unit weapons have Lethal Hits.
    - *Bringers of Change:* ranged attacks re-roll Wound 1; if target is within range of an objective you do not control, re-roll Wound roll.
    - *Twisted Sorceries:* once per battle in Shooting or Fight, Sorcerer's Psychic weapons get +3 Strength and +3 Attacks until end of phase.
  ]

  #v(4pt)

  #card("2x Sekhetar Robots", pts: "160", note: "Two identical units of 2 robots.")[
    #stats((
      [Sekhetar Robot], [8\"], [6], [3+], [4], [7+], [1],
    ))
    #v(2pt)
    #weapons((
      [Pyreflux meltagun], [12\"], [1], [4+], [10], [-4], [D6], [Melta 2],
      [Heavy warpflamer], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [Hellfyre missile rack], [36\"], [2], [4+], [10], [-2], [3], [-],
      [Close combat weapon], [Melee], [3], [4+], [5], [0], [1], [-],
    ))
    - *5++.* Infiltrators, Stealth. Once per battle round, target this unit with Fire Overwatch or Heroic Intervention for 0CP.
  ]
][
  #card("Scarab Occult + Terminator Sorcerer", pts: "465", note: "10 Terminators led by Sorcerer in Terminator Armour with Umbralefic Crystal.")[
    #stats((
      [Scarab Occult], [5\"], [5], [2+], [3], [7+], [1],
      [Scarab Sorcerer], [5\"], [5], [2+], [4], [6+], [1],
      [Terminator Sorcerer], [5\"], [5], [2+], [5], [6+], [1],
    ))
    #v(2pt)
    #weapons((
      [8x Inferno combi-bolter], [24\"], [2], [3+], [4], [-2], [1], [Rapid Fire 2, Lethal Hits],
      [2x Soulreaper cannon], [24\"], [6], [3+], [6], [-2], [1], [Dev Wounds, Lethal Hits],
      [2x Hellfyre missile rack], [36\"], [2], [3+], [10], [-2], [3], [Lethal Hits],
      [Scarab Malefic Curse], [24\"], [3], [3+], [4], [-3], [1], [Anti-Inf 4+, Dev Wounds, Psychic, Lethal Hits],
      [Terminator Gaze of Hate], [18\"], [3], [3+], [4], [-3], [2], [Anti-Monster/Vehicle 4+, Dev Wounds, Psychic, Lethal Hits],
      [Force weapon], [Melee], [4], [3+], [6], [-1], [D3], [Psychic, Lethal Hits],
      [Prosperine khopesh], [Melee], [3], [3+], [5], [-2], [2], [Lethal Hits],
    ))
    - *4++.* Deep Strike. Rites of Coalescence: while unit contains a Psyker, attacks targeting this unit are -1 to Wound.
    - *Marked by Fate:* start of Shooting, select visible enemy; this unit gets +1 to Hit against it until end of phase.
    - *Umbralefic Crystal:* once per battle in Command phase, if not engaged, remove bearer's unit to Strategic Reserves; return next Movement Reinforcements step more than 9\" away.
  ]

  #v(4pt)

  #card("Tzaangor Enlightened", pts: "55", note: "3 with Fatecaster greatbows.")[
    #stats((
      [Enlightened], [10\"], [4], [5+], [2], [7+], [2],
    ))
    #v(2pt)
    #weapons((
      [Fatecaster greatbow], [30\"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal Hits, Precision],
      [Close combat weapon], [Melee], [2], [4+], [4], [0], [1], [-],
    ))
    - *5++.* Malign Trickery: once per turn, when enemy ends Normal/Advance/Fall Back within 9\", if not engaged, make Normal move up to D6\".
  ]

  #v(4pt)

  #card("2x Tzaangors", pts: "140", note: "Two units of 10, each with Brayhorn and Herd banner.")[
    #stats((
      [Tzaangor], [6\"], [4], [6+], [1], [7+], [1],
    ))
    #v(2pt)
    #weapons((
      [Tzaangor blades], [Melee], [2], [4+], [5], [0], [1], [-],
    ))
    - *6++.* Scouts 6\". Ambushing Hunters: end of opponent's turn, if more than 6\" away from all enemies, remove to Strategic Reserves.
    - *Brayhorn:* re-roll Advance and Charge rolls. *Herd banner:* while on an objective you control, improve Leadership by 1.
  ]

  #v(3pt)

  #card("Common Keywords")[
    #set text(size: 5.8pt)
    *Deep Strike:* >9\" away. *Infiltrators:* deploy >9\" from enemy deployment zone and models. *Stealth:* -1 to be hit by ranged attacks. *Torrent:* auto-hits. *Precision:* allocate successful wounds to visible Character in attached unit. *Sustained Hits X:* Critical Hit scores X extra hits. *Lethal Hits:* Critical Hit auto-wounds. *Devastating Wounds:* Critical Wound gets no saves and inflicts mortals equal to Damage.
  ]
]
