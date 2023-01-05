# Prefer Self in Static References

Use `Self` to refer to the surrounding type name.

* **Identifier:** prefer_self_in_static_references
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
    class C {
        static let primes = [2, 3, 5, 7]
        func isPrime(i: Int) -> Bool { Self.primes.contains(i) }
```

```swift
    struct T {
        static let i = 0
    }
    struct S {
        static let i = 0
    }
    extension T {
        static let j = S.i + T.i
        static let k = { T.j }()
    }
```

```swift
    class `Self` {
        static let i = 0
        func f() -> Int { Self.i }
    }
```

## Triggering Examples

```swift
    class C {
        struct S {
            static let i = 2
            let h = ↓S.i
        }
        static let i = 1
        let h = C.i
        var j: Int { ↓C.i }
        func f() -> Int { ↓C.i + h }
    }
```

```swift
    struct S {
        let j: Int
        static let i = 1
        static func f() -> Int { ↓S.i }
        func g() -> Any { ↓S.self }
        func h() -> S { ↓S(j: 2) }
        func i() -> KeyPath<S, Int> { \↓S.j }
        func j(@Wrap(-↓S.i, ↓S.i) n: Int = ↓S.i) {}
    }
```

```swift
    struct S {
        struct T {
            static let i = 3
        }
        struct R {
            static let j = S.T.i
        }
        static let h = ↓S.T.i + ↓S.R.j
    }
```

```swift
    enum E {
        case A
        static func f() -> E { ↓E.A }
        static func g() -> E { ↓E.f() }
    }
```