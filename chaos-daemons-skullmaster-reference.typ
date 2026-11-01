// Roster: chaos_daemons_skullmaster_list. Rules sources and audit: rules/chaos-daemons-skullmaster-audit-2026-11-01.md
#set page(paper: "a4", margin: 4mm)
#set text(font: "Arial", size: 7.1pt, hyphenate: true)
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
#let p(owner, name) = text(fill: blue, weight: "bold")[#owner#if name != "" { [ #name] } phase]
#let b(body) = text(fill: blue, weight: "bold", body)
#show "Psychic": b("Psychic")
#show "Psyker": b("Psyker")
#show "GRENADES": r("GRENADES")

#let head(title, note: none, title-fill: teal) = {
  grid(columns: (1fr, auto), gutter: 2pt, align: horizon,
    text(size: 8pt, weight: "bold", fill: title-fill, upper(title)),
  )
  if note != none { text(size: 5.5pt, fill: muted, note) }
  line(length: 100%, stroke: 0.35pt + ink)
}

#let card(title, body, note: none, stroke: teal, title-fill: teal) = {
  rect(width: 100%, stroke: 0.45pt + stroke, inset: 1.8pt, radius: 0.7pt)[
    #head(title, note: note, title-fill: title-fill)
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
  table.header[*Weapon*][*Rng*][*A*][*Hit*][*S*][*AP*][*D*][*Key*],
  ..rows,
)}

// Conditional Hit aura marker lives inside each eligible Hit cell.
#let damaged-hit(skill) = [#skill #r("3+**") #linebreak() #text(size: 5pt, fill: red, weight: "bold", "RR1*")]
#let hit(skill) = [#skill #linebreak() #text(size: 5pt, fill: red, weight: "bold", "RR1*")]
#let received(shadow) = text(size: 5.7pt, fill: purple)[#r("Wreathed 18\"*") | #r("Shadow*:") #text(weight: "bold", shadow)]
#let gap = v(2.8pt)

#grid(columns: (1fr, auto), gutter: 5pt, align: horizon)[
  #text(size: 9pt, weight: "bold")[CHAOS DAEMONS - WARP RIFTS]
  #text(size: 4.6pt, fill: muted)[11TH EDITION | Daemonic Incursion / Warp Rifts | Take and Hold | New Recruit v37.8 | 1 Nov 2026]
]
#line(length: 100%, stroke: 0.8pt + teal)
#v(2pt)

