//#Patterns: array_init

//#Issue: {"severity": "Warning", "line": 13, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 23, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 31, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 35, "patternId": "array_init"}
//#Issue: {"severity": "Warning", "line": 37, "patternId": "array_init"}

foo.map({ $0 })

foo.map { $0 }

foo.map { return $0 }

    foo.map { elem in
        elem
    }

    foo.map { elem in
        return elem
    }

    foo.map { (elem: String) in
        elem
    }

    foo.map { elem -> String in
        elem
    }

foo.map { $0 /* a comment */ }

foo.map { /* a comment */ $0 }
