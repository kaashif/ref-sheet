// Included after the one-page unit reference. Positions are coaching examples, not measured placements.
#pagebreak()
#set text(size: 8.3pt, hyphenate: false)
#set par(leading: .35em, spacing: .35em)
#set list(indent: 7pt, body-indent: 3pt)
#let teal = rgb("006b78")
#let blue = rgb("0078aa")
#let red = rgb("8a2634")
#let gold = rgb("9a6500")
#let purple = rgb("6b3fa0")
#let heading(body) = block(above: 4pt, below: 2pt)[#text(weight: "bold", fill: teal, body)]
#let panel(title, body) = block(width: 100%, stroke: .6pt + teal, inset: 5pt, radius: 2pt)[
  #heading(title)
  #body
]
#let labels = (
  "K2": "Castellan", "L": "Lancer", "K3": "Crusader",
  "K4": "Paladin", "K5": "Valiant", "Magnus": "Magnus",
  "E": "Spear disc", "Z": "Tzaangor", "SP": "Spawn", "RO": "Robot",
  "R2": "Rubric 2\n+ sorc", "T": "Termies\n+ term sorc", "DP": "DP",
  "R1": "Rubric 1\n+ sorc", "B": "Bow disc\n+ disc sorc",
)
#let badge(x, y, label, color: teal) = context {
  let tag = rect(fill: color, stroke: .7pt + white, radius: 1.5pt, inset: (x: 2.5pt, y: 2pt))[
      #set par(leading: .22em, spacing: 0pt)
      #set align(center)
      #text(size: 7.2pt, fill: white, weight: "bold", labels.at(label))
    ]
  let size = measure(tag)
  let left-pos = calc.max(1pt, calc.min(x * 61mm - size.width / 2, 61mm - size.width - 1pt))
  let top-pos = calc.max(1pt, calc.min(y * 83mm - size.height / 2, 83mm - size.height - 1pt))
  place(top + left, dx: left-pos, dy: top-pos, tag)
}
#let board(n, marks) = box(width: 61mm, height: 83mm, clip: true)[
  #place(top + left)[#box(width: 61mm, height: 83mm, clip: true)[
    #place(top + left, dx: -14.24mm, dy: -41.21mm)[
      #image("assets/deployments/priority-assets-mirror-" + str(n) + ".png", width: 89.55mm, height: 153.47mm, fit: "stretch")
    ]
  ]
  ]
  #for m in marks { badge(m.at(0), m.at(1), m.at(2), color: m.at(3)) }
]

#text(size: 14pt, weight: "bold", fill: teal)[PRIORITY ASSETS MIRROR / BIG KNIGHTS]
#h(1fr) #text(size: 7pt)[17 SEP 2026 • DEPLOYMENT NOTES]
#line(length: 100%, stroke: 1pt + gold)
*Plan: Magnus deploys on the table at the back; the army stages under cover and scores.*
These are suggested staging areas on the three GDM mirror maps, not exact model footprints or guaranteed hiding spots. You are *blue/Defender*; rotate the plan 180° for the other side. Confirm your event uses these layouts.

