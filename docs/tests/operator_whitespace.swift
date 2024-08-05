//#Patterns: operator_whitespace

//#Issue: {"severity": "Warning", "line": 10, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "operator_whitespace"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "operator_whitespace"}

func <|(lhs: Int, rhs: Int) -> Int {}

func <|<<A>(lhs: A, rhs: A) -> A {}

func <|  (lhs: Int, rhs: Int) -> Int {}

func <|<  <A>(lhs: A, rhs: A) -> A {}

func  <| (lhs: Int, rhs: Int) -> Int {}

func  <|< <A>(lhs: A, rhs: A) -> A {}
