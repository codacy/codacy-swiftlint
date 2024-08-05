//#Patterns: explicit_init

//#Issue: {"severity": "Warning", "line": 10, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "explicit_init"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "explicit_init"}

[1].flatMap{String.init($0)}

[String.self].map { Type in Type.init(1) }

func foo() -> [String] {
    return [1].flatMap { String.init($0) }
}

_ = GleanMetrics.Tabs.GroupedTabExtra.init()

_ = Set<KsApi.Category>.init()

Observable.zip(
  obs1,
  obs2,
  resultSelector: { MyType.init($0, $1) }
).asMaybe()
