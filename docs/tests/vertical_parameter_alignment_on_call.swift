//#Patterns: vertical_parameter_alignment_on_call

//#Issue: {"severity": "Warning", "line": 14, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 20, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 29, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 32, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 35, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 38, "patternId": "vertical_parameter_alignment_on_call"}

foo(param1: 1, param2: bar,
                param3: false, param4: true)

foo(param1: 1, param2: bar,
 param3: false, param4: true)

foo(param1: 1, param2: bar,
       param3: false,
       param4: true)

foo(param1: 1,
       param2: { _ in })

foo(param1: 1,
    param2: { _ in
}, param3: 2,
 param4: 0)

foo(param1: 1, param2: { _ in },
       param3: false, param4: true)

myFunc(foo: 0,
        bar: baz == 0)

myFunc(foo: 0, bar:
        baz == 0, baz: true)
