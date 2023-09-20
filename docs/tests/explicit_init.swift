//#Patterns: explicit_init

//#Issue: {"severity": "Warning", "line": 6, "patternId": "explicit_init"}

func foo() -> [String] {
    return [1].flatMap { String↓.init($0) }
}
