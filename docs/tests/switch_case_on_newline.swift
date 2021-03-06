//#Patterns: switch_case_on_newline

//#Issue: {"severity": "Warning", "line": 14, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 29, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 34, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 39, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 44, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 50, "patternId": "switch_case_on_newline"}
//#Issue: {"severity": "Warning", "line": 56, "patternId": "switch_case_on_newline"}

    switch foo {
      case 1: return true
    }


    switch foo {
      case let value: return true
    }


    switch foo {
      default: return true
    }


    switch foo {
      case "a string": return false
    }


    switch foo {
      case .myCase: return false // error from network
    }


    switch foo {
      case let .myCase(value) where value > 10: return false
    }


    switch foo {
      case #selector(aFunction(_:)): return false

    }


    switch foo {
      case let .myCase(value)
     where value > 10: return false
    }


    switch foo {
      case .first,
     .second: return false
    }
