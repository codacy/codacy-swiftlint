# Function Name Whitespace

There should be consistent whitespace before and after function names and generic parameters.

* **Identifier:** `function_name_whitespace`
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** style
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
  generic_spacing
  </td>
  <td>
  no_space
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
func abc(lhs: Int, rhs: Int) -> Int {}
```

```swift
func <| (lhs: Int, rhs: Int) -> Int {}
```

```swift
func <|< <A>(lhs: A, rhs: A) -> A {}
```

```swift
func <| /* comment */ (lhs: Int, rhs: Int) -> Int {}
```

```swift
func <|< /* comment */ <A>(lhs: A, rhs: A) -> A {}
```

```swift
func <|< <A> /* comment */ (lhs: A, rhs: A) -> A {}
```

```swift
func <| /* comment */ <T> /* comment */ (lhs: T, rhs: T) -> T {}
```

```swift
//
// generic_spacing: no_space
//

func abc<T>(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_space
//

func abc <T>(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: trailing_space
//

func abc<T> (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_space
//

func abc <T>(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_space
//

func abc /* comment */ <T> /* comment */ (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: trailing_space
//

func abc /* comment */ <T> /* comment */ (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_trailing_space
//

func abc <T> (lhs: Int, rhs: Int) -> Int {}

```

```swift
func /* comment */ abc(lhs: Int, rhs: Int) -> Int {}
```

```swift
func /* comment */  abc(lhs: Int, rhs: Int) -> Int {}
```

```swift
func abc /* comment */ (lhs: Int, rhs: Int) -> Int {}
```

```swift
//
// generic_spacing: no_space
//

func abc /* comment */ <T>(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: no_space
//

func abc<T> /* comment */ (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: no_space
//

func abc /* comment */ <T> /* comment */ (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: no_space
//

func foo<
   T
>(
   param1: Int,
   param2: Bool,
   param3: [String]
) { }

```

```swift
//
// generic_spacing: leading_trailing_space
//

func foo <
T
> (
    param1: Int,
    param2: Bool,
    param3: [String]
) { }

```

```swift
//
// generic_spacing: leading_trailing_space
//

func foo /* comment */ <
T
> (
    param1: Int,
    param2: Bool,
    param3: [String]
) { }

```

## Triggering Examples

```swift
func↓  name(lhs: A, rhs: A) -> A {}
```

```swift
func name↓ (lhs: A, rhs: A) -> A {}
```

```swift
func↓  name↓ (lhs: A, rhs: A) -> A {}
```

```swift
func <|↓(lhs: Int, rhs: Int) -> Int {}
```

```swift
func <|<↓<A>(lhs: A, rhs: A) -> A {}
```

```swift
func <|↓  (lhs: Int, rhs: Int) -> Int {}
```

```swift
func <|<↓  <A>(lhs: A, rhs: A) -> A {}
```

```swift
func <|↓/* comment */  (lhs: Int, rhs: Int) -> Int {}
```

```swift
func <|<↓/* comment */  <A>(lhs: A, rhs: A) -> A {}
```

```swift
func <|< <A>↓/* comment */  (lhs: A, rhs: A) -> A {}
```

```swift
func name↓ <T>(lhs: Int, rhs: Int) -> Int {}
```

```swift
//
// generic_spacing: no_space
//

func name↓ /* comment */  <T>↓  /* comment */  (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: no_space
//

func name /* comment */ /* comment */  <T>↓  /* comment */  (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: no_space
//

func foo<
   T
>↓ (
   param1: Int,
   param2: Bool,
   param3: [String]
) { }

```

```swift
//
// generic_spacing: no_space
//

func foo↓ <
   T
>(
   param1: Int,
   param2: Bool,
   param3: [String]
) { }

```

```swift
//
// generic_spacing: no_space
//

func foo↓ <
  T
>↓ (
   param1: Int,
   param2: Bool,
   param3: [String]
) { }

```

```swift
//
// generic_spacing: leading_space
//

func abc <T>↓ (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_space
//

func foo <
T
>↓ (
    param1: Int,
    param2: Bool,
    param3: [String]
) { }

```

```swift
//
// generic_spacing: trailing_space
//

func abc↓ <T> (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: trailing_space
//

func foo↓ <
T
> (
    param1: Int,
    param2: Bool,
    param3: [String]
) { }

```

```swift
//
// generic_spacing: leading_trailing_space
//

func abc↓<T> (lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_trailing_space
//

func abc <T>↓(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_trailing_space
//

func abc↓<T>↓(lhs: Int, rhs: Int) -> Int {}

```

```swift
//
// generic_spacing: leading_trailing_space
//

func foo↓ /* comment */  <
T
>↓  (
    param1: Int,
    param2: Bool,
    param3: [String]
) { }

```