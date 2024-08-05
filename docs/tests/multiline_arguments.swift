//#Patterns: multiline_arguments

//#Issue: {"severity": "Warning", "line": 13, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "multiline_arguments"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "multiline_arguments"}



foo(0,
    param1: 1, param2: true, param3: [3])


foo(0, param1: 1,
    param2: true, param3: [3])


foo(0, param1: 1, param2: true,
    param3: [3])


foo(
    0, param1: 1,
    param2: true, param3: [3]
)
