//#Patterns: explicit_type_interface

//#Issue: {"severity": "Warning", "line": 9, "patternId": "explicit_type_interface"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "explicit_type_interface"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "explicit_type_interface"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "explicit_type_interface"}

class Foo {
    var myVar = 0
    
}


class Foo {
    let mylet = 0
    
}


class Foo {
    static var myStaticVar = 0
}


class Foo {
    class var myClassVar = 0
}
