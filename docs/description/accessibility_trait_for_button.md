# Accessibility Trait for Button

All views with tap gestures added should include the .isButton or the .isLink accessibility traits

* **Identifier:** `accessibility_trait_for_button`
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.1.0
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

The accessibility button and link traits are used to tell assistive technologies that an element is tappable. When an element has one of these traits, VoiceOver will automatically read "button" or "link" after the element's label to let the user know that they can activate it.

When using a UIKit `UIButton` or SwiftUI `Button` or `Link`, the button trait is added by default, but when you manually add a tap gesture recognizer to an element, you need to explicitly add the button or link trait. 
In most cases the button trait should be used, but for buttons that open a URL in an external browser we use the link trait instead. This rule attempts to catch uses of the SwiftUI `.onTapGesture` modifier where the `.isButton` or `.isLink` trait is not explicitly applied.

## Non Triggering Examples

```swift
struct MyView: View {
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Text("Learn more")
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Link("Open link", destination: myUrl)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .onTapGesture {
                print("tapped - open URL")
            }
            .accessibility(addTraits: .isLink)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .accessibilityAddTraits(.isButton)
            .onTapGesture {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .accessibility(addTraits: [.isButton, .isHeader])
            .onTapGesture {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .onTapGesture {
                print("tapped - open URL")
            }
            .accessibilityAddTraits([.isHeader, .isLink])
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .onTapGesture(count: 1) {
                print("tapped")
            }
            .accessibility(addTraits: .isButton)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .onTapGesture(count: 1, perform: {
                print("tapped")
            })
            .accessibility(addTraits: .isButton)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            // This rule does not include tap gestures with multiple taps for now.
            // Custom gestures like this are also not very accessible, but require
            // alternative ways to accomplish the same task with assistive tech.
            .onTapGesture(count: 2) {
                print("double-tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Label("Learn more", systemImage: "info.circle")
            .onTapGesture(count: 1) {
                print("tapped")
            }
            .accessibility(addTraits: .isButton)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack {
            Image(systemName: "info.circle")
            Text("Learn more")
        }
        .onTapGesture {
            print("tapped")
        }
        // This modifier is not strictly required — each subview will inherit the button trait.
        // That said, grouping a tappable stack into a single element is a good way to reduce
        // the number of swipes required for a VoiceOver user to navigate the page.
        .accessibilityElement(children: .combine)
        .accessibility(addTraits: .isButton)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .gesture(TapGesture().onEnded {
                print("tapped")
            })
            .accessibilityAddTraits(.isButton)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .simultaneousGesture(TapGesture(count: 1).onEnded {
                print("tapped - open URL")
            })
            .accessibilityAddTraits(.isLink)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .highPriorityGesture(TapGesture().onEnded {
                print("tapped")
            })
            .accessibility(addTraits: [.isButton])
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Text("Learn more")
            .gesture(TapGesture(count: 2).onEnded {
                print("tapped")
            })
    }
}
```

## Triggering Examples

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .onTapGesture {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .accessibility(addTraits: .isHeader)
            .onTapGesture {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .onTapGesture(count: 1) {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .onTapGesture(count: 1, perform: {
                print("tapped")
            })
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Label("Learn more", systemImage: "info.circle")
            .onTapGesture(count: 1) {
                print("tapped")
            }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓HStack {
            Image(systemName: "info.circle")
            Text("Learn more")
        }
        .onTapGesture {
            print("tapped")
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .gesture(TapGesture().onEnded {
                print("tapped")
            })
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .simultaneousGesture(TapGesture(count: 1).onEnded {
                print("tapped")
            })
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Text("Learn more")
            .highPriorityGesture(TapGesture().onEnded {
                print("tapped")
            })
    }
}
```