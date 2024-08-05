//#Patterns: trailing_comma

//#Issue: {"severity": "Warning", "line": 12, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 15, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 29, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 33, "patternId": "trailing_comma"}
//#Issue: {"severity": "Warning", "line": 37, "patternId": "trailing_comma"}

    let foo = [1, 2, 3,]


    let foo = [1, 2, 3, ]


    let foo = [1, 2, 3   ,]


    let foo = [1: 2, 2: 3, ]


    struct Bar {
     let foo = [1: 2, 2: 3, ]
    }


    let foo = [1, 2, 3,] + [4, 5, 6↓,]


    let example = [ 1,
    2,
     // 3,
    ]

    let foo = ["אבג", "αβγ", "🇺🇸",]
