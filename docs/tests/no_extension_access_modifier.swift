//#Patterns: no_extension_access_modifier

//#Issue: {"severity": "Warning", "line": 9, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 11, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 14, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 16, "patternId": "no_extension_access_modifier"}
//#Issue: {"severity": "Warning", "line": 18, "patternId": "no_extension_access_modifier"}

    private extension String {}

    public
     extension String {}

    open extension String {}

    internal extension String {}

    fileprivate extension String {}
    
