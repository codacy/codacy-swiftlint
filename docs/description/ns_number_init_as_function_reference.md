# NSNumber Init as Function Reference

Passing `NSNumber.init` or `NSDecimalNumber.init` as a function reference is dangerous as it can cause the wrong initializer to be used, causing crashes. Use `.init(value:)` instead.

* **Identifier:** ns_number_init_as_function_reference
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
[0, 0.2].map(NSNumber.init(value:))
```

```swift
[0, 0.2].map { NSNumber(value: $0) }
```

```swift
[0, 0.2].map(NSDecimalNumber.init(value:))
```

```swift
[0, 0.2].map { NSDecimalNumber(value: $0) }
```

## Triggering Examples

```swift
[0, 0.2].map(↓NSNumber.init)
```

```swift
[0, 0.2].map(↓NSDecimalNumber.init)
```