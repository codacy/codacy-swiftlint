# Type Name

Type name should only contain alphanumeric characters, start with an uppercase character and span between 3 and 40 characters in length.
Private types may start with an underscore.

* **Identifier:** type_name
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** (min_length) w/e: 3/0, (max_length) w/e: 40/1000, excluded: [], allowed_symbols: [], validates_start_with_lowercase: true, validate_protocols: true

## Non Triggering Examples

```swift
class MyType {}
```

```swift
private struct _MyType {}
```

```swift
enum AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
typealias Foo = Void
```

```swift
private typealias Foo = Void
```

```swift
protocol Foo {
  associatedtype Bar
}
```

```swift
protocol Foo {
  associatedtype Bar: Equatable
}
```

```swift
enum MyType {
case value
}
```

```swift
protocol P {}
```

```swift
struct SomeStruct {
  enum `Type` {
    case x, y, z
  }
}
```

## Triggering Examples

```swift
class ↓myType {}
```

```swift
enum ↓_MyType {}
```

```swift
private struct ↓MyType_ {}
```

```swift
struct ↓My {}
```

```swift
struct ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
class ↓MyView_Previews
```

```swift
private struct ↓_MyView_Previews
```

```swift
typealias ↓X = Void
```

```swift
private typealias ↓Foo_Bar = Void
```

```swift
private typealias ↓foo = Void
```

```swift
typealias ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA = Void
```

```swift
protocol Foo {
  associatedtype ↓X
}
```

```swift
protocol Foo {
  associatedtype ↓Foo_Bar: Equatable
}
```

```swift
protocol Foo {
  associatedtype ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
}
```

```swift
protocol ↓X {}
```