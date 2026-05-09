#set page(paper: "a4", margin: 5mm)
#set text(font: "Arial", size: 6.2pt)
#set par(leading: 0.38em, spacing: 0.28em)

#let ink = rgb("#171717")
#let muted = rgb("#595959")
#let ruleline = rgb("#bdb6aa")
#let soft = rgb("#f3efe6")
#let accent = rgb("#006b78")
#let red = rgb("#8a2634")

#let cellpad = (x: 2pt, y: 1.4pt)
#let r(body) = text(fill: red, weight: "bold", body)

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

#let group(body) = {
  rect(width: 100%, stroke: 1.8pt + accent, inset: 3pt, radius: 0pt)[#body]
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

#let strat(name, cost, kind, when, target, effect, redname: false) = {
  rect(width: 100%, stroke: 0.45pt + ruleline, inset: 3pt)[
    #grid(columns: (1fr, auto), gutter: 4pt)[
      #text(size: 8pt, weight: "bold", fill: if redname { red } else { ink })[#name]
      #text(size: 8pt, weight: "bold")[#cost]
    ]
    #text(size: 5.9pt, fill: muted)[Grand Coven - #kind]
    #v(1pt)
    #text(size: 6.2pt)[*When:* #when]
    #linebreak()
    #text(size: 6.2pt)[*Target:* #target]
    #linebreak()
    #text(size: 6.2pt)[*Effect:* #effect]
  ]
}

