# Accessibility Label for Image

Images that provide context should have an accessibility label or should be explicitly hidden from accessibility

* **Identifier:** `accessibility_label_for_image`
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

In UIKit, a `UIImageView` was by default not an accessibility element, and would only be visible to VoiceOver and other assistive technologies if the developer explicitly made them an accessibility element. In SwiftUI, however, an `Image` is an accessibility element by default. If the developer does not explicitly hide them from accessibility or give them an accessibility label, they will inherit the name of the image file, which often creates a poor experience when VoiceOver reads things like "close icon white".

Known false negatives for Images declared as instance variables and containers that provide a label but are not accessibility elements. Known false positives for Images created in a separate function from where they have accessibility properties applied.

## Non Triggering Examples

```swift
struct MyView: View {
    var body: some View {
        Image(decorative: "my-image")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image", label: Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibility(hidden: true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibility(label: Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibilityLabel(Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .renderingMode(.template)
            .foregroundColor(.blue)
            .accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .accessibilityLabel(Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        SwiftUI.Image(uiImage: "my-image").resizable().accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityElement()
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .combine)
        .padding(16)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .ignore)
        .padding(16)
        .accessibilityLabel(Text("Label for my image and text"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button(action: { doAction() }) {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
        }
        .accessibilityLabel(Text("Label for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        NavigationLink("Go to Details") {
            DetailView()
        } label: {
            HStack {
                Image(systemName: "arrow.right")
                Text("Navigate Here")
            }
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button("Save Changes") {
            saveAction()
        } label: {
            Label("Save", systemImage: "square.and.arrow.down")
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button(action: performAction) {
            HStack {
                Image(uiImage: UIImage(systemName: "star") ?? UIImage())
                Text("Favorite")
            }
        }
        .accessibilityLabel("Add to Favorites")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi")
            Image("network-icon")
            Text("Network Status")
        }.accessibilityElement(children: .ignore)
        .accessibilityLabel("Connected to WiFi")
    }
}
```

```swift
struct MyView: View {
    let statusImage: UIImage
    var body: some View {
        HStack {
            Image(uiImage: statusImage)
                .foregroundColor(.green)
            Text("System Status")
        }.accessibilityElement(children: .ignore)
        .accessibilityLabel("System is operational")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        NavigationLink(destination: SettingsView()) {
            HStack {
                Image(nsImage: NSImage(named: "gear") ?? NSImage())
                Text("Preferences")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button {
            toggleState()
        } label: {
            Image(systemName: isEnabled ? "eye" : "eye.slash")
                .foregroundColor(isEnabled ? .blue : .gray)
        }
        .accessibilityLabel(isEnabled ? "Hide content" : "Show content")
    }
}
```

```swift
struct CustomCard: View {
    var body: some View {
        VStack {
            Image("card-background")
            Image(systemName: "checkmark.circle")
            Text("Task Complete")
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Task completed successfully")
    }
}
```

## Triggering Examples

```swift
struct MyView: View {
    var body: some View {
        ↓Image("my-image")
            .resizable(true)
            .frame(width: 48, height: 48)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Image(uiImage: myUiImage)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓SwiftUI.Image(uiImage: "my-image").resizable().accessibilityHidden(false)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .resizable()
            .frame(width: 48, height: 48)
            .accessibilityLabel(Text("Alt text for my image"))
        ↓Image("other image")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(decorative: "image1")
        ↓Image("image2")
        Image(uiImage: "image3")
            .accessibility(label: Text("a pretty picture"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            ↓Image("my-image")
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityElement(children: .contain)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityHidden(false)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .combine)
        .padding(16)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button(action: { doAction() }) {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Image(systemName: "circle.plus")
    }
}
```

```swift
struct StatusView: View {
    let statusIcon: UIImage
    var body: some View {
        HStack {
            ↓Image(uiImage: statusIcon)
                .foregroundColor(.green)
            Text("Status")
        }
    }
}
```

```swift
struct PreferencesView: View {
    var body: some View {
        VStack {
            ↓Image(nsImage: NSImage(named: "gear") ?? NSImage())
                .resizable()
                .frame(width: 24, height: 24)
            Text("Settings")
        }
    }
}
```

```swift
struct FaviconView: View {
    let favicon: UIImage?
    var body: some View {
        ↓Image(uiImage: favicon ?? UIImage())
            .aspectRatio(contentMode: .fit)
            .frame(width: 16, height: 16)
    }
}
```

```swift
struct IconGrid: View {
    var body: some View {
        HStack {
            ↓Image(uiImage: loadedImage)
                .resizable()
            ↓Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }.accessibilityElement(children: .combine)
    }
}
```

```swift
struct CardView: View {
    var body: some View {
        VStack {
            ↓Image(uiImage: backgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text("Card Content")
        }.accessibilityElement(children: .contain)
    }
}
```