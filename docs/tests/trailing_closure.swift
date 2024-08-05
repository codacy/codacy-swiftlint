//#Patterns: trailing_closure

//#Issue: {"severity": "Warning", "line": 10, "patternId": "trailing_closure"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "trailing_closure"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "trailing_closure"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "trailing_closure"}



foo.map({ $0 + 1 })



foo.reduce(0, combine: { $0 + 1 })



offsets.sorted(by: { $0.offset < $1.offset })



foo.something(0, { $0 + 1 })
