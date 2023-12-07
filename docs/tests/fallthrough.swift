//#Patterns: fallthrough

//#Issue: {"severity": "Info", "line": 10, "patternId": "fallthrough"}



switch myvar {
case 1:
    var a = 1
    fallthrough
case 2:
    var a = 2
}
