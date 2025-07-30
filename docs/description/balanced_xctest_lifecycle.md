# Balanced XCTest Life Cycle

Test classes must implement balanced setUp and tearDown methods

* **Identifier:** `balanced_xctest_lifecycle`
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
  <tr>
  <td>
  test_parent_classes
  </td>
  <td>
  [&quot;QuickSpec&quot;, &quot;XCTestCase&quot;]
  </td>
  </tr>
  </tbody>
  </table>

## Rationale

The `setUp` method of `XCTestCase` can be used to set up variables and resources before each test is run (or with the `class` variant, before all tests are run).

This rule verifies that every class with an implementation of a `setUp` method also has a `tearDown` method (and vice versa).

The `tearDown` method should be used to cleanup or reset any resources that could otherwise have any effects on subsequent tests, and to free up any instance variables.

## Non Triggering Examples

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDown() {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDown() {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
}
final class BarTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
}
```

```swift
struct FooTests {
    override func setUp() {}
}
class BarTests {
    override func setUpWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpAlLExamples() {}
}
```

```swift
final class FooTests: XCTestCase {
    class func setUp() {}
    class func tearDown() {}
}
```

## Triggering Examples

```swift
final class ↓FooTests: XCTestCase {
    override func setUp() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func setUpWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
final class ↓BarTests: XCTestCase {
    override func setUpWithError() throws {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    class func tearDown() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func tearDown() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func tearDownWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
final class ↓BarTests: XCTestCase {
    override func tearDownWithError() throws {}
}
```