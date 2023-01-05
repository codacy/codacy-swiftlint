# No Magic Numbers

Magic numbers should be replaced by named constants.

* **Identifier:** no_magic_numbers
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
var foo = 123
```

```swift
static let bar: Double = 0.123
```

```swift
let a = b + 1.0
```

```swift
array[0] + array[1] 
```

```swift
let foo = 1_000.000_01
```

```swift
// array[1337]
```

```swift
baz("9999")
```

```swift
func foo() {
    let x: Int = 2
    let y = 3
    let vector = [x, y, -1]
}
```

```swift
class A {
    var foo: Double = 132
    static let bar: Double = 0.98
}
```

```swift
@available(iOS 13, *)
func version() {
    if #available(iOS 13, OSX 10.10, *) {
        return
    }
}
```

## Triggering Examples

```swift
foo(↓321)
```

```swift
bar(↓1_000.005_01)
```

```swift
array[↓42]
```

```swift
let box = array[↓12 + ↓14]
```

```swift
let a = b + ↓2.0
```

```swift
Color.primary.opacity(isAnimate ? ↓0.1 : ↓1.5)
```