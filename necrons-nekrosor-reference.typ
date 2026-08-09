#set page(paper: "a4", margin: 5mm)
#set text(font: "Arial", size: 9.5pt)
#set par(leading: 0.4em, spacing: 0.22em)

#let ink = rgb("#151918")
#let muted = rgb("#56605d")
#let linec = rgb("#aeb8b4")
#let soft = rgb("#edf3f0")
#let green = rgb("#087a52")
#let red = rgb("#9b2638")
#let blue = rgb("#1769aa")
#let gold = rgb("#8b681d")
#let destroyer = rgb("#7542a8")
#let wraith = rgb("#007f83")
#let cellpad = (x: 1.5pt, y: 0.9pt)

#let r(body) = text(fill: red, weight: "bold", body)
#let g(body) = text(fill: green, weight: "bold", body)
#let rr(body) = text(size: 5.7pt, fill: blue, weight: "bold", body)

#show "Reanimation Protocols": g("Reanimation Protocols")

#let head(title, tag: none, note: none) = {
  grid(columns: (1fr, auto), gutter: 4pt, align: horizon)[
    #text(size: 11.4pt, weight: "bold", fill: ink, upper(title))
  ][
    #if tag != none { text(size: 9.4pt, weight: "bold", fill: green, upper(tag)) }
  ]
  if note != none { text(size: 8pt, fill: muted, note) }
  line(length: 100%, stroke: 0.45pt + ink)
}

#let card(title, body, tag: none, note: none, outline: linec) = {
  rect(width: 100%, stroke: 0.65pt + outline, inset: 2.4pt, radius: 1pt)[
    #head(title, tag: tag, note: note)
    #v(1.2pt)
    #body
  ]
}

#let rule(name, body) = block(
  stroke: (left: 1.3pt + green),
  inset: (left: 2.5pt),
  width: 100%,
)[*#name:* #body]

#let stats(rows) = {
  set text(size: 8.3pt)
  table(
    columns: (1.9fr, .7fr, .7fr, 1.25fr, .7fr, .7fr, .7fr),
    inset: cellpad,
    stroke: 0.3pt + linec,
    fill: (x, y) => if y == 0 { soft },
    table.header[*Model*][*M*][*T*][*SV*][*W*][*LD*][*OC*],
    ..rows,
  )
}

#let weapons(rows) = {
  set text(size: 8pt)
  table(
    columns: (2.1fr, .82fr, .62fr, 1.15fr, .58fr, .58fr, .78fr, 2.1fr),
    inset: (x: 1.2pt, y: 0.75pt),
    stroke: 0.3pt + linec,
    fill: (x, y) => if y == 0 { soft },
    table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
    ..rows,
  )
}

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

#text(size: 14pt, weight: "bold")[Necrons - Nekrosor Awakened Dynasty]
#h(6pt)
#text(size: 8.2pt, fill: muted)[Take and Hold | 3DP | Warlord: Veil Technomancer]
#v(3pt)

