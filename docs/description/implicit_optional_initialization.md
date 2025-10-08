# Implicit Optional Initialization

Optionals should be consistently initialized, either with `= nil` or without.

* **Identifier:** `implicit_optional_initialization`
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** style
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
  severity
  </td>
  <td>
  warning
  </td>
  </tr>
  <tr>
  <td>
  style
  </td>
  <td>
  always
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
var foo: Int? {
  if bar != nil { }
  return 0
}
```

```swift
var foo: Int? = {
  if bar != nil { }
  return 0
}()
```

```swift
lazy var test: Int? = nil
```

```swift
let myVar: String? = nil
```

```swift
var myVar: Int? { nil }
```

```swift
var x: Int? = 1
```

```swift
//
// style: never
//

private var myVar: Int? = nil

```

```swift
//
// style: never
//

var myVar: Optional<Int> = nil

```

```swift
//
// style: never
//

var myVar: Int? { nil }, myOtherVar: Int? = nil

```

```swift
//
// style: never
//

var myVar: String? = nil {
  didSet { print("didSet") }
}

```

```swift
//
// style: never
//

func funcName() {
    var myVar: String? = nil
}

```

```swift
//
// style: never
//

var x: Int? = nil // comment

```

```swift
//
// style: always
//

public var myVar: Int?

```

```swift
//
// style: always
//

var myVar: Optional<Int>

```

```swift
//
// style: always
//

var myVar: Int? { nil }, myOtherVar: Int?

```

```swift
//
// style: always
//

var myVar: String? {
  didSet { print("didSet") }
}

```

```swift
//
// style: always
//

func funcName() {
  var myVar: String?
}

```

```swift
//
// style: always
//

var x: Int? // comment

```

## Triggering Examples

```swift
//
// style: never
//

var ↓myVar: Int? 

```

```swift
//
// style: never
//

var ↓myVar: Optional<Int> 

```

```swift
//
// style: never
//

var myVar: Int? = nil, ↓myOtherVar: Int? 

```

```swift
//
// style: never
//

var ↓myVar: String? {
  didSet { print("didSet") }
}

```

```swift
//
// style: never
//

func funcName() {
  var ↓myVar: String?
}

```

```swift
//
// style: always
//

var ↓myVar: Int? = nil

```

```swift
//
// style: always
//

var ↓myVar: Optional<Int> = nil

```

```swift
//
// style: always
//

var myVar: Int?, ↓myOtherVar: Int? = nil

```

```swift
//
// style: always
//

var ↓myVar: String? = nil {
  didSet { print("didSet") }
}

```

```swift
//
// style: always
//

func funcName() {
    var ↓myVar: String? = nil
}

```