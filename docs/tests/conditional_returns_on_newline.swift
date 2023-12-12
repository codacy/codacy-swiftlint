//#Patterns: conditional_returns_on_newline

//#Issue: {"severity": "Warning", "line": 9, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Warning", "line": 11, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "conditional_returns_on_newline"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "conditional_returns_on_newline"}

    guard true else { return }

    if true { return }

    if true { break } else { return }

    if true { break } else {       return }

    if true { return "YES" } else { return "NO" }
