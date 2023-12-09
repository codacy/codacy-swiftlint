//#Patterns: first_where

//#Issue: {"severity": "Warning", "line": 13, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 19, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 23, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 26, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 28, "patternId": "first_where"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "first_where"}

myList.filter { $0 % 2 == 0 }.first

myList.filter({ $0 % 2 == 0 }).first

myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first

myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first?.something()

myList.filter(someFunction).first

myList.filter({ $0 % 2 == 0 })
.first

(myList.filter { $0 == 1 }).first

myListOfDict.filter { dict in dict["1"] }.first

myListOfDict.filter { $0["someString"] }.first
