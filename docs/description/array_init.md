# Array Init

Prefer using `Array(seq)` over `seq.map { $0 }` to convert a sequence into an Array

* **Identifier:** `array_init`
* **Enabled by default:** No
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

## Rationale

When converting the elements of a sequence directly into an `Array`, for clarity, prefer using the `Array` constructor over calling `map`. For example

```swift
Array(foo)
```

rather than

```swift
foo.↓map({ $0 })
```

If some processing of the elements is required, then using `map` is fine. For example

```swift
foo.map { !$0 }
```

Constructs like

```swift
enum MyError: Error {}
let myResult: Result<String, MyError> = .success("")
let result: Result<Any, MyError> = myResult.map { $0 }
```

may be picked up as false positives by the `array_init` rule. If your codebase contains constructs like this, consider using the `typesafe_array_init` analyzer rule instead.

## Non Triggering Examples

```swift
Array(foo)
```

```swift
foo.map { $0.0 }
```

```swift
foo.map { $1 }
```

```swift
foo.map { $0() }
```

```swift
foo.map { ((), $0) }
```

```swift
foo.map { $0! }
```

```swift
foo.map { $0! /* force unwrap */ }
```

```swift
foo.something { RouteMapper.map($0) }
```

```swift
foo.map { !$0 }
```

```swift
foo.map { /* a comment */ !$0 }
```

## Triggering Examples

```swift
foo.↓map({ $0 })
```

```swift
foo.↓map { $0 }
```

```swift
foo.↓map { return $0 }
```

```swift
foo.↓map { elem in
    elem
}
```

```swift
foo.↓map { elem in
    return elem
}
```

```swift
foo.↓map { (elem: String) in
    elem
}
```

```swift
foo.↓map { elem -> String in
    elem
}
```

```swift
foo.↓map { $0 /* a comment */ }
```

```swift
foo.↓map { /* a comment */ $0 }
```