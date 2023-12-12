//#Patterns: vertical_parameter_alignment

//#Issue: {"severity": "Warning", "line": 11, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 17, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 21, "patternId": "vertical_parameter_alignment"}
//#Issue: {"severity": "Warning", "line": 25, "patternId": "vertical_parameter_alignment"}

func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                  dictionary: SourceKittenDictionary) { }

func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                       dictionary: SourceKittenDictionary) { }

func validateFunction(_ file: SwiftLintFile,
                  kind: SwiftDeclarationKind,
                  dictionary: SourceKittenDictionary) { }

func foo(data: Data,
            @ViewBuilder content: @escaping (Data.Element.IdentifiedValue) -> Content) {}

class A {
    init(data: Data,
                @ViewBuilder content: @escaping (Data.Element.IdentifiedValue) -> Content) {}
}
