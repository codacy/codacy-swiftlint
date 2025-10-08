# Non-optional String -> Data Conversion

Prefer non-optional `Data(_:)` initializer when converting `String` to `Data`

* **Identifier:** `non_optional_string_data_conversion`
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** lint
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
  include_variables
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
Data("foo".utf8)
```

```swift
Data(string.utf8)
```

```swift
"foo".data(using: .ascii)
```

```swift
string.data(using: .unicode)
```

```swift
//
// include_variables: true
//

Data("foo".utf8)

```

```swift
//
// include_variables: true
//

Data(string.utf8)

```

```swift
//
// include_variables: true
//

"foo".data(using: .ascii)

```

```swift
//
// include_variables: true
//

string.data(using: .unicode)

```

## Triggering Examples

```swift
↓"foo".data(using: .utf8)
```

```swift
//
// include_variables: true
//

↓"foo".data(using: .utf8)

```

```swift
//
// include_variables: true
//

↓string.data(using: .utf8)

```

```swift
//
// include_variables: true
//

↓property.data(using: .utf8)

```

```swift
//
// include_variables: true
//

↓obj.property.data(using: .utf8)

```

```swift
//
// include_variables: true
//

↓getString().data(using: .utf8)

```

```swift
//
// include_variables: true
//

↓getValue()?.data(using: .utf8)

```