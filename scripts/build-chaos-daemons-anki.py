# /// script
# requires-python = ">=3.11"
# dependencies = ["genanki==0.13.1"]
# ///
"""Build the reviewed Chaos Daemons question bank into an importable Anki deck.

Run: uv run scripts/build-chaos-daemons-anki.py
"""
import csv
import html
import json
import re
from collections import Counter
from pathlib import Path

import genanki

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'output' / 'anki'
BANK = ROOT / 'anki' / 'chaos-daemons-skullmaster.json'
FACTION = 'https://assets.warhammer-community.com/eng_22-07_warhammer_40%2C000_faction_pack_chaos_daemons-lycqqrymwe-qogh4b5yly.pdf'
CORE = 'https://assets.warhammer-community.com/eng_01-06_warhammer40k_new40k_core_rules-was6fbu1ix-hfewhmxyiy.pdf'
NAME = 'Chaos Daemons - Skullmaster Roster'
MODEL = genanki.Model(
    1769801821,
    'Chaos Daemons Rules Q&A v1',
    fields=[{'name': name} for name in ['Question', 'Answer', 'Source']],
    templates=[{
        'name': 'Recall',
        'qfmt': '<div class="label">CHAOS DAEMONS · RULES RECALL</div><div class="question">{{Question}}</div>',
        'afmt': '{{FrontSide}}<hr id="answer"><div class="answer">{{Answer}}</div><div class="source">{{Source}}</div>',
    }],
    css='''
.card { font-family: Arial, sans-serif; font-size: 21px; text-align: left;
        line-height: 1.5; max-width: 760px; margin: 30px auto; padding: 16px; }
.label { color: #16808c; font-size: 12px; letter-spacing: .08em; margin-bottom: 14px; }
.question { font-weight: bold; }
.answer { margin-top: 20px; }
.source { font-size: 12px; opacity: .7; margin-top: 28px; }
a { color: #16808c; }
hr { border: 0; border-top: 1px solid #999; margin: 22px 0; }
''',
)


def tag(value):
    return re.sub(r'[^a-z0-9]+', '_', value.lower()).strip('_')


def build():
    rows = json.loads(BANK.read_text())
    ids = [row['id'] for row in rows]
    assert len(set(ids)) == len(ids), 'Duplicate stable IDs'
    assert len({row['question'] for row in rows}) == len(rows), 'Duplicate questions'
    assert all(row[key].strip() for row in rows for key in ['id', 'section', 'question', 'answer'])
    sections = ['Army', 'Detachment', 'Stratagems', 'Enhancements', 'Units', 'Core abilities', 'Unit checklists', 'Saves']
    assert set(row['section'] for row in rows) == set(sections)
    decks = {section: genanki.Deck(1969801821 + n, f'{NAME}::{section}') for n, section in enumerate(sections)}
    OUT.mkdir(parents=True, exist_ok=True)
    with (OUT / 'chaos-daemons-skullmaster.tsv').open('w', newline='') as stream:
        stream.write('#separator:tab\n#html:true\n#tags column:4\n')
        writer = csv.writer(stream, delimiter='\t')
        for row in rows:
            subject_tags = ['unit::' + tag(s) for s in row['subject'].split(' / ')]
            tags = ['chaos_daemons', 'edition::11', 'roster::skullmaster', 'category::' + tag(row['section']), *subject_tags]
            # Both sources are available on every card because many answers combine
            # a datasheet fact with its current core-rule interpretation.
            primary = 'Core Rules' if row['source'] == 'core' else 'Chaos Daemons Faction Pack v1.1'
            source = (f'{html.escape(row["ability"])} · Primary: {primary} · Checked 1 Nov 2026'
                      f'<br><a href="{FACTION}">Faction Pack v1.1</a> · <a href="{CORE}">11th-edition Core Rules</a>')
            fields = [html.escape(row['question']), html.escape(row['answer']), source]
            note = genanki.Note(model=MODEL, fields=fields, tags=tags,
                                guid=genanki.guid_for('kaashif/ref-sheet/chaos-daemons/v1', row['id']))
            decks[row['section']].add_note(note)
            writer.writerow([*fields, ' '.join(tags)])
    genanki.Package(list(decks.values())).write_to_file(str(OUT / 'chaos-daemons-skullmaster.apkg'))
    print(f'Built {len(rows)} cards across {len(decks)} subdecks')
    for section, count in Counter(row['section'] for row in rows).items():
        print(f'  {section}: {count}')


if __name__ == '__main__':
    build()
