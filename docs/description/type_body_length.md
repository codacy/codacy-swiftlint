# Type Body Length

Type bodies should not span too many lines

* **Identifier:** `type_body_length`
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
  250
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  350
  </td>
  </tr>
  <tr>
  <td>
  excluded_types
  </td>
  <td>
  [extension, protocol]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
//
// warning: 2
//

actor A {}

```

```swift
//
// warning: 2
//

class C {}

```

```swift
//
// warning: 2
//

enum E {}

```

```swift
//
// warning: 2
// excluded_types: []
//

extension E {}

```

```swift
//
// warning: 2
// excluded_types: []
//

protocol P {}

```

```swift
//
// warning: 2
//

struct S {}

```

```swift
//
// warning: 2
//

actor A {
    let x = 0
}

```

```swift
//
// warning: 2
//

class C {
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

enum E {
    let x = 0
    // empty lines will be ignored


}

```

```swift
//
// warning: 2
//

protocol P {
    let x = 0
    let y = 1
    let z = 2
}

```

## Triggering Examples

```swift
//
// warning: 2
//

↓actor A {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
//

↓class C {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
//

↓enum E {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
// excluded_types: []
//

↓extension E {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
// excluded_types: []
//

↓protocol P {
    let x = 0
    let y = 1
    let z = 2
}

```

```swift
//
// warning: 2
//

↓struct S {
    let x = 0
    let y = 1
    let z = 2
}

```