#grid(columns: (1fr, 1fr, 1fr), gutter: 4pt, align: top)[
  #card("Be'lakor", note: "MONSTER | FLY | PSYKER | WARLORD | Stealth")[
    #stats(([Be'lakor], [12"], [11], [3+/4++], [20], [6+], [5]))
    #received("self")
    #v(1pt)
    #weapons((
      [Shades - safe], [18"], [9], [#hit([2+])], [5], [-2 #linebreak() #r("-3*")], [1], [Devs, Ignores Cover, Psychic],
      [Shades - focused], [18"], [12], [#hit([2+])], [6], [-3 #linebreak() #r("-4*")], [1], [Devs, Ignores Cover, Haz, Psychic],
      [Blade - strike], [M], [7], [#damaged-hit([2+])], [14], [-4 #linebreak() #r("-5*")], [D6+1], [Devs],
      [Blade - sweep], [M], [14], [#damaged-hit([2+])], [8], [-3 #linebreak() #r("-4*")], [1], [Sustained 1],
    ))
    - *Dark Master:* #r("Shadow*") area within 6" is your Shadow of Chaos.
    - *Shadow Form:* choose at start of each battle round; lasts that round:
      #linebreak() *Wreathed:* #r("18\"*") friendly Daemon units within 6" can only be shot by models within 18".
      #linebreak() #r("Pall* (enemy aura):") #p("THEIR", "Command") Battle-shock step: enemies within 9" below Starting Strength test (single models: any lost W). Each enemy failed Battle-shock within 9" heals Be'lakor D3.
      #linebreak() *Shadow Lord:* #r("RR1*") friendly Daemon units within 6" re-roll Hit 1s.
    - *Damaged 1-7W:* #r("Hit**") at 1-7W: -1 to Hit. Psychic may ignore; Torrent auto-hits.
  ]
  #gap
  #card("Great Unclean One", note: [MONSTER | PSYKER | Endless Gift: FNP 6+ / #r("5+*")])[
    #stats(([GUO], [7"], [12 #linebreak() #r("13*")], [5+/4++], [20], [6+], [5]))
    #received("self / Be'lakor")
    #v(1pt)
    #weapons((
      [Plague flail], [6"], [D6+1], [#hit([3+ #r("4+**")])], [7], [-2 #linebreak() #r("-3*")], [2], [-],
      [Putrid vomit], [12"], [D6+3], [-], [5], [-2 #linebreak() #r("-3*")], [1], [Ignores Cover, Torrent],
      [Bilesword - strike], [M], [6], [#damaged-hit([2+])], [10], [-2 #linebreak() #r("-3*")], [D6+1], [Lethal],
      [Bilesword - sweep], [M], [12], [#damaged-hit([2+])], [7], [-1 #linebreak() #r("-2*")], [1], [Lethal],
    ))
    - #r("Nurgle auras* 6\":") friendly Nurgle Daemons are in Shadow and have +1 T (self included; T12 / #r("13*") above).
    - *Nurgle's Rot:* end of #p("YOUR", "Movement"), choose enemy within 12": -1 T until start of #p("YOUR NEXT", "Movement").
    - *Endless Gift:* #r("FNP 5+*") replaces native 6+; no extra Shadow bonus.
    - *Damaged 1-7W:* #r("Hit**") at 1-7W: -1 to Hit. Psychic may ignore; Torrent auto-hits.
  ]
  #gap
  #card("Plaguebearers", note: "INFANTRY | BATTLELINE | NURGLE")[
    #stats(([All models], [5"], [5 #linebreak() #r("6*")], [7+/5++], [2], [7+ #linebreak() #r("6+*")], [2]))
    #received("GUO / Be'lakor")
    #v(1pt)
    #weapons(([Plaguesword], [M], [2], [#hit([3+])], [4], [-1 #linebreak() #r("-2*")], [1], [Lethal]))
    - *Infected Outbreak:* end of #p("YOUR", "Command"), objective you control in range becomes sticky until opponent controls it at start/end of any turn.
    - #r("6* in Toughness cell:") GUO +1 T within 6"; T5 / #r("6*") above. Also in Shadow.
    - *Icon equipped:* #r("Ld6+*") while bearer alive (base 7+). *Instrument equipped:* +1 Charge while bearer alive.
  ]
][
  #card("Lord of Change", note: "MONSTER | FLY | PSYKER | TZEENTCH | Everstave")[
    #stats(([Lord of Change], [12"], [10], [6+/4++], [18], [6+], [5]))
    #received("self / Be'lakor")
    #v(1pt)
    #weapons((
      [Rod of sorcery], [18" #linebreak() #r("24*")], [6], [#hit([2+])], [8 #linebreak() #r("11*")], [-1 #linebreak() #r("-2*")], [2], [Psychic],
      [Bolt - safe], [18" #linebreak() #r("24*")], [9], [#hit([2+])], [9 #linebreak() #r("12*")], [-1 #linebreak() #r("-2*")], [1], [Psychic, #r("Sustained Hits D3*")],
      [Bolt - focused], [18" #linebreak() #r("24*")], [9], [#hit([2+])], [9 #linebreak() #r("12*")], [-2 #linebreak() #r("-3*")], [3], [Haz, Psychic, #r("Sustained Hits D3*")],
      [Staff of Tzeentch], [M], [5], [#hit([3+])], [6], [-1 #linebreak() #r("-2*")], [3], [Psychic],
    ))
    - #r("Tzeentch auras* 6\":") friendly Tzeentch Daemons are in Shadow; +1 S to their ranged attacks.
    - #r("* profiles: self aura +1S AND Everstave in Shadow +2S/+6\" range (inches).") Self qualifies for own Shadow aura. Everstave outside Shadow: +1S/+3" instead.
    - *Master of Magicks:* #p("YOUR", "Shooting"): select #r("Sustained Hits D3*") for Bolt only until end of #p("YOUR", "Shooting"). Selected option; alternatives: Ignores Cover / Lethal Hits. Rod unaffected.
    - *Damaged 1-7W:* #r("Hit**") at 1-7W: -1 to Hit. Psychic may ignore; Torrent auto-hits.
  ]
  #gap
  #card("Flamers", note: "INFANTRY | FLY | TZEENTCH")[
    #stats(([All models], [9"], [4], [7+/4++], [3], [7+], [1]))
    #received("LoC / Be'lakor")
    #v(1pt)
    #weapons((
      [Flickering Flames], [12"], [D6], [-], [4 #linebreak() #r("5*")], [-1 #linebreak() #r("-2*")], [1], [Ignores Cover, Psychic, Torrent],
      [Flamer mouths], [M], [3], [#hit([4+])], [4], [0 #linebreak() #r("-1*")], [1], [-],
    ))
    - *Bounding Leaps:* may shoot after Falling Back.
    - #r("5* in Strength cell:") #r("LoC aura*: +1 ranged S within 6\""); flames S4 / #r("5*"). #r("LoC Shadow* within 6\".")
    - *Overwatch:* D6 auto-hits per model, 12" range. Torrent does not roll Hits or trigger Lethal/Sustained.
  ]
  #gap
  #card("Screamers", note: "BEAST | FLY | TZEENTCH")[
    #stats(([Screamer], [14"], [4], [6+/4++], [3], [7+], [1]))
    #received("LoC / Be'lakor")
    #v(1pt)
    #weapons(([Lamprey bite], [M], [3], [#hit([3+])], [6], [-2 #linebreak() #r("-3*")], [2], [Anti-Monster 4+, Anti-Vehicle 4+]))
    - *Slashing Dive:* #p("YOUR", "Movement"), after a Normal move: select one enemy moved over; roll 1D6 per Screamer in unit, each 4+ = 1 mortal wound.
    - No dive after Advance, Fall Back or arrival. No native Devs: Anti 4+ guarantees wounds vs listed targets, not mortals.
    - #r("LoC Shadow* within 6\".") Its Strength aura is ranged only; bites unchanged.
  ]
  #gap
  #card("Shared Rules & Profile Key", stroke: purple, title-fill: purple)[
    - All units: *Deep Strike, Shadow of Chaos*. Monsters: *Deadly Demise D6*. Be'lakor must be Warlord.
    - Attacks per model/weapon. Choose one alternative profile; shoot all equipped ranged weapons.
    - *++* invulnerable; *FNP* ignore lost wound; *Haz* Hazardous; *Devs* Devastating Wounds.
    - #r("RR1*:") Be'lakor within 6", *Shadow Lord* chosen: re-roll Hit 1s, self included. No Hit roll for Torrent.
    - #r("18\"*:") Be'lakor within 6", *Wreathed* chosen: only attackers within 18" can shoot that unit.
    - #r("Choose ONE:") Shadow Lord / Wreathed / Pall are alternative battle-round modes.
    - #r("Shadow*:") listed source within 6"; self qualifies on-board. Territory / Corrupt Realspace also apply. Arriving Monsters cannot use their own arriving aura for closer Deep Strike.
    - #r("AP*") = Draught of Terror: +1 AP in #p("YOUR", "Shooting") / #p("EITHER PLAYER'S", "Fight"). #r("Hit** / A**") = damaged 1-7W. Starred values include named buffs; do not add twice.
  ]
][
  #card("Skarbrand", note: "MONSTER | KHORNE | ADVANCE AND CHARGE")[
    #stats(([Skarbrand], [10"], [11], [3+/4++], [20], [6+], [5]))
    #received("self / Be'lakor")
    #v(1pt)
    #weapons((
      [Bellow of fury], [12"], [2D6], [-], [8], [-1 #linebreak() #r("-2*")], [1], [Ignores Cover, Torrent],
      [Slaughter - strike], [M], [8 #linebreak() #r("9*") #linebreak() #text(size: 5pt, fill: red, weight: "bold", "11**")], [#hit([2+])], [16], [-4 #linebreak() #r("-5*")], [6], [-],
      [Slaughter - sweep], [M], [16 #linebreak() #r("17*") #linebreak() #text(size: 5pt, fill: red, weight: "bold", "19**")], [#hit([2+])], [8], [-2 #linebreak() #r("-3*")], [2], [-],
    ))
    - #r("Khorne auras* 6\":") friendly Khorne Daemons are in Shadow; +1 A to melee weapons (self included: base 8/16 to #r("9* / 17*") above).
    - *Murderlust:* can charge after Advancing, even outside Shadow; no stratagem needed.
    - *Damaged 1-7W:* #r("A**") = +2 A to Slaughter and Carnage: #r("11 strike / 19 sweep") with aura. No damaged Hit penalty.
    - No FLY keyword.
  ]
  #gap
  #card("Skullmaster + Bloodcrushers", note: "MOUNTED | KHORNE | Attached unit")[
    #stats((
      [Skullmaster], [10"], [7], [3+/4++], [6], [7+ #linebreak() #r("6+*")], [2],
      [Bloodcrusher], [10"], [7], [3+/5++], [4], [7+ #linebreak() #r("6+*")], [2],
    ))
    #received("Skarbrand / Be'lakor")
    #v(1pt)
    #weapons((
      [Blade of blood], [M], [5 #linebreak() #r("6*")], [#hit([2+])], [6], [-2 #linebreak() #r("-3*")], [3], [Skullmaster],
      [Hellblade], [M], [2 #linebreak() #r("3*")], [#hit([3+])], [5], [-2 #linebreak() #r("-3*")], [2], [Bloodcrushers],
      [Juggernaut horn], [M], [4 #linebreak() #r("5*")], [#hit([4+])], [6], [-1 #linebreak() #r("-2*")], [1], [Extra Attacks, Lance, #r("Devs*")],
    ))
    - #r("A* / Shadow*:") Skarbrand within 6": +1 A to melee weapons and unit in Shadow; applies to leader and bodyguard.
    - *Icon:* entire unit #r("Ld6+*") while bearer alive (base 7+). *Instrument:* +1 Charge while bearer alive.
    - *Brass Stampede:* after charge, pick enemy in Engagement Range; roll 1D6 per model in this unit (including attached leader): each 4+ causes D3 mortals.
    - *Devastating Charge:* after charge, every enemy unit in Engagement Range takes a Battle-shock test.
    - *Skullmaster's Fury:* while leading, after unit charges, all its horns gain #r("Devs*") until end of #text(fill: blue, weight: "bold")[YOUR turn]. Lance: +1 Wound after charge.
    - Horn profile is shared by both models. Extra Attacks: use alongside blade/hellblade. Retain respective saves; bodyguard T while attached.
  ]
  #gap
  #card("Flesh Hounds", note: "BEAST | KHORNE | FNP 3+ vs Psychic Attacks")[
    #stats(([All models], [12"], [4], [7+/5++], [2], [7+], [1]))
    #received("Skarbrand / Be'lakor")
    #v(1pt)
    #weapons((
      [Burning roar], [12"], [D6], [-], [4], [0 #linebreak() #r("-1*")], [1], [Ignores Cover, Torrent],
      [Gore-drenched fangs], [M], [3 #linebreak() #r("4*")], [#hit([3+])], [5], [-1 #linebreak() #r("-2*")], [1], [-],
    ))
    - *Burning roar:* Gore Hound only. Every model has fangs and Collar of Khorne (FNP above).
    - #r("4* / Shadow*:") Skarbrand within 6": +1 melee A and unit in Shadow. Roar unaffected.
    - *Hunters from the Warp:* end of #text(fill: blue, weight: "bold")[THEIR turn], if unengaged, may place this unit into Strategic Reserves; no CP or Shadow required.
  ]
]

