//#Patterns: private_outlet

//#Issue: {"severity": "Warning", "line": 7, "patternId": "private_outlet"}
//#Issue: {"severity": "Warning", "line": 12, "patternId": "private_outlet"}

    class Foo {
      @IBOutlet var label: UILabel?
    }


    class Foo {
      @IBOutlet var label: UILabel!
    }
