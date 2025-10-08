# Prefer Condition List

Prefer a condition list over chaining conditions with '&&'

* **Identifier:** `prefer_condition_list`
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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

Instead of chaining conditions with `&&`, use a condition list to separate conditions with commas, that is,
use

```swift
if a, b {}
```

instead of

```swift
if a && b {}
```

Using a condition list improves readability and makes it easier to add or remove conditions in the future.
It also allows for better formatting and alignment of conditions. All in all, it's the idiomatic way to
write conditions in Swift.

Since function calls with trailing closures trigger a warning in the Swift compiler when used in
conditions, this rule makes sure to wrap such expressions in parentheses when transforming them to
condition list elements. The scope of the parentheses is limited to the function call itself.

## Non Triggering Examples

```swift
if a, b {}
```

```swift
guard a || b && c {}
```

```swift
if a && b || c {}
```

```swift
let result = a && b
```

```swift
repeat {} while a && b
```

```swift
if (f {}) {}
```

```swift
if f {} {}
```

## Triggering Examples

```swift
if a ↓&& b {}
```

```swift
if a ↓&& b ↓&& c {}
```

```swift
while a ↓&& b {}
```

```swift
guard a ↓&& b {}
```

```swift
guard (a || b) ↓&& c {}
```

```swift
if a ↓&& (b && c) {}
```

```swift
guard a ↓&& b ↓&& c else {}
```

```swift
if (a ↓&& b) {}
```

```swift
if (a ↓&& f {}) {}
```