#v(4pt)
#line(length: 100%, stroke: 1.2pt + gold)
#text(size: 7pt, weight: "bold", fill: gold)[ARMY RULES, STRATAGEMS & PHASE REMINDERS]
#v(2pt)
#set text(size: 7.3pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 3pt, align: top)[
  #card("Shadow of Chaos & Warp Rifts")[
    #rule("Shadow areas")[Own deployment zone always. At start of ANY #p("EITHER PLAYER'S", ""), control at least half the objectives in No Man's Land / enemy zone: that area is Shadow until end of the SAME #p("EITHER PLAYER'S", ""). No objectives there = no Shadow this way.]
    #rule("Manifestation")[Friendly Daemons in Shadow: +1 Battle-shock roll; success heals one model D3 W, or returns D3 Plaguebearers instead.]
    #rule("Terror")[Enemy in Shadow and/or within 6" of GUO/LoC/Skarbrand: -1 Battle-shock; failure causes D3 mortals.]
    #rule("Warp Rifts")[Deep Strike #r(">6\" horizontally") from enemies if set up *wholly* in Shadow and/or wholly within 6" of a matching-god Greater Daemon; otherwise >8". These are strict distances.]
  ]
  #gap
  #card("Battlefield Reminders", stroke: purple, title-fill: purple)[
    - Plaguebearer sticky control alone creates no 6" Shadow bubble; *Corrupt Realspace* does.
    - Be'lakor gets no god-specific aura buff. His Shadow Lord re-rolls can affect this entire roster.
    - Keep CP for repositioning, Advance-charge, or AP. Flesh Hounds have a free end-of-#text(fill: blue, weight: "bold")[THEIR-turn] pickup.
  ]
][
  #card("Daemonic Incursion Stratagems", stroke: red, title-fill: red)[
    #rule("CORRUPT REALSPACE - 1CP")[Start of #p("EITHER PLAYER'S", "Command"). Daemon unit on controlled objective: sticky until opponent controls it at start/end of any turn; while yours, area within 6" is Shadow.]
    #rule("WARP SURGE - 1CP")[#p("YOUR", "Charge"): Daemon unit *in Shadow* can charge after Advancing this turn.]
    #rule("DRAUGHT OF TERROR - 1CP")[#p("YOUR", "Shooting") / #p("EITHER PLAYER'S", "Fight"), unselected unit: #r("AP*") values and full Wound re-rolls vs Battle-shocked targets until end of #p("YOUR", "Shooting") / #p("EITHER PLAYER'S", "Fight"), respectively.]
    #rule("DENIZENS OF THE WARP - 1CP")[#p("YOUR", "Movement"): arriving Deep Strike Daemon unit may set up >6" horizontally from enemies anywhere, without Shadow requirement.]
    #rule("THE REALM OF CHAOS - 1CP")[End of #text(fill: blue, weight: "bold")[THEIR turn]: up to 2 Daemon units in Shadow, or 1 elsewhere; all unengaged. Place in Strategic Reserves; #r("MUST ingress") in #p("YOUR NEXT", "Movement"), even turn 1.]
    #rule("DAEMONIC INVULNERABILITY - 1CP")[#p("THEIR", "Shooting"), just after targets selected: one targeted Daemon unit re-rolls invulnerable saves of 1 until end of #p("THEIR", "Shooting").]
  ]
][
  #card("Don't Forget - Phase Triggers", stroke: gold, title-fill: gold)[
    #rule("START OF BATTLE ROUND")[Be'lakor chooses Shadow Form.]
    #rule([START OF #p("EITHER PLAYER'S", "Command")])[Corrupt Realspace window. #p("THEIR", "Command") Battle-shock step: Be'lakor's Pall if selected.]
    #rule([END OF #p("YOUR", "Command")])[Plaguebearers make controlled objective sticky.]
    #rule([#p("YOUR", "Movement")])[Screamers' Normal move flyover mortals. End: GUO picks -1 T target within 12". Arrivals: check Shadow / matching god / Denizens; Realm units must return.]
    #rule([#p("YOUR", "Shooting")])[LoC selects #r("Sustained Hits D3*") for Bolt. Pick safe/focused separately for each Monster weapon; resolve Hazardous when required. Check LoC +1 S and Be'lakor re-roll auras.]
    #rule([#p("YOUR", "Charge") / #p("EITHER PLAYER'S", "Fight")])[Skarbrand Advance-charge is native. Others need Warp Surge after Advance. Draught gives +1 AP. Crushers: charge mortals, enemy Battle-shock tests and horns gain Devs while led.]
    #rule(text(fill: blue, weight: "bold", "THEIR TURN"))[Wreathed shooting limit if chosen. Invulnerability when targets declared. End: Flesh Hounds / Realm of Chaos pickup.]
  ]
]
#v(2pt)
#text(size: 4.5pt, fill: muted)[Profiles: official Chaos Daemons Faction Pack v1.1; condensed reminders, auras checked 1 Nov 2026. Full source links / assumptions: rules/chaos-daemons-skullmaster-audit-2026-11-01.md.]
