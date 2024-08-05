# Non-Optional String <-> Data Conversion

Prefer using UTF-8 encoded strings when converting between `String` and `Data`

* **Identifier:** non_optional_string_data_conversion
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
Data("foo".utf8)
```

```swift
String(decoding: data, as: UTF8.self)
```

## Triggering Examples

```swift
"foo".data(using: .utf8)
```

```swift
String(data: data, encoding: .utf8)
```