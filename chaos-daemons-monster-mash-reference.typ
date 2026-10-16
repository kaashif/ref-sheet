// Roster: monster_mash_list. Rules sources and audit: rules/monster-mash-audit-2026-10-16.md
#set page(paper: "a4", margin: 4mm)
#set text(font: "Arial", size: 8pt, hyphenate: true)
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

#let stats(rows) = {
set text(size: 7pt)
table(
  columns: (2.1fr, .65fr, .6fr, .9fr, .6fr, .65fr, .6fr),
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { teal-soft },
  table.header[*Model*][*M*][*T*][*Sv*][*W*][*Ld*][*OC*], ..rows,
)}

#let weapons(rows, widths: (2fr, .7fr, .9fr, .62fr, .55fr, .55fr, .9fr, 2.1fr)) = {
set text(size: 7pt)
table(
  columns: widths,
  inset: cellpad, stroke: 0.25pt + linec,
  fill: (x, y) => if y == 0 { blue-soft },
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*], ..rows,
)}

#let gap = v(2.8pt)

#grid(columns: (1fr, auto), gutter: 5pt, align: horizon)[
  #text(size: 9pt, weight: "bold")[MONSTER MASH - CHAOS DAEMONS]
  #text(size: 4.6pt, fill: muted)[11TH EDITION | Daemonic Incursion 3DP | Take and Hold | New Recruit v36.49 / Data v2 | 16 Oct 2026]
][#text(size: 7pt, weight: "bold", fill: red)[1990 / 2000 PTS]]
#line(length: 100%, stroke: 0.8pt + teal)
#v(2pt)

#grid(columns: (1fr, 1fr, 1fr), gutter: 4pt, align: top)[
  #card("Be'lakor", pts: "390", note: "MONSTER | FLY | PSYKER | WARLORD | Stealth")[
    #stats(([Be'lakor], [12"], [11], [3+/4++], [20], [6+], [5]))
    #v(1pt)
    #weapons((
      [Shades - safe], [18"], [9], [2+], [5], [-2], [1], [Devs, IC, Psychic],
      [Shades - focused], [18"], [12], [2+], [6], [-3], [1], [Devs, IC, Haz, Psychic],
      [Blade - strike], [M], [7], [2+], [14], [-4], [D6+1], [Devs],
      [Blade - sweep], [M], [14], [2+], [8], [-3], [1], [Sustained 1],
    ))
    - *Dark Master:* area within 6" is your Shadow of Chaos.
    - *Shadow Form:* choose at start of each battle round; lasts that round:
      #linebreak() *Wreathed:* friendly Daemon units within 6" can only be shot by models within 18".
      #linebreak() *Pall:* opponent's Battle-shock step: enemies within 9" below Starting Strength test (single models: any lost W). Each enemy failed Battle-shock within 9" heals Be'lakor D3.
      #linebreak() *Shadow Lord:* friendly Daemon units within 6" re-roll Hit 1s.
    - *Damaged 1-7W:* -1 to Hit.
  ]
  #gap
  #card("Great Unclean One", pts: "295", note: [MONSTER | PSYKER | Endless Gift: #r("FNP 5+")])[
    #stats(([GUO], [7"], [#r("13")], [5+/4++], [20], [6+], [5]))
    #v(1pt)
    #weapons((
      [Plague flail], [6"], [D6+1], [3+], [7], [-2], [2], [-],
      [Putrid vomit], [12"], [D6+3], [-], [5], [-2], [1], [IC, Torrent],
      [Bilesword - strike], [M], [6], [2+], [10], [-2], [D6+1], [Lethal],
      [Bilesword - sweep], [M], [12], [2+], [7], [-1], [1], [Lethal],
    ))
    - *Nurgle auras 6":* friendly Nurgle Daemons are in Shadow and have +1 T (self included; T13 above).
    - *Nurgle's Rot:* end of MY Movement, choose enemy within 12": -1 T until start of MY next Movement.
    - *Endless Gift:* FNP 5+ replaces native 6+; no extra Shadow bonus.
    - *Damaged 1-7W:* -1 to Hit.
  ]
  #gap
  #card("10 Plaguebearers", pts: "115", note: "INFANTRY | BATTLELINE | NURGLE")[
    #stats(([All models], [5"], [5], [7+/5++], [2], [7+], [2]))
    #v(1pt)
    #weapons(([10x Plaguesword], [M], [2], [3+], [4], [-1], [1], [Lethal]))
    - *Infected Outbreak:* end of MY Command, objective you control in range becomes sticky until opponent controls it at start/end of any turn.
    - Within 6" of GUO: #r("T6") and in Shadow.
    - Icon/instrument absent from export: not applied. If equipped: Icon Ld6+; Instrument +1 Charge.
  ]
][
  #card("Kairos Fateweaver", pts: "305", note: "MONSTER | FLY | PSYKER | TZEENTCH")[
    #stats(([Kairos], [12"], [10], [6+/4++], [20], [6+], [5]))
    #v(1pt)
    #weapons((
      [Gateway - safe], [24"], [D6+3], [2+], [9], [-2], [D3], [Blast, Indirect, Psychic],
      [Gateway - focused], [24"], [D3+6], [2+], [9], [-2], [3], [Blast, Indirect, Haz, Psychic],
      [Staff of Tomorrow], [M], [5], [3+], [8], [-2], [2D3], [Psychic],
    ))
    - *Tzeentch aura 6":* friendly Tzeentch Daemons are in Shadow (self included).
    - *One Head Looks Forward:* end of MY Command, if on battlefield: Leadership test; pass = +1CP. This is not a Battle-shock test.
    - #r("One Head Looks Back:") once/turn, opponent targets their unit within 12" of Kairos with a stratagem: may increase that use's cost by 1CP.
    - Within 6" of Lord of Change: Gateway #r("S10").
    - *Damaged 1-7W:* -1 to Hit.
  ]
  #gap
  #card("Lord of Change", pts: "345", note: "MONSTER | FLY | PSYKER | TZEENTCH | Everstave")[
    #stats(([Lord of Change], [12"], [10], [6+/4++], [18], [6+], [5]))
    #v(1pt)
    #weapons((
      [Rod of sorcery], [#r("24\"")], [6], [2+], [#r("11")], [-1], [2], [Psychic],
      [Bolt - safe], [#r("24\"")], [9], [2+], [#r("12")], [-1], [1], [Psychic],
      [Bolt - focused], [#r("24\"")], [9], [2+], [#r("12")], [-2], [3], [Haz, Psychic],
      [Staff of Tzeentch], [M], [5], [3+], [6], [-1], [3], [Psychic],
    ))
    - *Tzeentch auras 6":* friendly Tzeentch Daemons are in Shadow; +1 S to their ranged attacks.
    - #r("Red profiles include self aura +1S AND Everstave in Shadow +2S/+6\" range.") Self qualifies for own Shadow aura. Everstave outside Shadow: +1S/+3" instead.
    - *Master of Magicks:* in MY Shooting choose *Ignores Cover*, *Lethal Hits* or *Sustained D3* for Bolt only, that phase. Rod unaffected.
    - *Damaged 1-7W:* -1 to Hit.
  ]
  #gap
  #card("Shared Rules & Profile Key", stroke: purple, title-fill: purple)[
    - *Every unit:* Deep Strike, Shadow of Chaos.
    - *All five Monsters:* Deadly Demise D6.
    - Attacks are *per model/weapon*. Choose one safe/focused or strike/sweep profile; shoot all equipped ranged weapons.
    - *++* invulnerable save; *FNP* ignore lost wound on listed roll; *IC* Ignores Cover; *Haz* Hazardous; *Devs* Devastating Wounds.
    - Red = applied self-buff. Nearby-unit bonuses are conditional; check ranges when resolving attacks.
  ]
][
  #card("Skarbrand", pts: "330", note: "MONSTER | KHORNE | ADVANCE AND CHARGE")[
    #stats(([Skarbrand], [10"], [11], [3+/4++], [20], [6+], [5]))
    #v(1pt)
    #weapons((
      [Bellow of fury], [12"], [2D6], [-], [8], [-1], [1], [IC, Torrent],
      [Slaughter - strike], [M], [#r("9")], [2+], [16], [-4], [6], [-],
      [Slaughter - sweep], [M], [#r("17")], [2+], [8], [-2], [2], [-],
    ))
    - *Khorne auras 6":* friendly Khorne Daemons are in Shadow; +1 A to melee weapons (self included above).
    - *Murderlust:* can charge after Advancing, even outside Shadow; no stratagem needed.
    - *Damaged 1-7W:* +2 A to Slaughter and Carnage: #r("11 strike / 19 sweep") with aura. No damaged Hit penalty.
    - No FLY keyword.
  ]
  #gap
  #card("Flamers - 2 units of 3", pts: "65 each", note: "INFANTRY | FLY | TZEENTCH")[
    #stats(([All models], [9"], [4], [7+/4++], [3], [7+], [1]))
    #v(1pt)
    #weapons((
      [3x Flickering Flames], [12"], [D6], [-], [4], [-1], [1], [IC, Psychic, Torrent],
      [3x Flamer mouths], [M], [3], [4+], [4], [0], [1], [-],
    ))
    - *Bounding Leaps:* may shoot after Falling Back.
    - Within 6" of Lord of Change: flames #r("S5") and in Shadow. Kairos also supplies Shadow within 6".
    - *Overwatch:* 3D6 auto-hits per squad, 12" range. Torrent does not roll Hits or trigger Lethal/Sustained.
  ]
  #gap
  #card("3 Screamers", pts: "80", note: "BEAST | FLY | TZEENTCH")[
    #stats(([Screamer], [14"], [4], [6+/4++], [3], [7+], [1]))
    #v(1pt)
    #weapons(([3x Lamprey bite], [M], [3], [3+], [6], [-2], [2], [Anti-Monster 4+, Anti-Vehicle 4+]))
    - *Slashing Dive:* MY Movement, after a Normal move: select one enemy moved over; roll 1D6 per Screamer in unit, each 4+ = 1 mortal wound.
    - No dive after Advance, Fall Back or arrival. No native Devs: Anti 4+ guarantees wounds vs listed targets, not mortals.
    - Within 6" of Kairos/LoC: in Shadow. LoC's +1 S is ranged only, so does not buff bites.
  ]
  #gap
  #card("Aura & Arrival Reminders", stroke: purple, title-fill: purple)[
    - Be'lakor's 6" Shadow area works for every god; Greater Daemon Shadow auras require matching god.
    - LoC, Kairos, GUO and Skarbrand are themselves in Shadow via their own god auras.
    - An arriving Monster cannot use its own aura to give itself a closer Deep Strike. Check the qualifying Shadow/other model *before* setting it up.
  ]
]

