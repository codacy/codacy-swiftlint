//#Patterns: unused_enumerated

//#Issue: {"severity": "Warning", "line": 8, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Warning", "line": 10, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "unused_enumerated"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "unused_enumerated"}

for (_, foo) in bar.enumerated() { }

for (_, foo) in abc.bar.enumerated() { }

for (_, foo) in abc.something().enumerated() { }

for (idx, _) in bar.enumerated() { }
