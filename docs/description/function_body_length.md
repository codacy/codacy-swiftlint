# Function Body Length

Function bodies should not span too many lines

* **Identifier:** `function_body_length`
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** metrics
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:**
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  warning
  </td>
  <td>
  50
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  100
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
//
// warning: 2
//

func f() {}

```

```swift
//
// warning: 2
//

func f() {
    let x = 0
}

```

```swift
//
// warning: 2
//

func f() {
    let x = 0
    let y = 1
}

```

```swift
//
// warning: 2
//

func f() {
    let x = 0
    // comments
    // will
    // be
    // ignored
}

```

```swift
//
// warning: 2
//

    func f() {
        let x = 0
        // empty lines will be ignored


    }

```

## Triggering Examples

```swift
//
// warning: 2
//

↓func f() {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
//

class C {
    ↓deinit {
        let x = 0
        let y = 1
        let z = 2
    }
}

```

```swift
//
// warning: 2
//

class C {
    ↓init() {
        let x = 0
        let y = 1
        let z = 2
    }
}

```

```swift
//
// warning: 2
//

class C {
    ↓subscript() -> Int {
        let x = 0
        let y = 1
        return x + y
    }
}

```

```swift
//
// warning: 2
//

struct S {
    subscript() -> Int {
        ↓get {
            let x = 0
            let y = 1
            return x + y
        }
        ↓set {
            let x = 0
            let y = 1
            let z = 2
        }
        ↓willSet {
            let x = 0
            let y = 1
            let z = 2
        }
    }
}

```