#let ritual_table() = table(
  columns: (.55fr, 1.5fr, 4.2fr),
  inset: cellpad,
  stroke: 0.35pt + ruleline,
  fill: (x, y) => if y == 0 { soft },
  table.header[*WC*][*Ritual*][*Effect*],
  [5], [Destiny's Ruin], [Enemy within 24\" visible: TS/Scintillating attacks re-roll Hit 1; on 10+ re-roll Hits.],
  [6], [Temporal Surge], [Friendly TS/Scintillating unit within 24\" visible and not engaged makes a Normal move up to D6\"; on 10+ move up to 6\". Cannot charge this turn.],
  [7], [Doombolt], [Enemy within 24\" visible suffers D3 mortals; on 11+ suffers D3+3. Lone Operative exclusion outside 12\".],
  [9], [Twist of Fate], [Enemy within 24\" visible: TS/Scintillating attacks improve AP by 1; on 12+ improve AP by 2.],
)

#grid(columns: (1fr, 1fr), gutter: 5pt, align: top)[
  #card("Army Rules")[
    #rule("Cabal of Sorcerers")[Start of your Shooting phase, eligible models can attempt Rituals. Roll 2D6; optionally Channel the Warp with +1D6. If you Channel and roll any doubles or triples, that model's unit suffers D3 mortal wounds. Magnus can attempt 2 Rituals per turn and gets +2 to tests.]
    #rule("Pact of Sorcery")[When mustering your army, unless specifically stated otherwise, you cannot select Scintillating Legions as your Army Faction.]
    #rule("Kindred Sorcery, Command phase")[Choose one, once per battle each, until your next Command phase: +6\" range to ranged Psychic weapons; +1 to Wound for Psychic weapons; or Psychic weapons gain Devastating Wounds.]
  ]

  #v(4pt)

  #card("Rituals")[
    #ritual_table()
  ]

  #v(4pt)

  #card("Magnus the Red", pts: "435", note: "Warlord. Deep Strike. Deadly Demise D6.")[
    #stats((
      [Magnus], [14\"], [11], [2+/4++], [16], [5+], [6],
    ))
    #v(2pt)
    #weapons((
      [x1 Gaze of Magnus], [24\"], [3D3], [2+], [11], [-2], [3], [Dev Wounds, Psychic],
      [x1 Tzeentch's Firestorm], [24\"], [D6+3], [2+], [6], [-1], [2], [Blast, Ignores Cover, Psychic],
      [x1 Blade strike], [Melee], [7], [2+], [16], [-3], [3], [Dev Wounds, Psychic],
      [x1 Blade sweep], [Melee], [14], [2+], [8], [-1], [2], [Psychic],
    ))
    - Damaged 1-6W: -1 to Hit for Magnus's attacks.
    - *Unearthly Power:* start of battle round choose Impossible Form (-1 Damage vs non-Psychic attacks), Treason of Tzeentch (enemy ranged weapons within 24\" gain Hazardous for their Shooting phase), or Time Flux aura (+2\" Move for friendly TS within 6\").
  ]
][
  #card("Daemon Prince with Wings", pts: "205", note: "Eldritch Vortex of E'taph applied below. Deep Strike. Deadly Demise D3.")[
    #stats((
      [Prince], [13\"], [9], [2+/4++], [10], [6+], [3],
    ))
    #v(2pt)
    #weapons((
      [x1 Dark Blessing], [24\"], [9], [2+ #r("RR1H chr/RRH psyC")], [5 #r("RR1W chr/RRW psyC")], [-1], [2], [Ignores Cover, Psychic, Sustained Hits 1, #r("EV")],
      [x1 Infernal cannon], [24\"], [3], [2+ #r("RR1H chr/RRH psyC")], [5 #r("RR1W chr/RRW psyC")], [-2], [2], [-],
      [x1 Hellforged strike], [Melee], [6], [2+ #r("RR1H chr/RRH psyC")], [9 #r("RR1W chr/RRW psyC")], [-2], [4], [Dev Wounds, Psychic, #r("EV")],
      [x1 Hellforged sweep], [Melee], [12], [2+ #r("RR1H chr/RRH psyC")], [7 #r("RR1W chr/RRW psyC")], [-1], [2], [Dev Wounds, Psychic, #r("EV")],
    ))
    - *Eldritch Vortex:* +1 Strength and Damage to bearer's Psychic weapons; modified profiles shown.
    - *Aetherstride:* when set up with Deep Strike in Movement phase, can arrive more than 6\" away; Dark Blessing gains Sustained Hits D3; cannot charge.
    - *Hunter of Souls:* into Character units, re-roll Hit 1 and Wound 1; into Psyker Character, re-roll Hits and Wounds. Destroy Character: heal D3, or 3 if Psyker.
  ]

  #v(4pt)

  #group[
    #grid(columns: (1fr, 1fr), gutter: 3pt, align: top)[
      #card("3x Rubric Marines", pts: "300", note: "Bodyguard. Per 5-model unit; each has one attached Sorcerer.")[
        #stats((
          [Rubric Marine], [6\"], [4], [3+/5++], [2], [7+], [2],
          [Aspiring Sorcerer], [6\"], [4], [3+/5++], [3], [6+], [2],
        ))
        #v(2pt)
        #weapons((
          [x3 Warpflamer], [12\"], [D6], [N/A], [4 #r("RR1W/RRW obj")], [-1], [1], [Ignores Cover, Torrent, #r("LH Sor")],
          [x1 Soulreaper cannon], [24\"], [6], [3+], [6 #r("RR1W/RRW obj")], [-2], [1], [Dev Wounds; Icon adds Ignores Cover, #r("LH Sor")],
          [x1 Inferno bolt pistol], [12\"], [1], [3+], [4 #r("RR1W/RRW obj")], [-1], [1], [Pistol, #r("LH Sor")],
          [x1 Malefic Curse], [24\"], [3], [3+], [4 #r("RR1W/RRW obj")], [-3], [1], [Anti-Inf 4+, Dev Wounds, Psychic, #r("LH Sor")],
          [x1 Force weapon], [Melee], [3], [3+], [6], [-1], [D3], [Psychic, #r("LH Sor")],
          [x4 Close combat weapon], [Melee], [2], [3+], [4], [0], [1], [#r("LH Sor")],
        ))
        - *Bringers of Change:* ranged attacks re-roll Wound 1; if target is within range of an objective you do not control, re-roll Wound roll.
      ]
    ][
      #card("3x Sorcerer", pts: "240", note: "Leader. One Sorcerer attached to each Rubric unit.")[
        #stats((
          [Sorcerer], [6\"], [4], [3+/5++], [4], [6+], [1],
        ))
        #v(2pt)
        #weapons((
          [x1 Inferno bolt pistol], [12\"], [1], [3+], [4 #r("RR1W/RRW obj")], [-1], [1], [Pistol, #r("LH Sor")],
          [x1 Pandaemonic Delusion], [24\"], [6 #r("+3A once")], [3+], [5 #r("+3S once RR1W/RRW obj")], [-1], [1], [Psychic, Sustained Hits 3, #r("LH Sor")],
          [x1 Force weapon], [Melee], [4 #r("+3A once")], [3+], [6 #r("+3S once")], [-1], [D3], [Psychic, #r("LH Sor")],
        ))
        - *Empyric Guidance:* while leading, weapons in this Rubric unit have #r("LH Sor").
        - *Twisted Sorceries:* once per battle in Shooting or Fight, Sorcerer's Psychic weapons get +3 Strength and +3 Attacks until end of phase.
      ]
    ]
  ]

  #v(4pt)

  #card("2x Sekhetar Robots", pts: "160", note: "Two identical units of 2 robots. Weapon counts are per 2-model unit.")[
    #stats((
      [Sekhetar Robot], [8\"], [6], [3+/5++], [4], [7+], [1],
    ))
    #v(2pt)
    #weapons((
      [x2 Pyreflux meltagun], [12\"], [1], [4+], [10], [-4], [D6], [Melta 2],
      [x2 Heavy warpflamer], [12\"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [x2 Hellfyre missile rack], [36\"], [2], [4+], [10], [-2], [3], [-],
      [x2 Close combat weapon], [Melee], [3], [4+], [5], [0], [1], [-],
    ))
    - Infiltrators, Stealth. Once per battle round, target this unit with Fire Overwatch or Heroic Intervention for 0CP.
  ]
][
  #group[
    #grid(columns: (1fr, 1fr), gutter: 3pt, align: top)[
      #card("Scarab Occult Terminators", pts: "360", note: "Bodyguard. Led by Terminator Sorcerer.")[
        #stats((
          [Scarab Occult], [5\"], [5], [2+/4++], [3], [7+], [1],
          [Scarab Sorcerer], [5\"], [5], [2+/4++], [4], [6+], [1],
        ))
        #v(2pt)
        #weapons((
          [x9 Inferno combi-bolter], [24\"], [2], [3+ #r("+1H SinT")], [4], [-2], [1], [Rapid Fire 2, #r("LH SinT")],
          [x2 Soulreaper cannon], [24\"], [6], [3+ #r("+1H SinT")], [6], [-2], [1], [Dev Wounds, #r("LH SinT")],
          [x2 Hellfyre missile rack], [36\"], [2], [3+ #r("+1H SinT")], [10], [-2], [3], [#r("LH SinT")],
          [x1 Malefic Curse], [24\"], [3], [3+ #r("+1H SinT")], [4], [-3], [1], [Anti-Inf 4+, Dev Wounds, Psychic, #r("LH SinT")],
          [x1 Force weapon], [Melee], [4], [3+ #r("+1H SinT")], [6], [-1], [D3], [Psychic, #r("LH SinT")],
          [x9 Prosperine khopesh], [Melee], [3], [3+ #r("+1H SinT")], [5], [-2], [2], [#r("LH SinT")],
        ))
        - Deep Strike. *Rites of Coalescence:* while this unit contains a Psyker, attacks targeting this unit are #r("-1W vs incoming").
      ]
    ][
      #card("Sorcerer in Terminator Armour", pts: "105", note: "Leader with Umbralefic Crystal.")[
        #stats((
          [Terminator Sorcerer], [5\"], [5], [2+/4++], [5], [6+], [1],
        ))
        #v(2pt)
        #weapons((
          [x1 Inferno combi-bolter], [24\"], [2], [3+ #r("+1H SinT")], [4], [-2], [1], [Rapid Fire 2, #r("LH SinT")],
          [x1 Gaze of Hate], [18\"], [3], [3+ #r("+1H SinT")], [4], [-3], [2], [Anti-Monster/Vehicle 4+, Dev Wounds, Psychic, #r("LH SinT")],
          [x1 Force weapon], [Melee], [5], [3+ #r("+1H SinT")], [6], [-1], [D3], [Psychic, #r("LH SinT")],
        ))
        - *Marked by Fate (SinT):* start of Shooting, select visible enemy; this led unit gets #r("+1H") against it until end of phase.
        - *Empyric Guidance:* while leading, weapons in this unit have #r("LH SinT"). *Umbralefic Crystal:* once per battle redeploy via Strategic Reserves.
      ]
    ]
  ]

  #v(4pt)

  #card("Tzaangor Enlightened", pts: "55", note: "3 with Fatecaster greatbows.")[
    #stats((
      [Enlightened], [10\"], [4], [5+/5++], [2], [7+], [2],
    ))
    #v(2pt)
    #weapons((
      [x3 Fatecaster greatbow], [30\"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal Hits, Precision],
      [x3 Close combat weapon], [Melee], [2], [4+], [4], [0], [1], [-],
    ))
    - Malign Trickery: once per turn, when enemy ends Normal/Advance/Fall Back within 9\", if not engaged, make Normal move up to D6\".
  ]

  #v(4pt)

  #card("2x Tzaangors", pts: "140", note: "Two units of 10, each with Brayhorn and Herd banner.")[
    #stats((
      [Tzaangor], [6\"], [4], [6+/6++], [1], [7+], [1],
    ))
    #v(2pt)
    #weapons((
      [x10 Tzaangor blades], [Melee], [2], [4+], [5], [0], [1], [-],
    ))
    - Weapon counts are per unit. Scouts 6\". Ambushing Hunters: end of opponent's turn, if more than 6\" away from all enemies, remove to Strategic Reserves.
    - *Brayhorn:* re-roll Advance and Charge rolls. *Herd banner:* while on an objective you control, improve Leadership by 1.
  ]

]

