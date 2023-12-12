//#Patterns: discouraged_direct_init

//#Issue: {"severity": "Warning", "line": 15, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 24, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 27, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 30, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 33, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 36, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 39, "patternId": "discouraged_direct_init"}
//#Issue: {"severity": "Warning", "line": 42, "patternId": "discouraged_direct_init"}


UIDevice()


Bundle()


let foo = UIDevice()


let foo = Bundle()


let foo = bar(bundle: Bundle(), device: UIDevice())


UIDevice.init()


Bundle.init()


let foo = UIDevice.init()


let foo = Bundle.init()


let foo = bar(bundle: Bundle.init(), device: UIDevice.init())
