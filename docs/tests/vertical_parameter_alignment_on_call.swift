//#Patterns: vertical_parameter_alignment_on_call

//#Issue: {"severity": "Warning", "line": 12, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "vertical_parameter_alignment_on_call"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "vertical_parameter_alignment_on_call"}

    foo(param1: 1, param2: bar
                    param3: false, param4: true)

    foo(param1: 1, param2: bar
     param3: false, param4: true)

    foo(param1: 1, param2: bar
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
