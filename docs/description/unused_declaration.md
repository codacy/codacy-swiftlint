# Unused Declaration

Declarations should be referenced at least once within all files linted

* **Identifier:** unused_declaration
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** Yes
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
  error
  </td>
  </tr>
  <tr>
  <td>
  include_public_and_open
  </td>
  <td>
  false
  </td>
  </tr>
  <tr>
  <td>
  related_usrs_to_skip
  </td>
  <td>
  [&quot;s:7SwiftUI15PreviewProviderP&quot;]
  </td>
  </tr>
  </tbody>
  </table>

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
_ = changes.deletes()
```

```swift
struct Item: Codable {}
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

@resultBuilder
struct ComponentBuilder {
  static func buildBlock(_ components: Component...) -> Component {
    return .array(components)
  }

  static func buildExpression(_ string: StaticString) -> Component {
    return .string(string)
  }

  static func buildOptional(_ component: Component?) -> Component {
    return .optional(component)
  }

  static func buildEither(first component: Component) -> Component {
    return component
  }

  static func buildEither(second component: Component) -> Component {
    return component
  }

  static func buildArray(_ components: [Component]) -> Component {
    return .array(components)
  }

  static func buildLimitedAvailability(_ component: Component) -> Component {
    return component
  }

  static func buildFinalResult(_ component: Component) -> Component {
    return component
  }

  static func buildPartialBlock(first component: Component) -> Component {
    return component
  }

  static func buildPartialBlock(accumulated component: Component, next: Component) -> Component {
    return component
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