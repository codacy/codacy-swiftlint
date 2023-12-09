//#Patterns: strict_fileprivate

//#Issue: {"severity": "Warning", "line": 13, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "strict_fileprivate"}
//#Issue: {"severity": "Warning", "line": 31, "patternId": "strict_fileprivate"}

    fileprivate class C {
        fileprivate func f() {}
    }

    fileprivate extension String {
        fileprivate var isSomething: Bool { self == "something" }
    }

    fileprivate actor A {
        fileprivate let i = 1
    }

    fileprivate struct C {
        fileprivate(set) var myInt = 4
    }

    struct Outter {
        struct Inter {
            fileprivate struct Inner {}
        }
    }