#v(4pt)
#line(length: 100%, stroke: 1.2pt + gold)
#text(size: 7pt, weight: "bold", fill: gold)[ARMY RULES, STRATAGEMS & PHASE REMINDERS]
#v(2pt)
#set text(size: 7.3pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 3pt, align: top)[
  #card("Shadow of Chaos & Warp Rifts")[
    #rule("Shadow areas")[Own deployment zone always. Start of *any phase*: control at least half the objectives in No Man's Land / enemy zone = that whole area is Shadow for the phase. No objectives there = no Shadow this way.]
    #rule("Manifestation")[Friendly Daemons in Shadow: +1 Battle-shock roll; success heals one model D3 W, or returns D3 Plaguebearers instead.]
    #rule("Terror")[Enemy in Shadow and/or within 6" of GUO/Kairos/LoC/Skarbrand: -1 Battle-shock; failure causes D3 mortals.]
    #rule("Warp Rifts")[Deep Strike #r(">6\" horizontally") from enemies if set up *wholly* in Shadow and/or wholly within 6" of a matching-god Greater Daemon; otherwise >8". These are strict distances.]
  ]
  #gap
  #card("Battlefield Reminders", stroke: purple, title-fill: purple)[
    - Plaguebearer sticky control alone creates no 6" Shadow bubble; *Corrupt Realspace* does.
    - Be'lakor gets no god-specific aura buff. His Shadow Lord re-rolls can affect this entire roster.
    - Keep CP for repositioning, Advance-charge, or AP; Kairos's bonus CP test is end of MY Command.
  ]
][
  #card("Daemonic Incursion Stratagems", stroke: red, title-fill: red)[
    #rule("CORRUPT REALSPACE - 1CP")[Start of *either Command*. Daemon unit on controlled objective: sticky until opponent controls it at start/end of any turn; while yours, area within 6" is Shadow.]
    #rule("WARP SURGE - 1CP")[MY Charge: Daemon unit *in Shadow* can charge after Advancing this turn.]
    #rule("DRAUGHT OF TERROR - 1CP")[MY Shooting / either Fight, before selecting unit to shoot/fight: improve AP by 1 this phase; full Wound re-rolls against Battle-shocked targets.]
    #rule("DENIZENS OF THE WARP - 1CP")[MY Movement: arriving Deep Strike Daemon unit may set up >6" horizontally from enemies anywhere, without Shadow requirement.]
    #rule("THE REALM OF CHAOS - 1CP")[End of opponent turn: up to 2 Daemon units in Shadow, or 1 elsewhere; all unengaged. Place in Strategic Reserves; #r("MUST ingress in MY next Movement, even turn 1").]
    #rule("DAEMONIC INVULNERABILITY - 1CP")[Opponent Shooting, just after targets selected: one targeted Daemon unit re-rolls invulnerable saves of 1 until phase end.]
  ]
][
  #card("Don't Forget - Phase Triggers", stroke: gold, title-fill: gold)[
    #rule("START OF BATTLE ROUND")[Be'lakor chooses Shadow Form.]
    #rule("START OF EITHER COMMAND")[Corrupt Realspace window. Opponent Battle-shock step: Be'lakor's Pall if selected.]
    #rule("END OF MY COMMAND")[Kairos Ld test for CP; Plaguebearers make controlled objective sticky.]
    #rule("MY MOVEMENT")[Screamers' Normal move flyover mortals. End: GUO picks -1 T target within 12". Arrivals: check Shadow / matching god / Denizens; Realm units must return.]
    #rule("MY SHOOTING")[LoC picks Bolt ability. Pick safe/focused separately for each Monster weapon; resolve Hazardous when required. Check LoC +1 S and Be'lakor re-roll auras.]
    #rule("MY CHARGE / EITHER FIGHT")[Skarbrand Advance-charge is native. Others need Warp Surge after Advance. Draught gives +1 AP.]
    #rule("OPPONENT'S TURN")[Kairos tax once/turn within 12"; Wreathed shooting limit if chosen. Invulnerability when targets declared. End: Realm of Chaos pickup.]
  ]
]
#v(2pt)
#text(size: 4.5pt, fill: muted)[Profiles: official Chaos Daemons Faction Pack v1.1; condensed reminders, checked 16 Oct 2026. Points retained from supplied roster. Full source links / assumptions: rules/monster-mash-audit-2026-10-16.md.]
