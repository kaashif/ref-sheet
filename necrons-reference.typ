#set page(paper: "a4", margin: 5mm)
#set text(font: "Arial", size: 9.5pt)
#set par(leading: 0.4em, spacing: 0.22em)

#let ink = rgb("#151918")
#let muted = rgb("#56605d")
#let linec = rgb("#aeb8b4")
#let soft = rgb("#edf3f0")
#let green = rgb("#087a52")
#let bright = rgb("#00a86b")
#let red = rgb("#9b2638")
#let gold = rgb("#8b681d")
#let cellpad = (x: 1.7pt, y: 1.05pt)

#let r(body) = text(fill: red, weight: "bold", body)
#let g(body) = text(fill: green, weight: "bold", body)

#show "Reanimation Protocols": g("Reanimation Protocols")
#show "Support": text(fill: gold, weight: "bold", "Support")

#let head(title, tag: none, note: none) = {
  grid(columns: (1fr, auto), gutter: 4pt, align: horizon)[
    #text(size: 11.4pt, weight: "bold", fill: ink, upper(title))
  ][
    #if tag != none { text(size: 9.4pt, weight: "bold", fill: green, upper(tag)) }
  ]
  if note != none { text(size: 8pt, fill: muted, note) }
  line(length: 100%, stroke: 0.45pt + ink)
}

#let card(title, body, tag: none, note: none) = {
  rect(width: 100%, stroke: 0.55pt + linec, inset: 2.6pt, radius: 1pt)[
    #head(title, tag: tag, note: note)
    #v(1.4pt)
    #body
  ]
}

#let rule(name, body) = block(
  stroke: (left: 1.3pt + green),
  inset: (left: 2.5pt),
  width: 100%,
)[*#name:* #body]

#let stats(rows) = table(
  columns: (2.2fr, .7fr, .7fr, .9fr, .7fr, .7fr, .7fr),
  inset: cellpad,
  stroke: 0.3pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Model*][*M*][*T*][*SV*][*W*][*LD*][*OC*],
  ..rows,
)

#let weapons(rows) = table(
  columns: (2.35fr, .72fr, .66fr, .68fr, .62fr, .62fr, .72fr, 2.35fr),
  inset: cellpad,
  stroke: 0.3pt + linec,
  fill: (x, y) => if y == 0 { soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
  ..rows,
)

#let strat(name, cost, when, target, effect, hot: false) = {
  rect(
    width: 100%,
    stroke: if hot { 0.9pt + red } else { 0.45pt + linec },
    inset: 2.4pt,
  )[
    #grid(columns: (1fr, auto), gutter: 4pt)[
      #text(size: 10pt, weight: "bold", fill: if hot { red } else { ink })[#name]
    ][
      #text(size: 10pt, weight: "bold", fill: if hot { red } else { ink })[#cost]
    ]
    #text(size: 7.6pt, fill: muted)[Awakened Dynasty]
    #linebreak()
    *When:* #when \
    *Target:* #target \
    *Effect:* #effect
  ]
}

#text(size: 14pt, weight: "bold")[Necrons - Triple C'tan Awakened Dynasty]
#h(6pt)
#text(size: 8.6pt, fill: muted)[2000 points (MFM v1.1, 22 July 2026) | Take and Hold | 3DP | 12 units]
#v(3pt)

