# Local Doc Comment

Doc comments shouldn't be used in local scopes. Use regular comments.

* **Identifier:** local_doc_comment
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
func foo() {
  // Local scope documentation should use normal comments.
  print("foo")
}
```

```swift
/// My great property
var myGreatProperty: String!
```

```swift
/// Look here for more info: https://github.com.
var myGreatProperty: String!
```

```swift
/// Look here for more info:
/// https://github.com.
var myGreatProperty: String!
```

## Triggering Examples

```swift
func foo() {
  ↓/// Docstring inside a function declaration
  print("foo")
}
```