//#Patterns: colon

//#Issue: {"severity": "Warning", "line": 48, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 51, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 54, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 57, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 60, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 63, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 66, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 69, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 72, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 75, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 78, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 81, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 84, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 87, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 90, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 93, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 96, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 99, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 102, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 105, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 108, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 111, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 114, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 117, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 120, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 123, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 126, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 129, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 132, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 135, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 138, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 141, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 144, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 147, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 150, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 153, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 156, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 159, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 162, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 165, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 168, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 171, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 174, "patternId": "colon"}
//#Issue: {"severity": "Warning", "line": 177, "patternId": "colon"}

    let abc:Void


    let abc:  Void


    let abc :Void


    let abc : Void


    let abc : [Void: Void]


    let abc : (Void, String, Int)


    let abc : ([Void], String, Int)


    let abc : [([Void], String, Int)]


    let abc:  (Void, String, Int)


    let abc:  ([Void], String, Int)


    let abc:  [([Void], String, Int)]


    let abc :String="def"


    let abc :Int=0


    let abc :Int = 0


    let abc:Int=0


    let abc:Int = 0


    let abc:Enum=Enum.Value


    func abc(def:Void) {}


    func abc(def:  Void) {}


    func abc(def :Void) {}


    func abc(def : Void) {}


    func abc(def: Void, ghi :Void) {}


    let abc = [Void:Void]()


    let abc = [Void : Void]()


    let abc = [Void:  Void]()


    let abc = [Void :  Void]()


    let abc = [1: [3 : 2], 3: 4]


    let abc = [1: [3 : 2], 3↓:  4]


    let abc: [String : Int]


    let abc: [String:Int]


    func foo(bar: [String : Int]) {}


    func foo(bar: [String:Int]) {}


    func foo() -> [String : Int] { return [:] }


    func foo() -> [String:Int] { return [:] }


    let abc : Any


    let abc: [Any : Int]


    let abc: [String : Any]


    class Foo : Bar {}


    class Foo:Bar {}


    class Foo<T:Equatable> {}


    class Foo<T : Equatable> {}


    object.method(x: 5, y : "string")


    object.method(x:5, y: "string")


    object.method(x:  5, y: "string")