#pagebreak()

#set text(font: "Arial", size: 7pt)

#grid(columns: (1fr), gutter: 6pt, align: top)[
  #card("Cabal of Sorcerers")[
    If your Army Faction is Thousand Sons, at the start of your Shooting phase, models with this ability can attempt Rituals. Choose a model that has not attempted a Ritual this turn and a Ritual no model has attempted this turn, then take a Psychic test.

    #v(2pt)
    *Psychic test:* roll 2D6. You may Channel the Warp by rolling one extra D6. If you Channel and roll any doubles or triples, the model's unit suffers D3 mortal wounds. If the model survives, total the dice; if the result meets or beats the Warp Charge, manifest the Ritual.

    #v(4pt)
    #ritual_table()
  ]

  #card("Kindred Sorcery")[
    In your Command phase, choose one of these abilities to last until the start of your next Command phase. Each can only be selected once per battle.

    #v(3pt)
    #rule("Imbued Manifestation")[Add 6\" to the Range characteristic of ranged Psychic weapons equipped by Thousand Sons models from your army.]
    #rule("Psychic Maelstrom")[Each time a Thousand Sons model from your army attacks with a Psychic weapon, add 1 to the Wound roll.]
    #rule("Wrath of the Immaterium")[Psychic weapons equipped by Thousand Sons models from your army have Devastating Wounds.]
  ]
]