#columns(2, gutter: 4pt)[
  #card("C'tan Shard of the Nightbringer", note: r("Deep Strike. FNP 5+. Deadly Demise D6."))[
    #stats(([Nightbringer], [10\"], [11], [3+/4++], [16], [6+], [4]))
    #v(1.2pt)
    #weapons((
      [Gaze of death], [18\"], [D3], [2+], [12], [-3], [D6+3], [-],
      [Scythe - strike], [Melee], [6], [2+], [14], [-4], [D6+2], [Dev Wounds],
      [Scythe - sweep], [Melee], [14], [2+], [8], [-2], [2], [-],
    ))
    - *Drain Life:* end of the Fight phase, each enemy within 6\" takes D3 mortals on 4+.
    - *Necrodermis:* subtract 1 Damage from allocated attacks.
  ]
  #v(2.5pt)

  #card("C'tan Shard of the Void Dragon", note: r("Deep Strike. FNP 5+. Deadly Demise D6."))[
    #stats(([Void Dragon], [10\"], [11], [3+/4++], [16], [6+], [4]))
    #v(1.2pt)
    #weapons((
      [Spear], [12\"], [D3], [2+], [8], [-3], [D6+2], [Anti-Vehicle 2+],
      [Voltaic storm], [18\"], [D6+3], [2+], [7], [-1], [2], [Blast, Sustained 2],
      [Spear - strike], [Melee], [5], [2+], [12], [-4], [D6+2], [Anti-Vehicle 2+],
      [Spear - sweep], [Melee], [10], [2+], [8], [-1], [2], [-],
      [Tail blades], [Melee], [6], [2+], [6], [-1], [1], [Extra Attacks],
    ))
    - *Matter Absorption:* start of your Shooting phase: Vehicle within 12\" takes D3 mortals on 2+; regain that many wounds.
    - *Necrodermis:* subtract 1 Damage from allocated attacks.
  ]
  #v(2.5pt)

  #card("Nekrosor Ammentar", outline: destroyer, note: text(fill: destroyer, weight: "bold")[DEEP STRIKE. FIGHTS FIRST. 4++. FNP 5+ VS MORTALS/PSYCHIC.])[
    #stats(([Nekrosor], [10\"], [8], [3+/4++], [9], [6+], [3]))
    #v(1.2pt)
    #weapons((
      [Disintegrators], [18\"], [4], [2+], [6], [-2], [1], [Ignore Cover, Pistol, Sustained 2],
      [Unmaker gauntlet], [Melee], [6], [2+], [10], [-3], [3], [Sustained 1],
      [Tail and coils], [Melee], [6], [2+], [6], [-1], [1], [Extra Attacks, Sustained 1],
    ))
    - *Protective Disciples:* Lone Operative while within 3\" of another friendly Destroyer Cult unit.
    - *Murder-madness (6\" aura):* friendly non-Monster/non-Titanic units get Sustained Hits 1 if Destroyer Cult or attacking their closest eligible target.
    - *Prophet:* after he destroys a unit, another Destroyer Cult unit within 9\" re-rolls Wound rolls of 1 until the end of that phase (#rr("RR W1*") in S cells).
    - *Nullstone (6\" aura):* friendly Necrons models get FNP 5+ vs mortals and Psychic Attacks.
  ]
  #v(2.5pt)

  #card("Lokhust Destroyer", outline: destroyer, note: text(fill: destroyer, weight: "bold")[DESTROYER CULT.])[
    #stats(([Lokhust], [8\"], [6], [3+], [3], [7+], [2]))
    #v(1.2pt)
    #weapons((
      [Gauss cannon], [24\"], [3], [3+#linebreak()#rr("RR1 closest")#linebreak()#rr("RR all obj")], [5#linebreak()#rr("RR W1*")], [-2], [2], [Lethal Hits; Sustained 1 in aura],
      [Close combat], [Melee], [2], [3+], [4#linebreak()#rr("RR W1*")], [0], [1], [Sustained 1 in aura],
    ))
    - *Hard-wired:* ranged attacks re-roll Hit 1s into closest eligible enemy; re-roll all Hits if target is in range of an enemy-controlled objective.
  ]
  #v(2.5pt)

  #card("Flayed Ones", note: r("Infiltrators."))[
    #stats(([Flayed One], [5\"], [#text(size: 7pt)[4 / #r("Stealth")]], [4+], [1], [7+], [1]))
    #v(1.2pt)
    #weapons(([Flayer claws], [Melee], [4], [3+], [4#linebreak()#rr("RR W")], [-1], [1], [Sustained 1, Twin-linked]))
    - *Flesh Hunger:* into a Below Half-strength unit (strictly fewer than half), every successful Hit is Critical.
  ]

  #colbreak()

  #card("Skorpekh Lord", outline: destroyer, note: text(fill: destroyer, weight: "bold")[DESTROYER ATTACHMENT - LEADER. FNP 4+.])[
    #stats(([Skorpekh Lord], [8\"], [7], [3+/4++/#r("4+++")], [7], [6+], [2]))
    #v(1.2pt)
    #weapons((
      [Annihilator], [18\"], [2], [#r("2+ (2+)")], [6#linebreak()#rr("RR W1*")], [-1], [1], [Rapid Fire 2; Sustained 1 in aura],
      [Flensing claw], [Melee], [8], [#r("2+ (2+)")#linebreak()#rr("RR1 / all charged")], [6#linebreak()#rr("RR W1*")], [-1], [1], [#r("Lethal Hits"); Sustained 1 in aura],
      [Harvester], [Melee], [4], [#r("2+ (2+)")#linebreak()#rr("RR1 / all charged")], [10#linebreak()#rr("RR W1*")], [-3], [3], [#r("Lethal Hits"); Sustained 1 in aura],
    ))
    #v(1.2pt)
    #rect(width: 100%, fill: rgb("#fff0f2"), stroke: 0.8pt + red, inset: 2pt)[
      #r("ENAEGIC DERMAL BOND: the bearer has Feel No Pain 4+; this does not extend to the Destroyers.")
    ]
    - *United in Destruction:* attached unit's melee weapons gain Lethal Hits.
    - *Crimson Harvest:* after his Charge move, engaged enemy takes D3 mortals on 2-5 or D3+3 on 6.
  ]
  #v(2.5pt)

  #card("Skorpekh Destroyers", outline: destroyer, note: text(fill: destroyer, weight: "bold")[DESTROYER ATTACHMENT - BODYGUARD. LETHAL HITS.])[
    #stats(([Skorpekh], [8\"], [6], [3+], [3], [7+], [2]))
    #v(1.2pt)
    #weapons(([Hyperphase weapons], [Melee], [4], [#r("2+ (3+)")#linebreak()#rr("RR1 / all charged")], [7#linebreak()#rr("RR W1*")], [-2], [2], [#r("Lethal Hits"); Sustained 1 in aura]))
    - *Whirling Onslaught:* melee attacks re-roll Hit 1s; after this unit charged, re-roll the Hit roll instead.
    - *2 Plasmacytes:* each once/battle when selected to fight; melee gains Dev Wounds until the end of the Fight phase.
  ]
  #v(2.5pt)

  #card("Technomancer", outline: wraith, note: text(fill: wraith, weight: "bold")[WRAITH SUPPORT. END OF YOUR MOVEMENT PHASE: HEAL D3.])[
    #stats(([Technomancer], [10\"], [4], [4+/#r("5+++")], [4], [6+], [1]))
    #v(1.2pt)
    #weapons((
      [Staff of light], [18\"], [3], [#r("3+ (4+)")], [5], [-2], [1], [-],
      [Staff of light], [Melee], [2], [#r("3+ (4+)")], [5], [-2], [1], [-],
    ))
    #v(1.2pt)
    #rect(width: 100%, fill: rgb("#eaf4ff"), stroke: 0.9pt + blue, inset: 2pt)[
      #text(fill: blue, weight: "bold")[VEIL OF DARKNESS (WARLORD): once/battle/army, end of opponent's turn if unengaged, place this unit in Strategic Reserves. It gains Deep Strike until your next Shooting phase and must make an ingress move during your next Movement phase, including turn 1. Deep Strike: more than 8\" from enemies.]
    ]
    - *Technomancer:* end of your Movement phase, one friendly Necrons model within 6\" regains D3 wounds (once/model/turn).
  ]
  #v(2.5pt)

  #card("Canoptek Wraiths", outline: wraith, note: text(fill: wraith, weight: "bold")[BODYGUARD.])[
    #stats(([Wraith], [10\"], [6], [3+/4++/#r("5+++")], [4], [8+], [2]))
    #v(1.2pt)
    #weapons((
      [Beamer], [12\"], [1], [#r("3+ (4+)")], [4], [-2], [3], [Sustained 1 vs closest eligible target within Nekrosor 6\"],
      [Vicious claws], [Melee], [4], [#r("3+ (4+)")], [6], [-1], [2], [Sustained 1 vs closest eligible target within Nekrosor 6\"],
    ))
    - *Wraith Form:* after a Normal move, choose one enemy moved over; roll per Wraith, each 4+ inflicts 1 mortal.
  ]
  #v(2.5pt)

  #card("Canoptek Reanimator", note: r("FNP 4+."))[
    #stats(([Reanimator], [8\"], [6], [3+], [6], [7+], [3]))
    #v(1.2pt)
    #weapons((
      [Atomiser beam], [12\"], [3x2], [4+], [6], [-2], [1], [-],
      [Reanimator claws], [Melee], [4], [4+], [5], [0], [1], [-],
    ))
    - *Beam Aura (3\"):* friendly Necrons units heal an additional D3 wounds whenever their Reanimation Protocols activate.
  ]
  #v(2.5pt)

]