#columns(2, gutter: 4pt)[
  #card("C'tan Shard of the Deceiver", tag: "330 pts", note: r("Deep Strike. FNP 5+. Stealth. Deadly Demise D6."))[
    #stats(([Deceiver], [8\"], [11], [3+/4++], [16], [6+], [4]))
    #v(1.4pt)
    #weapons((
      [Cosmic insanity], [18\"], [6], [2+], [6], [-2], [2], [Anti-Char 4+, Devs, Precision],
      [Golden fists], [Melee], [8], [2+], [10], [-3], [3], [-],
    ))
    - *Grand Illusion:* after deployment, redeploy up to 3 Necrons units; they may enter Strategic Reserves.
    - *Necrodermis:* subtract 1 Damage from allocated attacks.
  ]
  #v(3pt)

  #card("C'tan Shard of the Nightbringer", tag: "360 pts", note: r("Deep Strike. FNP 5+. Deadly Demise D6."))[
    #stats(([Nightbringer], [10\"], [11], [3+/4++], [16], [6+], [4]))
    #v(1.4pt)
    #weapons((
      [Gaze of death], [18\"], [D3], [2+], [12], [-3], [D6+3], [-],
      [Scythe - strike], [Melee], [6], [2+], [14], [-4], [D6+2], [Dev Wounds],
      [Scythe - sweep], [Melee], [14], [2+], [8], [-2], [2], [-],
    ))
    - *Drain Life:* end of Fight phase, each enemy within 6\" takes D3 mortals on 4+.
    - *Necrodermis:* subtract 1 Damage from allocated attacks.
  ]
  #v(3pt)

  #card("C'tan Shard of the Void Dragon", tag: "345 pts", note: r("Deep Strike. FNP 5+. Deadly Demise D6."))[
    #stats(([Void Dragon], [10\"], [11], [3+/4++], [16], [6+], [4]))
    #v(1.4pt)
    #weapons((
      [Spear], [12\"], [D3], [2+], [8], [-3], [D6+2], [Anti-Vehicle 2+],
      [Voltaic storm], [18\"], [D6+3], [2+], [7], [-1], [2], [Blast, Sustained 2],
      [Spear - strike], [Melee], [5], [2+], [12], [-4], [D6+2], [Anti-Vehicle 2+],
      [Spear - sweep], [Melee], [10], [2+], [8], [-1], [2], [-],
      [Tail blades], [Melee], [6], [2+], [6], [-1], [1], [Extra Attacks],
    ))
    - *Matter Absorption:* start of Shooting: Vehicle within 12\" suffers D3 mortals on 2+; regain that many wounds.
    - *Necrodermis:* subtract 1 Damage from allocated attacks.
  ]
  #v(3pt)

  #card("Imotekh + Orikan + 20 Warriors", tag: "380 pts", note: r("ATTACHED UNIT. * COMMAND PROTOCOLS +1 TO HIT ALREADY APPLIED."))[
    #stats((
      [Imotekh], [5\"], [5], [2+/4++], [6], [6+], [1],
      [Orikan], [5\"], [4], [4+/4++], [4], [6+], [1],
      [Warrior], [5\"], [4], [4+/#r("4++ ORI")], [1], [7+], [2],
    ))
    #v(1.4pt)
    #weapons((
      [Gauntlet of Fire], [12\"], [D6], [N/A], [5], [-1], [1], [Torrent, Ignores Cover],
      [Staff Destroyer], [18\"], [3], [#r("2+*")], [6], [-3], [2], [-],
      [Staff Destroyer], [Melee], [4], [#r("2+*")], [6], [-3], [2], [Dev Wounds],
      [Staff Tomorrow], [Melee], [2], [#r("2+*")], [4], [-3], [D3], [Dev Wounds],
      [Gauss reaper x20], [12\"], [2], [#r("3+*")], [4], [-1], [1], [Lethal Hits],
    ))
    - *Grand Strategist:* start of your Command phase, gain 1CP (July cap: max 1 extra CP/round).
    - *Lord of the Storm:* once/battle, end of Command, each enemy within 12\": D3 mortals on 2-5; D3+3 on 6.
    - *Master Chronomancer:* models in attached unit have 4++.
    - *Stars Are Right:* once/battle, start of Fight: triple Orikan staff A/S and successful wounds are Critical.
    - *Their Number Is Legion:* re-roll the Reanimation Protocols die.
  ]

  #colbreak()

  #card("Technomancer + 6 Wraiths", tag: "320 pts", note: r("ATTACHED UNIT. * COMMAND PROTOCOLS +1 TO HIT ALREADY APPLIED."))[
    #stats((
      [Technomancer], [10\"], [4], [4+/#r("5+++")], [4], [6+], [1],
      [Wraith], [10\"], [6], [3+/4++/#r("5+++")], [4], [8+], [2],
    ))
    #v(1.4pt)
    #weapons((
      [Staff of light], [18\"], [3], [#r("3+*")], [5], [-2], [1], [-],
      [Staff of light], [Melee], [2], [#r("3+*")], [5], [-2], [1], [-],
      [Beamer x6], [12\"], [1], [#r("3+*")], [4], [-2], [3], [-],
      [Vicious claws x6], [Melee], [4], [#r("3+*")], [6], [-1], [2], [-],
    ))
    - *Rites of Reanimation:* every model in the attached unit has #r("Feel No Pain 5+ (5+++)").
    - *Technomancer:* end of Movement, one friendly Necrons model within 6\" regains D3 wounds (once/model/turn).
    - *Casket:* while attached, unit has Stealth.
    - *Wraith Form:* after a Normal move, choose one unit moved over; roll per Wraith, each 4+ inflicts 1 mortal.
  ]
  #v(3pt)

  #card("Canoptek Reanimator", tag: "75 pts", note: r("July +5 pts. FNP 4+."))[
    #stats(([Reanimator], [8\"], [6], [3+], [6], [7+], [3]))
    #v(1.4pt)
    #weapons((
      [Atomiser beam x2], [12\"], [3], [4+], [6], [-2], [1], [-],
      [Reanimator claws], [Melee], [4], [4+], [5], [0], [1], [-],
    ))
    - *Beam Aura (3\"):* each time a friendly Necrons unit's Reanimation Protocols activate, it reanimates +D3 wounds.
  ]
  #v(3pt)

  #card("6 Canoptek Scarab Swarms", tag: "80 pts")[
    #stats(([Scarab], [10\"], [2], [6+], [4], [8+], [0]))
    #v(1.4pt)
    #weapons(([Feeder mandibles], [Melee], [6], [5+], [2], [0], [1], [Lethal Hits]))
    - *Self-destruction:* start of Fight, destroy one engaged Scarab; chosen enemy takes D3 mortals on 2-5, 3 on 6+ (+1 roll vs Vehicle).
    - *Chittering Swarm:* engaged enemies -1 OC (min 1); Scarabs become OC 1 within 6\" of a Cryptek.
  ]
  #v(3pt)

  #card("Flayed Ones x2", tag: "2 x 55 pts", note: r("Two separate 5-model units. Infiltrators. Stealth."))[
    #stats(([Flayed One], [5\"], [4], [4+], [1], [7+], [1]))
    #v(1.4pt)
    #weapons(([Flayer claws], [Melee], [4], [3+], [4], [-1], [1], [Sustained 1, Twin-linked]))
    - *Flesh Hunger:* attacks into a Below Half-strength unit score Critical Hits on every successful Hit.
  ]
  #v(3pt)

  #card("Deployment and scoring")[
    - *Likely attachments:* Imotekh leads Warriors; Orikan supports that unit. Technomancer supports Wraiths.
    - *Infiltrate:* deploy both Flayed Ones more than 9\" from enemy zone/models.
    - *Grand Illusion:* redeploy up to 3 units after both armies deploy.
    - *Secondaries:* Bring It Down 14 pts potential; Assassination 6 Characters; Cull the Horde applies to Warriors before attachments.
  ]
]