#v(5pt)

#card("Grand Coven Stratagems")[
  #grid(columns: (1fr, 1fr), gutter: 4pt, align: top)[
    #strat(
      "PSYCHIC DOMINION",
      "1CP",
      "Epic Deed Stratagem",
      "Any phase, just after an enemy unit has selected its targets.",
      "One Thousand Sons unit selected as a target by that attacking unit.",
      "Until end of phase, Psychic weapons in the attacking unit gain Hazardous, and your unit has Feel No Pain 4+ against Psychic Attacks.",
    )
  ][
    #strat(
      "DESTINED BY FATE",
      "1CP",
      "Epic Deed Stratagem",
      "Any phase, just after a saving throw is failed for a Thousand Sons Psyker model. Can be used after fast-rolling multiple saves.",
      "That Psyker model.",
      "Change the Damage characteristic of one failed-save attack to 0.",
      redname: true,
    )
  ]
  #v(4pt)
  #grid(columns: (1fr, 1fr), gutter: 4pt, align: top)[
    #strat(
      "EGOTISTICAL POWER",
      "1CP",
      "Strategic Ploy Stratagem",
      "Your Command phase.",
      "One Thousand Sons Psyker unit from your army.",
      "Choose Imbued Manifestation, Psychic Maelstrom or Wrath of the Immaterium. Until your next Command phase, that ability applies to this unit instead of any other Kindred Sorcery ability, even if already selected this battle.",
    )
  ][
    #strat(
      "DESECRATION OF WORLDS",
      "1CP",
      "Epic Deed Stratagem",
      "Your Command phase.",
      "One Thousand Sons Psyker unit within range of an objective marker you control.",
      "That objective remains yours until your opponent's Level of Control over it is greater than yours at the end of a phase.",
    )
  ]

  #v(4pt)

  #grid(columns: (1fr, 1fr), gutter: 4pt, align: top)[
    #strat(
      "ARCANE FOCUS",
      "1CP",
      "Epic Deed Stratagem",
      "Your Shooting phase, just after taking a Psychic test for a Thousand Sons model that Channelled the Warp, before resolving the Ritual.",
      "That Thousand Sons model.",
      "Re-roll all D6 rolled for that Psychic test, including the additional Channel the Warp D6.",
      redname: true,
    )
  ][
    #strat(
      "DEVASTATING SORCERY",
      "2CP",
      "Battle Tactic Stratagem",
      "Your Shooting phase.",
      "One Thousand Sons Psyker unit that has not been selected to shoot this phase.",
      "Until end of phase, add 9\" to the Range characteristic of Psychic weapons in the unit, and Psychic weapon attacks can re-roll Hit rolls and Wound rolls.",
      redname: true,
    )
  ]
]
