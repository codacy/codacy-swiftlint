//#Patterns: nesting

//#Issue: {"severity": "Warning", "line": 10, "patternId": "nesting"}
//#Issue: {"severity": "Warning", "line": 13, "patternId": "nesting"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "nesting"}
//#Issue: {"severity": "Warning", "line": 22, "patternId": "nesting"}
//#Issue: {"severity": "Warning", "line": 23, "patternId": "nesting"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "nesting"}

    class A { class B { class C {} } }


    struct A { struct B { struct C {} } }


    enum A { enum B { enum C {} } }


    func func0() {
    func func1() {
    func func2() {
    func func3() {
    func func4() { func func5() {
    func func6() {
    }
    }
    }
    }
    }
    }
    }
