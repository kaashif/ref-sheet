#set page(paper: "a4", margin: 4mm)
#set text(font: "Arial", size: 6pt)
#set par(leading: 0.26em, spacing: 0.16em)

#let ink = rgb("#171717")
#let muted = rgb("#595959")
#let linec = rgb("#bdb6aa")
#let soft = rgb("#f3efe6")
#let teal = rgb("#006b78")
#let red = rgb("#8a2634")
#let blue = rgb("#0078aa")
#let gold = rgb("#9a6500")
#let cellpad = (x: 1.25pt, y: 0.9pt)

#let head(title, pts: none, note: none) = {
  grid(columns: (1fr, auto), gutter: 2pt, align: horizon,
    text(size: 8pt, weight: "bold", fill: ink, upper(title)),
    if pts != none { text(size: 7pt, weight: "bold", fill: red, pts) },
  )
  if note != none { text(size: 5pt, fill: muted, note) }
  line(length: 100%, stroke: 0.35pt + ink)
}

#let card(title, body, pts: none, note: none, stroke: linec) = {
  rect(width: 100%, stroke: 0.45pt + stroke, inset: 1.8pt, radius: 0.7pt)[
    #head(title, pts: pts, note: note)
    #v(0.8pt)
    #body
  ]
}

#let group(body) = rect(width: 100%, stroke: 1.5pt + blue, inset: 1.2pt, radius: 1pt)[#body]

#let rule(name, body) = block(stroke: (left: 1pt + teal), inset: (left: 1.7pt), width: 100%)[*#name:* #body]

#let stats(rows) = table(
  columns: (2.1fr, .65fr, .6fr, .9fr, .6fr, .65fr, .6fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Model*][*M*][*T*][*Sv*][*W*][*Ld*][*OC*], ..rows,
)

#let weapons(rows) = table(
  columns: (2.2fr, .7fr, .55fr, .62fr, .55fr, .55fr, .62fr, 2.25fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*], ..rows,
)

#let gap = v(2.8pt)

#grid(columns: (1fr, auto), gutter: 5pt, align: horizon)[
  #text(size: 9pt, weight: "bold")[THOUSAND SONS - GRAND COVEN]
  #text(size: 4.4pt, fill: muted)[New Recruit v35.82 | Warlord not specified]
][
  #text(size: 7pt, weight: "bold", fill: red)[2000 PTS]
]
#line(length: 100%, stroke: 0.8pt + teal)
#v(2pt)

