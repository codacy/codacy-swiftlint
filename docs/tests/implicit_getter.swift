//#Patterns: implicit_getter

//#Issue: {"severity": "Warning", "line": 13, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 34, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 40, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 48, "patternId": "implicit_getter"}
//#Issue: {"severity": "Warning", "line": 54, "patternId": "implicit_getter"}

class Foo {
    var foo: Int {
        get {
            return 20
        }
    }
}

class Foo {
    var foo: Int {
        get{ return 20 }
    }
}

class Foo {
    static var foo: Int {
        get {
            return 20
        }
    }
}

var foo: Int {
    get { return 20 }
}

class Foo {
    @objc func bar() {}
    var foo: Int {
        get {
            return 20
        }
    }
}

extension Foo {
    var bar: Bool {
        get { _bar }
    }
}

class Foo {
    subscript(i: Int) -> Int {
        get {
            return 20
        }
    }
}