#pagebreak()

#text(size: 14pt, weight: "bold")[Necrons Rules and Awakened Dynasty]
#h(6pt)
#text(size: 8.2pt, fill: muted)[Official 2026 sources | Red = applied modifiers and cautions]
#v(3pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  row-gutter: 3pt,
  strat(
    "PROTOCOL OF THE ETERNAL REVENANT", "1CP",
    [Any phase, when your Necrons Infantry Character is destroyed.],
    [That destroyed model; once per model per battle.],
    [End of that phase, return it near where destroyed, outside Engagement Range, at half wounds. #r("It returns as its own one-model unit.")],
    hot: true,
  ),
  strat(
    "PROTOCOL OF THE UNDYING LEGIONS", "1CP",
    [Your opponent's Shooting phase or the Fight phase, after an enemy resolves attacks.],
    [One Necrons unit that lost one or more models to those attacks.],
    [Activate Reanimation Protocols and reanimate D3 wounds, or D3+1 if led by a Necrons Character. Other applicable Reanimation rules apply.],
    hot: true,
  ),
  strat(
    "PROTOCOL OF THE HUNGRY VOID", "1CP",
    [The Fight phase.],
    [One Necrons unit not yet selected to fight.],
    [Until the end of the Fight phase, +1 Strength to melee weapons; if led by a Necrons Character, also improve melee AP by 1 (not cumulative with other AP improvements).],
  ),
  strat(
    "PROTOCOL OF THE SUDDEN STORM", "1CP",
    [Your Movement phase.],
    [One Necrons unit.],
    [Until turn end, its ranged weapons gain Assault. If led by a Necrons Character, re-roll Advance rolls until the end of your Movement phase.],
  ),
  strat(
    "PROTOCOL OF THE CONQUERING TYRANT", "1CP",
    [Your Shooting phase.],
    [One Necrons unit not yet selected to shoot.],
    [Until the end of your Shooting phase, against targets within half range, re-roll Hit rolls of 1; if led by a Necrons Character, re-roll all Hits instead.],
  ),
  strat(
    "PROTOCOL OF THE VENGEFUL STARS", "2CP",
    [Your opponent's Shooting phase, after an enemy destroys a Necrons unit.],
    [One Necrons Character unit that was within 6\" of the destroyed unit.],
    [After the attacker finishes, your unit shoots as if your Shooting phase, only into that enemy and only if eligible.],
  ),
)

#v(4pt)

#columns(2, gutter: 4pt)[
  #card("Army Rule")[
    #rule("Reanimation Protocols")[At the end of your Command phase, each friendly unit with this ability that is on the battlefield activates its Reanimation Protocols. When a unit's protocols activate, that unit heals D3 wounds.]
    #v(2pt)
    #text(fill: red, weight: "bold")[Reanimator aura adds D3. It also applies when Undying Legions activates the protocols.]
  ]
  #v(3pt)

  #card("Aura positioning")[
    - *Nekrosor 3\":* another Destroyer Cult unit switches on his Lone Operative.
    - *Nekrosor 6\":* Destroyer Cult units gain Sustained Hits 1; other eligible Necrons gain it only into their closest eligible target.
    - *Nekrosor 6\":* Nullstone grants FNP 5+ against mortal wounds and Psychic Attacks.
    - *Reanimator 3\":* units heal an additional D3 whenever protocols activate.
    - *Technomancer 6\":* one model heals D3 at the end of your Movement phase.
  ]

  #colbreak()

  #card("Phase reminders")[
    *Before first turn* \
    - Deploy Flayed Ones with Infiltrators. \
    - Pair each Technomancer with one Wraith unit; Lord leads Skorpekhs.

    *Your Command phase* \
    - Trigger Reanimation Protocols; each eligible unit heals D3 wounds. \
    - Track Reanimator 3\" aura before rolling.

    *Your Movement phase* \
    - Technomancers each heal D3 at the end of your Movement phase. \
    - Wraith Form after moving over an enemy. \
    - Use Veil at opponent turn end; the unit must ingress during your next Movement phase and can use Deep Strike more than 8\" from enemies.

    *Your Shooting phase* \
    - Void Dragon Matter Absorption before selecting units to shoot. \
    - Lokhust re-rolls depend on closest target / enemy objective. \
    - Nekrosor pistols already have Sustained Hits 2; do not add Sustained Hits 1.

    *Your Charge phase / the Fight phase* \
    - Skorpekh Lord's Crimson Harvest after his Charge move. \
    - Charged Skorpekhs re-roll all melee Hits; otherwise re-roll 1s. \
    - Nightbringer Drain Life at the end of the Fight phase.
  ]
]

#v(4pt)
#text(size: 7.4pt, fill: muted)[Sources: supplied roster; official Necrons Faction Pack v1.0 (9 June 2026), Core Rules (1 June 2026), and MFM v1.1 (22 July 2026); BSData/wh40k-11e Necrons.json and Warhammer 40,000.json at commit d1a6efc (3 August 2026). Audit: rules/necrons-nekrosor-bsdata-audit-2026-08.md.]
