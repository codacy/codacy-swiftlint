# Unused Declaration

Declarations should be referenced at least once within all files linted.

* **Identifier:** unused_declaration
* **Enabled by default:** Disabled
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** Yes
* **Minimum Swift compiler version:** 3.0.0
* **Default configuration:** severity: error, include_public_and_open: false, related_usrs_to_skip: ["s:7SwiftUI15PreviewProviderP"]

## Non Triggering Examples

```swift
let kConstant = 0
_ = kConstant
```

```swift
enum Change<T> {
  case insert(T)
  case delete(T)
}

extension Sequence {
  func deletes<T>() -> [T] where Element == Change<T> {
    return compactMap { operation in
      if case .delete(let value) = operation {
        return value
      } else {
        return nil
      }
    }
  }
}

let changes = [Change.insert(0), .delete(0)]
changes.deletes()
```

```swift
struct Item {}
struct ResponseModel: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items = "ResponseItems"
    }
}

_ = ResponseModel(items: [Item()]).items
```

```swift
class ResponseModel {
    @objc func foo() {
    }
}
_ = ResponseModel()
```

```swift
public func foo() {}
```

```swift
protocol Foo {}

extension Foo {
    func bar() {}
}

struct MyStruct: Foo {}
MyStruct().bar()
```

```swift
import XCTest
class MyTests: XCTestCase {
    func testExample() {}
}
```

```swift
import XCTest
open class BestTestCase: XCTestCase {}
class MyTests: BestTestCase {
    func testExample() {}
}
```

```swift
enum Component {
  case string(StaticString)
  indirect case array([Component])
  indirect case optional(Component?)
}

@_functionBuilder
struct ComponentBuilder {
  static func buildExpression(_ string: StaticString) -> Component {
    return .string(string)
  }

  static func buildBlock(_ components: Component...) -> Component {
    return .array(components)
  }

  static func buildIf(_ value: Component?) -> Component {
    return .optional(value)
  }
}

func acceptComponentBuilder(@ComponentBuilder _ body: () -> Component) {
  print(body())
}

acceptComponentBuilder {
  "hello"
}
```

## Triggering Examples

```swift
let ↓kConstant = 0
```

```swift
struct Item {}
struct ↓ResponseModel: Codable {
    let ↓items: [Item]

    enum ↓CodingKeys: String {
        case items = "ResponseItems"
    }
}
```

```swift
class ↓ResponseModel {
    func ↓foo() {
    }
}
```

```swift
public func ↓foo() {}
```

```swift
protocol Foo {
    func ↓bar1()
}

extension Foo {
    func bar1() {}
    func ↓bar2() {}
}

struct MyStruct: Foo {}
_ = MyStruct()
```

```swift
import XCTest
class ↓MyTests: NSObject {
    func ↓testExample() {}
}
```

```swift
enum Component {
  case string(StaticString)
  indirect case array([Component])
  indirect case optional(Component?)
}

struct ComponentBuilder {
  func ↓buildExpression(_ string: StaticString) -> Component {
    return .string(string)
  }

  func ↓buildBlock(_ components: Component...) -> Component {
    return .array(components)
  }

  func ↓buildIf(_ value: Component?) -> Component {
    return .optional(value)
  }

  static func ↓buildABear(_ components: Component...) -> Component {
    return .array(components)
  }
}

_ = ComponentBuilder()
```