#columns(3, gutter: 3pt)[
  #card("Grand Coven Detachment Rule")[
    #rule("Kindred Sorcery - Command")[Choose one until next Command; each once/battle: *Imbued Manifestation* (+6" ranged Psychic range); *Psychic Maelstrom* (+1 to Wound with Psychic); *Wrath of the Immaterium* (Psychic gains Devastating Wounds).]
  ]
  #gap

  #card("Rituals")[
    #table(
      columns: (.52fr, 1.12fr, 4fr), inset: cellpad, stroke: 0.25pt + linec,
      fill: (x, y) => if y == 0 { soft },
      table.header[*WC*][*Ritual*][*Effect*],
      [5/10], [Destiny's Ruin], [Visible enemy within 24": TS/Scintillating attacks re-roll Hit 1; 10+ re-roll Hits.],
      [6/10], [Temporal Surge], [Visible friendly TS/Scintillating within 24", not engaged: Normal move D6"; 10+ move 6". Cannot charge.],
      [7/11], [Doombolt], [Visible enemy within 24" suffers D3 mortals; 11+ D3+3. Lone Operative exclusion outside 12".],
      [9/12], [Twist of Fate], [Visible enemy within 24": TS/Scintillating attacks improve AP by 1; 12+ improve by 2.],
    )
  ]
  #gap

  #card("Magnus the Red", note: "Deep Strike | Deadly Demise D6")[
    #stats(([Magnus], [14"], [11], [2+/4++], [16], [5+], [6]))
    #v(1pt)
    #weapons((
      [Gaze of Magnus], [24"], [3D3], [2+], [11], [-2], [3], [Devs, Psychic],
      [Tzeentch's Firestorm], [24"], [D6+3], [2+], [6], [-1], [2], [Blast, Ignores Cover, Psychic],
      [Blade - strike], [Melee], [7], [2+], [16], [-3], [3], [Devs, Psychic],
      [Blade - sweep], [Melee], [14], [2+], [8], [-1], [2], [Psychic],
    ))
    - *Unearthly Power:* start of battle round choose -1 Damage vs non-Psychic; enemy ranged weapons within 24" gain Hazardous; or +2" Move aura (6").
    - Damaged 1-6W: -1 to Hit.
  ]
  #gap

  #card("Daemon Prince with Wings", note: "Eldritch Vortex applied | Deep Strike | Deadly Demise D3")[
    #stats(([Prince], [13"], [9], [2+/4++], [10], [6+], [3]))
    #v(1pt)
    #weapons((
      [Dark Blessing], [24"], [9], [2+], [*6*], [-1], [*3*], [Ignores Cover, Psychic, Sustained 1],
      [Infernal cannon], [24"], [3], [2+], [5], [-2], [2], [-],
      [Hellforged - strike], [Melee], [6], [2+], [*10*], [-2], [*5*], [Devs, Psychic],
      [Hellforged - sweep], [Melee], [12], [2+], [*8*], [-1], [*3*], [Devs, Psychic],
    ))
    - *Eldritch Vortex:* +1 Strength and Damage to bearer Psychic weapons (bold above).
    - *Aetherstride:* Deep Strike more than 6" away; Dark Blessing gains Sustained Hits D3; cannot charge.
    - *Hunter of Souls:* re-roll Hit/Wound 1 into Characters; full re-rolls into Psyker Characters. Destroy one: heal D3, or 3 if Psyker.
  ]
  #gap

  #card("Chaos Spawn", note: "Feel No Pain 5+")[
    #stats(([Chaos Spawn], [8"], [5], [4+/5++], [4], [7+], [1]))
    #v(1pt)
    #weapons(([2x Hideous mutations], [Melee], [D6+2], [4+], [5], [-1], [2], [-]))
    - *Regenerating Monstrosities:* start of each player's Command phase, one model regains up to 3 lost wounds.
  ]

  #colbreak()

  #group[
    #card("Exalted Sorcerer on Disc", note: "Incandaeum | Leads the Greatbows")[
      #stats(([Exalted Sorcerer], [10"], [4], [3+/4++], [6], [6+], [2]))
      #v(1pt)
      #weapons((
        [Arcane Fire], [18"], [D6], [N/A], [6], [-2], [D3], [Ignores Cover, Psychic, Torrent],
        [Inferno bolt pistol], [12"], [1], [2+], [4], [-1], [1], [Pistol],
        [Force weapon], [Melee], [5], [2+], [6], [-1], [D3], [Psychic],
      ))
      - *Incandaeum:* once/battle, select Doombolt even if another model already attempted it this phase.
      - *Illusions of Tzeentch:* this led unit can only be targeted by ranged attacks from within 18".
      - *Binding Tendrils:* after Arcane Fire hits enemy Infantry, it is ensnared until your next turn: -2" Move and -2 Charge.
    ]
    #v(1.2pt)
    #card("Fatecaster Greatbows", note: "Fly | Led by the Disc Sorcerer")[
      #stats(([Enlightened], [10"], [4], [5+/5++], [2], [7+], [2]))
      #v(1pt)
      #weapons((
        [3x Fatecaster greatbow], [30"], [2], [4+], [5], [-2], [2], [Ignores Cover, Lethal, Precision],
        [3x Close combat weapon], [Melee], [2], [4+], [4], [0], [1], [-],
      ))
      - *Malign Trickery:* opponent Movement, if an enemy ends a move within 8" and this unit is unengaged, make a Normal move up to D6".
    ]
  ]
  #gap

  #card("Sorcerer + Rubric Marines", note: "Use this grouped profile for each Sorcerer/Rubric pairing")[
    #stats((
      [Sorcerer], [6"], [4], [3+/5++], [4], [6+], [1],
      [Rubric Marine], [6"], [4], [3+/5++], [2], [7+], [2],
      [Aspiring Sorcerer], [6"], [4], [3+/5++], [3], [6+], [2],
    ))
    #v(1pt)
    #weapons((
      [4x Inferno boltgun], [24"], [2], [3+], [4], [-1], [1], [Rapid Fire 1, Ignores Cover (Icon)],
      [Warpflame pistol], [12"], [D6], [N/A], [3], [-1], [1], [Pistol, Torrent, Ignores Cover (Icon)],
      [Malefic Curse], [24"], [3], [3+], [4], [-3], [1], [Anti-Inf 4+, Devs, Psychic, Ignores Cover (Icon)],
      [Pandaemonic Delusion], [24"], [6], [3+], [5], [-1], [1], [Psychic, Sustained Hits 3],
      [Sorcerer force weapon], [Melee], [4], [3+], [6], [-1], [D3], [Psychic],
    ))
    - *Empyric Guidance:* while Sorcerer leads, weapons in the unit gain Lethal Hits.
    - *Twisted Sorceries:* once/battle in Shooting/Fight, Sorcerer Psychic weapons get +3 Strength and Attacks for the phase.
    - *Bringers of Change:* Rubric ranged attacks re-roll Wound 1; full Wound re-roll into a target on an objective you do not control. *Icon:* ranged weapons gain Ignores Cover.
  ]
  #gap

  #card("Tzaangor Enlightened - Spears", note: "Fly")[
    #stats(([Enlightened], [10"], [4], [5+/5++], [2], [7+], [2]))
    #v(1pt)
    #weapons(([3x Divining spear], [Melee], [3], [4+], [5], [-1], [2], [Lance, Precision]))
    - *Prophesied Doom:* after charging, select an enemy in Engagement Range; roll for each model in this unit within Engagement Range of it, each 4+ inflicts 1 mortal.
  ]
  #gap

  #card("Tzaangors", note: "Scouts 6\"")[
    #stats(([Tzaangor], [6"], [4], [6+/6++], [1], [7+], [1]))
    #v(1pt)
    #weapons(([10x Tzaangor blades], [Melee], [2], [4+], [5], [0], [1], [-]))
    - *Ambushing Hunters:* end of opponent's turn, if more than 6" from all enemies, remove this unit into Strategic Reserves.
  ]

  #colbreak()

  #card("Terminator Sorcerer + Scarabs", note: "Umbralefic Crystal | Hellfyre missile racks")[
    #stats((
      [Terminator Sorcerer], [5"], [5], [2+/4++], [5], [6+], [1],
      [Scarab Sorcerer], [5"], [5], [2+/4++], [4], [6+], [1],
      [Scarab Occult], [5"], [5], [2+/4++], [3], [6+], [1],
    ))
    #v(1pt)
    #weapons((
      [10x Inferno combi-bolter], [24"], [2], [3+], [4], [-1], [1], [Rapid Fire 2],
      [2x Hellfyre missile rack], [36"], [2], [3+], [10], [-2], [3], [-],
      [Scarab Malefic Curse], [24"], [3], [3+], [4], [-3], [1], [Anti-Inf 4+, Devs, Psychic],
      [Gaze of Hate], [18"], [D6], [3+], [6], [-2], [2], [Devs, Psychic],
      [Prosperine khopesh], [Melee], [3], [3+], [5], [-2], [2], [-],
    ))
    - Deep Strike. *Rites of Coalescence:* while unit contains a Psyker, attacks targeting it are -1 to Wound.
    - *Marked by Fate:* start of Shooting, select visible enemy; this unit gets +1 to Hit against it for the phase.
    - *Umbralefic Crystal:* once/battle in Command, if unengaged, place unit into Strategic Reserves; return next Reinforcements step more than 9" from enemies.
  ]
  #gap

  #card("Sekhetar Robots", note: "Infiltrators | Stealth")[
    #stats(([Sekhetar Robot], [8"], [6], [3+/5++], [4], [7+], [1]))
    #v(1pt)
    #weapons((
      [2x Pyreflux meltagun], [12"], [1], [4+], [10], [-4], [D6], [Melta 2],
      [2x Heavy warpflamer], [12"], [D6], [N/A], [5], [-2], [1], [Ignores Cover, Torrent],
      [2x Hellfyre missile rack], [36"], [2], [4+], [10], [-2], [3], [-],
      [2x Close combat weapon], [Melee], [3], [4+], [5], [0], [1], [-],
    ))
    - *Prophetic Sentinels:* once/turn, when targeted with Fire Overwatch/Heroic Intervention, that use costs 1CP less.
  ]
  #gap

  #card("Grand Coven Stratagems", stroke: red)[
    #rule("DESTINED BY FATE - 1CP, any phase")[After a save fails for a TS Psyker model, change that attack's Damage to 0.]
    #rule("ARCANE FOCUS - 1CP, Shooting")[After a Channelled Psychic test, re-roll every D6 in that test.]
    #rule("DEVASTATING SORCERY - 2CP, Shooting")[One TS Psyker unit not yet selected to shoot: Psychic weapons get +9" range and full Hit/Wound re-rolls for the phase.]
    #rule("PSYCHIC DOMINION - 1CP, any phase")[After enemy selects targets: its Psychic weapons gain Hazardous; targeted TS unit gets FNP 4+ vs Psychic Attacks.]
    #rule("EGOTISTICAL POWER - 1CP, Command")[One TS Psyker unit gets a selected Kindred Sorcery ability instead of the army-wide ability until next Command.]
    #rule("DESECRATION OF WORLDS - 1CP, Command")[One TS Psyker unit on an objective you control makes it sticky.]
  ]
  #gap

  #card("Don't Forget - Phase Triggers", stroke: gold)[
    #rule("START OF BATTLE ROUND")[*Magnus:* choose one Unearthly Power ability.]
    #rule("YOUR COMMAND PHASE")[Choose *Kindred Sorcery*. *Umbralefic Crystal:* once/battle, if unengaged, put the Terminator unit into Strategic Reserves.]
    #rule("EACH PLAYER'S COMMAND PHASE")[*Chaos Spawn:* one model regains up to 3 lost wounds.]
    #rule("START OF YOUR SHOOTING PHASE")[Attempt Rituals. *Marked by Fate:* select one visible enemy for the Terminator unit's +1 to Hit.]
    #rule("AFTER THE DISC SORCERER SHOOTS")[If Arcane Fire hit enemy Infantry, apply *Binding Tendrils:* -2" Move and -2 Charge until your next turn.]
    #rule("OPPONENT'S MOVEMENT PHASE")[*Greatbows:* after an enemy ends a move within 8", if unengaged, make a Normal move up to D6".]
    #rule("AFTER THE SPEARS CHARGE")[Roll one D6 per engaged model; each 4+ inflicts 1 mortal wound.]
    #rule("END OF OPPONENT'S TURN")[*Tzaangors:* if more than 6" from every enemy, you may put the unit into Strategic Reserves.]
  ]
]