#panel("MAGNUS: DEPLOY AT THE BACK")[
  *Magnus starts on the battlefield, not in reserve.* Use the rear pocket and check actual line of sight from the Knights' likely firing positions. Being far from the Lancer is not enough if the gunline can see him. Terrain and legal base placement decide the exact position; the maps do not guarantee safety.

  Start the Terminators hidden on the table with Crystal available. Keep room to manoeuvre around Magnus rather than crowding the rear with support units. *All friendly map labels now show initial on-table staging areas.*
]
#v(3pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 6pt)[
  #heading("01 / SWEEPING ENGAGEMENT")
  #board(1, (
    (.08,.12,"K2",red), (.21,.28,"L",red), (.07,.40,"K3",red), (.05,.67,"K4",red), (.07,.91,"K5",red),
    (.86,.80,"R1",teal), (.88,.57,"R2",teal), (.70,.66,"T",purple), (.93,.72,"DP",purple),
    (.71,.88,"B",blue), (.85,.39,"SP",blue), (.86,.11,"E",blue), (.91,.30,"Z",blue), (.85,.49,"RO",blue),
    (.94,.97,"Magnus",purple),
  ))
  - *Stage:* main damage package in the lower blue pocket. Keep upper flank cheap; do not feed it Rubrics piecemeal.
  - *Score:* send a small unit toward the lower-left expansion when the route is safe.
  - *Magnus:* deploy in the rear-right pocket, behind the home ruin if it blocks the relevant sight lines.
][
  #heading("02 / CRUCIBLE OF BATTLE")
  #board(2, (
    (.13,.11,"K2",red), (.31,.23,"L",red), (.09,.32,"K3",red), (.49,.06,"K4",red), (.72,.05,"K5",red),
    (.78,.88,"R1",teal), (.53,.92,"R2",teal), (.64,.77,"T",purple), (.86,.75,"DP",purple),
    (.25,.95,"B",blue), (.66,.69,"SP",blue), (.12,.85,"E",blue), (.92,.64,"Z",blue), (.49,.85,"RO",blue),
    (.94,.97,"Magnus",purple),
  ))
  - *Stage:* use the bottom-right depth; avoid lining up on the diagonal edge.
  - *Score:* expansion first; retain a second small unit for centre if Knights leave it open.
  - *Magnus:* use the back-right corner as the planned deployment pocket. Keep support units out of his way.
][
  #heading("03 / TIPPING POINT")
  #board(3, (
    (.11,.11,"K2",red), (.31,.23,"L",red), (.09,.29,"K3",red), (.52,.07,"K4",red), (.83,.13,"K5",red),
    (.84,.87,"R1",teal), (.43,.93,"R2",teal), (.68,.78,"T",purple), (.92,.73,"DP",purple),
    (.17,.87,"B",blue), (.54,.85,"SP",blue), (.10,.95,"E",blue), (.63,.96,"Z",blue), (.72,.69,"RO",blue),
    (.94,.97,"Magnus",purple),
  ))
  - *Stage:* brick and Prince in the lower-right pocket; mobile scorers cover the lower-left route.
  - *Score:* do not funnel every unit through the middle to chase one Knight.
  - *Magnus:* deploy deep in the rear-right pocket. Do not expose him in the right midfield just because the Lancer is elsewhere.
]
#text(size: 7.2pt)[*Read the maps:* compact labels mark initial staging areas, not model footprints. “+ sorc” shows an attached character; spear disc and bow disc distinguish the two Enlightened units. *Red:* enemy Knights. *Purple:* Magnus, DP and Terminator package.]
#v(3pt)
#grid(columns: (1fr, 1fr), gutter: 7pt)[
  #panel("FIRST TWO TURNS / PLAY THE MISSION")[
    - *Deployment:* hide valuable units from likely Knight firing positions, not only their starting positions. Place Magnus at the rear; do not rely on a single thin infantry screen.
    - *Your T1:* use cheap units for expansion/centre only when they can survive or earn enough VP. Stage Magnus and the brick conservatively; resist spending Crystal without a useful destination.
    - *Sabotage:* action in your Shooting phase, one eligible unit per different non-home objective. Finish at turn end controlling it: 3VP, +2 if in enemy territory. From round two, holding a non-home objective scores 4VP at Command end (turn end in round five). [3]
    - *Your T2:* reassess the gunline before moving Magnus out. Survival first; do not expose him just to force a shot. Commit only with a useful target, supporting damage and a plan for the Knights' reply.
  ]
][
  #panel("KNIGHT TRAPS / CHECK BEFORE PLACING MAGNUS")[
    - *Lancer:* M14\", dangerous melee and free Crushing Impact. Check the actual detachment/enhancements for advance-and-charge and movement bonuses; don't assume a fixed threat circle. [4]
    - *Screens:* Super-heavy Walker can cross non-Titanic models on normal/advance/fall-back moves. A thin line is not a wall. Check legal landing space beyond it. [1]
    - *Your Disc cannot slow a Knight:* Binding Tendrils targets INFANTRY. Use the bows' reactive move for positioning, not as guaranteed escape. [5]
    - *Your Prince:* these big Knight CHARACTER targets give RR1 Hit/Wound, not full re-rolls unless also PSYKER. The Terminator Sorcerer's Anti-Vehicle 4+ / Devs is relevant. [5]
    - *Do not crowd the rear:* leave Magnus a route to reposition without forcing him into an exposed lane.
  ]
]
#v(3pt)
#text(size: 7.1pt)[
  *Listhammer baseline:* #link("https://listhammer.info/list/6bd8ec2f9675900b85")[Nathaniel Bjorge, Lone Star Open, 5-1]: Castellan, Crusader, Errant, Paladin, Valiant; five big Knights, no Armigers/allies, Priority Assets. This verified list has *no Lancer*: the diagrams replace the Errant with a hypothetical Lancer for your matchup, not as a claim about that roster or a points-checked army. [6]

  *Sources (clickable):* #link("https://wahapedia.ru/wh40k11ed/the-rules/core-rules/")[1 Core rules 20/24]; #link("https://wahapedia.ru/wh40k11ed/factions/thousand-sons/Magnus-The-Red")[2 Magnus]; #link("https://gdmissions.app/11th/primary-missions/priority-assets/sabotage")[3 Sabotage]; #link("https://wahapedia.ru/wh40k11ed/factions/imperial-knights/Cerastus-Knight-Lancer")[4 Lancer]; #link("https://wahapedia.ru/wh40k11ed/factions/thousand-sons/")[5 Thousand Sons]; #link("https://listhammer.info/list/6bd8ec2f9675900b85")[6 Listhammer]. Map artwork: #link("https://game-datamissions.com/11th/layouts/priority-assets/priority-assets")[GDM 2026 layouts 1-3], annotated with illustrative staging areas. Tactics are suggestions, not rules or measured charge/visibility guarantees.
]
