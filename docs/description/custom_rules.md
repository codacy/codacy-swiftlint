# Custom Rules

Create custom rules by providing a regex string. Optionally specify what syntax kinds to match against, the severity level, and what message to display. Rules default to SwiftSyntax mode for improved performance. Use `execution_mode: sourcekit` or `default_execution_mode: sourcekit` for SourceKit mode.

* **Identifier:** `custom_rules`
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0