#pagebreak()

#text(size: 14pt, weight: "bold")[Necrons Rules and Awakened Dynasty]
#h(6pt)
#text(size: 8.6pt, fill: muted)[Official 2026 sources override Codex fallback text | Red notes are July/edition cautions]
#v(3pt)

#columns(2, gutter: 4pt)[
  #card("Army Rule")[
    #rule("Reanimation Protocols")[End of your Command phase, every eligible unit on the battlefield reanimates D3 wounds. Heal wounded models first; if all survivors are full and the unit is below Starting Strength, return destroyed models one wound at a time. Stop at full strength.]
    #v(2pt)
    #text(fill: red, weight: "bold")[Reanimator aura adds D3. Warriors re-roll the main die. These apply when Undying Legions activates the protocols.]
  ]
  #v(3pt)

  #card("Detachment Rule", tag: "Awakened Dynasty")[
    #rule("Command Protocols")[While a Necrons Character model is leading this unit, add 1 to Hit rolls for attacks made by models in that unit.]
    #v(2pt)
    #text(fill: red, weight: "bold")[Applied to every non-Torrent weapon in both attached-unit cards on page 1. A red asterisk marks the adjusted Hit value: 3+* is base 4+ improved to 3+; 2+* is base 3+ improved to 2+. Imotekh's base 2+ remains 2+, with the +1 available to offset a penalty.]
  ]
  #v(3pt)

  #card("Enhancement in list", tag: "20 pts")[
    #rule("Nether-realm Casket")[Necrons model only. While the bearer is attached to a unit, models in that unit have Stealth.]
  ]
  #v(3pt)

  #strat(
    "PROTOCOL OF THE ETERNAL REVENANT", "1CP",
    [Any phase, when your Necrons Infantry Character is destroyed.],
    [That destroyed model; once per model per battle.],
    [End of phase, return it near where destroyed, outside Engagement Range, at half wounds. #r("July: it returns as its own one-model unit.")],
    hot: true,
  )
  #v(3pt)

  #strat(
    "PROTOCOL OF THE UNDYING LEGIONS", "1CP",
    [Opponent's Shooting or Fight phase, after an enemy resolves attacks.],
    [One Necrons unit that lost one or more models to those attacks.],
    [Activate Reanimation Protocols and reanimate D3 wounds, or D3+1 if led by a Necrons Character. Other applicable Reanimation rules apply.],
    hot: true,
  )
  #v(3pt)

  #strat(
    "PROTOCOL OF THE HUNGRY VOID", "1CP",
    [Fight phase.],
    [One Necrons unit not yet selected to fight.],
    [Until phase end, +1 Strength to melee weapons; if led by a Necrons Character, also improve melee AP by 1 (not cumulative with other AP improvements).],
  )

  #colbreak()

  #strat(
    "PROTOCOL OF THE SUDDEN STORM", "1CP",
    [Your Movement phase.],
    [One Necrons unit.],
    [Until turn end, its ranged weapons gain Assault. If led by a Necrons Character, re-roll Advance rolls until phase end.],
  )
  #v(3pt)

  #strat(
    "PROTOCOL OF THE CONQUERING TYRANT", "1CP",
    [Your Shooting phase.],
    [One Necrons unit not yet selected to shoot.],
    [Against targets within half range, re-roll Hit rolls of 1; if led by a Necrons Character, re-roll all Hits instead.],
  )
  #v(3pt)

  #strat(
    "PROTOCOL OF THE VENGEFUL STARS", "2CP",
    [Opponent's Shooting phase, after an enemy destroys a Necrons unit.],
    [One Necrons Character unit that was within 6\" of the destroyed unit.],
    [After the attacker finishes, your unit shoots as if your Shooting phase, only into that enemy and only if eligible.],
  )
  #v(3pt)

  #card("Phase reminders")[
    *Before first turn* \
    - Resolve Flayed Ones Infiltrators, then Deceiver's Grand Illusion redeploy.

    *Command* \
    - Gain normal CP; Imotekh gains 1 extra (global July cap applies). \
    - Trigger Reanimation Protocols; resolve wounded models before returned models. \
    - Imotekh may use Lord of the Storm once per battle at phase end.

    *Movement* \
    - Technomancer heals D3 at phase end. \
    - Wraith Form after moving over an enemy. \
    - July rule: each unit can make only one Normal Move per phase.

    *Shooting* \
    - Void Dragon Matter Absorption before selecting units to shoot. \
    - Remember Lethal Hits on Warrior gauss reapers.

    *Fight* \
    - Scarab Self-destruction at phase start. \
    - Orikan transformation at phase start, once per battle. \
    - Nightbringer Drain Life at phase end.
  ]
  #v(3pt)

  #card("Durability stack")[
    - *Warrior block:* 4++ from Orikan; Reanimation die re-roll; +D3 reanimated in Reanimator aura.
    - *Wraith block:* 3+/4++, FNP 5+ from Technomancer, Stealth from Casket, plus model healing.
    - *C'tan:* T11, 3+/4++, FNP 5+, -1 Damage, 16W; all independently reanimate in Command.
    - #r("Eternal Revenant is Infantry Character only: it cannot revive a C'tan Monster.")
  ]
  #v(3pt)

  #card("Source confidence")[
    #table(
      columns: (1.2fr, 2.6fr),
      inset: cellpad,
      stroke: 0.3pt + linec,
      [*Official*], [C'tan sheets; MFM points/DP/disposition; June faction updates; July changes.],
      [*Fallback*], [Awakened Dynasty and non-C'tan Codex datasheet text from Wahapedia 10th edition.],
      [*Override*], [Orikan/Technomancer are Support; Reanimator is 75; revived Characters return separately.],
    )
  ]
]
