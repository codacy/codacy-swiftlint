# Swift Syntax Dashboard

Efforts are actively under way to migrate most rules off SourceKit to use SwiftSyntax instead.

Rules written using SwiftSyntax tend to be significantly faster and have fewer false positives
than rules that use SourceKit to get source structure information.

47 out of 215 (21%)
of SwiftLint's linter rules use SourceKit.

## Rules Using SourceKit

### Enabled By Default (16)

* `control_statement`: Control Statement
* `custom_rules`: Custom Rules
* `cyclomatic_complexity`: Cyclomatic Complexity
* `duplicate_imports`: Duplicate Imports
* `file_length`: File Length
* `identifier_name`: Identifier Name
* `line_length`: Line Length
* `mark`: Mark
* `nesting`: Nesting
* `opening_brace`: Opening Brace Spacing
* `redundant_void_return`: Redundant Void Return
* `statement_position`: Statement Position
* `todo`: Todo
* `trailing_whitespace`: Trailing Whitespace
* `vertical_whitespace`: Vertical Whitespace
* `void_return`: Void Return

### Opt-In (31)

* `accessibility_label_for_image`: Accessibility Label for Image
* `accessibility_trait_for_button`: Accessibility Trait for Button
* `closure_end_indentation`: Closure End Indentation
* `discouraged_optional_collection`: Discouraged Optional Collection
* `expiring_todo`: Expiring Todo
* `explicit_acl`: Explicit ACL
* `explicit_type_interface`: Explicit Type Interface
* `extension_access_modifier`: Extension Access Modifier
* `file_header`: File Header
* `file_types_order`: File Types Order
* `implicit_return`: Implicit Return
* `indentation_width`: Indentation Width
* `let_var_whitespace`: Variable Declaration Whitespace
* `literal_expression_end_indentation`: Literal Expression End Indentation
* `missing_docs`: Missing Docs
* `modifier_order`: Modifier Order
* `multiline_arguments`: Multiline Arguments
* `multiline_function_chains`: Multiline Function Chains
* `multiline_literal_brackets`: Multiline Literal Brackets
* `multiline_parameters_brackets`: Multiline Parameters Brackets
* `nimble_operator`: Nimble Operator
* `no_grouping_extension`: No Grouping Extension
* `quick_discouraged_call`: Quick Discouraged Call
* `redundant_type_annotation`: Redundant Type Annotation
* `sorted_imports`: Sorted Imports
* `trailing_closure`: Trailing Closure
* `type_contents_order`: Type Contents Order
* `vertical_parameter_alignment_on_call`: Vertical Parameter Alignment On Call
* `vertical_whitespace_between_cases`: Vertical Whitespace Between Cases
* `vertical_whitespace_closing_braces`: Vertical Whitespace before Closing Braces
* `vertical_whitespace_opening_braces`: Vertical Whitespace after Opening Braces

## Rules Not Using SourceKit

### Enabled By Default (75)

* `block_based_kvo`: Block Based KVO
* `class_delegate_protocol`: Class Delegate Protocol
* `closing_brace`: Closing Brace Spacing
* `closure_parameter_position`: Closure Parameter Position
* `colon`: Colon Spacing
* `comma`: Comma Spacing
* `comment_spacing`: Comment Spacing
* `compiler_protocol_init`: Compiler Protocol Init
* `computed_accessors_order`: Computed Accessors Order
* `deployment_target`: Deployment Target
* `discouraged_direct_init`: Discouraged Direct Initialization
* `duplicate_enum_cases`: Duplicate Enum Cases
* `duplicated_key_in_dictionary_literal`: Duplicated Key in Dictionary Literal
* `dynamic_inline`: Dynamic Inline
* `empty_enum_arguments`: Empty Enum Arguments
* `empty_parameters`: Empty Parameters
* `empty_parentheses_with_trailing_closure`: Empty Parentheses with Trailing Closure
* `for_where`: For Where
* `force_cast`: Force Cast
* `force_try`: Force Try
* `function_body_length`: Function Body Length
* `function_parameter_count`: Function Parameter Count
* `generic_type_name`: Generic Type Name
* `implicit_getter`: Implicit Getter
* `inclusive_language`: Inclusive Language
* `inert_defer`: Inert Defer
* `is_disjoint`: Is Disjoint
* `large_tuple`: Large Tuple
* `leading_whitespace`: Leading Whitespace
* `legacy_cggeometry_functions`: Legacy CGGeometry Functions
* `legacy_constant`: Legacy Constant
* `legacy_constructor`: Legacy Constructor
* `legacy_hashing`: Legacy Hashing
* `legacy_nsgeometry_functions`: Legacy NSGeometry Functions
* `legacy_random`: Legacy Random
* `multiple_closures_with_trailing_closure`: Multiple Closures with Trailing Closure
* `no_fallthrough_only`: No Fallthrough Only
* `no_space_in_method_call`: No Space in Method Call
* `notification_center_detachment`: Notification Center Detachment
* `ns_number_init_as_function_reference`: NSNumber Init as Function Reference
* `nsobject_prefer_isequal`: NSObject Prefer isEqual
* `operator_whitespace`: Operator Function Whitespace
* `orphaned_doc_comment`: Orphaned Doc Comment
* `private_over_fileprivate`: Private over fileprivate
* `private_unit_test`: Private Unit Test
* `protocol_property_accessors_order`: Protocol Property Accessors Order
* `reduce_boolean`: Reduce Boolean
* `redundant_discardable_let`: Redundant Discardable Let
* `redundant_objc_attribute`: Redundant @objc Attribute
* `redundant_optional_initialization`: Redundant Optional Initialization
* `redundant_set_access_control`: Redundant Set Access Control Rule
* `redundant_string_enum_value`: Redundant String Enum Value
* `return_arrow_whitespace`: Returning Whitespace
* `self_in_property_initialization`: Self in Property Initialization
* `shorthand_operator`: Shorthand Operator
* `superfluous_disable_command`: Superfluous Disable Command
* `switch_case_alignment`: Switch and Case Statement Alignment
* `syntactic_sugar`: Syntactic Sugar
* `trailing_comma`: Trailing Comma
* `trailing_newline`: Trailing Newline
* `trailing_semicolon`: Trailing Semicolon
* `type_body_length`: Type Body Length
* `type_name`: Type Name
* `unavailable_condition`: Unavailable Condition
* `unneeded_break_in_switch`: Unneeded Break in Switch
* `unused_capture_list`: Unused Capture List
* `unused_closure_parameter`: Unused Closure Parameter
* `unused_control_flow_label`: Unused Control Flow Label
* `unused_enumerated`: Unused Enumerated
* `unused_optional_binding`: Unused Optional Binding
* `unused_setter_value`: Unused Setter Value
* `valid_ibinspectable`: Valid IBInspectable
* `vertical_parameter_alignment`: Vertical Parameter Alignment
* `void_function_in_ternary`: Void Function in Ternary
* `xctfail_message`: XCTFail Message

### Opt-In (93)

* `anonymous_argument_in_multiline_closure`: Anonymous Argument in Multiline Closure
* `anyobject_protocol`: AnyObject Protocol
* `array_init`: Array Init
* `attributes`: Attributes
* `balanced_xctest_lifecycle`: Balanced XCTest life-cycle
* `closure_body_length`: Closure Body Length
* `closure_spacing`: Closure Spacing
* `collection_alignment`: Collection Element Alignment
* `comma_inheritance`: Comma Inheritance Rule
* `conditional_returns_on_newline`: Conditional Returns on Newline
* `contains_over_filter_count`: Contains Over Filter Count
* `contains_over_filter_is_empty`: Contains Over Filter Is Empty
* `contains_over_first_not_nil`: Contains over first not nil
* `contains_over_range_nil_comparison`: Contains over range(of:) comparison to nil
* `convenience_type`: Convenience Type
* `discarded_notification_center_observer`: Discarded Notification Center Observer
* `discouraged_assert`: Discouraged Assert
* `discouraged_none_name`: Discouraged None Name
* `discouraged_object_literal`: Discouraged Object Literal
* `discouraged_optional_boolean`: Discouraged Optional Boolean
* `empty_collection_literal`: Empty Collection Literal
* `empty_count`: Empty Count
* `empty_string`: Empty String
* `empty_xctest_method`: Empty XCTest Method
* `enum_case_associated_values_count`: Enum Case Associated Values Count
* `explicit_enum_raw_value`: Explicit Enum Raw Value
* `explicit_init`: Explicit Init
* `explicit_top_level_acl`: Explicit Top Level ACL
* `fallthrough`: Fallthrough
* `fatal_error_message`: Fatal Error Message
* `file_name`: File Name
* `file_name_no_space`: File Name No Space
* `first_where`: First Where
* `flatmap_over_map_reduce`: FlatMap over map and reduce
* `force_unwrapping`: Force Unwrapping
* `function_default_parameter_at_end`: Function Default Parameter at End
* `ibinspectable_in_extension`: IBInspectable in Extension
* `identical_operands`: Identical Operands
* `implicitly_unwrapped_optional`: Implicitly Unwrapped Optional
* `joined_default_parameter`: Joined Default Parameter
* `last_where`: Last Where
* `legacy_multiple`: Legacy Multiple
* `legacy_objc_type`: Legacy Objective-C Reference Type
* `local_doc_comment`: Local Doc Comment
* `lower_acl_than_parent`: Lower ACL than parent
* `multiline_arguments_brackets`: Multiline Arguments Brackets
* `multiline_parameters`: Multiline Parameters
* `no_extension_access_modifier`: No Extension Access Modifier
* `no_magic_numbers`: No Magic Numbers
* `nslocalizedstring_key`: NSLocalizedString Key
* `nslocalizedstring_require_bundle`: NSLocalizedString Require Bundle
* `number_separator`: Number Separator
* `object_literal`: Object Literal
* `operator_usage_whitespace`: Operator Usage Whitespace
* `optional_enum_case_matching`: Optional Enum Case Match
* `overridden_super_call`: Overridden methods call super
* `override_in_extension`: Override in Extension
* `pattern_matching_keywords`: Pattern Matching Keywords
* `prefer_nimble`: Prefer Nimble
* `prefer_self_in_static_references`: Prefer Self in Static References
* `prefer_self_type_over_type_of_self`: Prefer Self Type Over Type of Self
* `prefer_zero_over_explicit_init`: Prefer Zero Over Explicit Init
* `prefixed_toplevel_constant`: Prefixed Top-Level Constant
* `private_action`: Private Actions
* `private_outlet`: Private Outlets
* `private_subject`: Private Combine Subject
* `prohibited_interface_builder`: Prohibited Interface Builder
* `prohibited_super_call`: Prohibited calls to super
* `quick_discouraged_focused_test`: Quick Discouraged Focused Test
* `quick_discouraged_pending_test`: Quick Discouraged Pending Test
* `raw_value_for_camel_cased_codable_enum`: Raw Value For Camel Cased Codable Enum
* `reduce_into`: Reduce Into
* `redundant_nil_coalescing`: Redundant Nil Coalescing
* `required_deinit`: Required Deinit
* `required_enum_case`: Required Enum Case
* `return_value_from_void_function`: Return Value from Void Function
* `self_binding`: Self Binding
* `shorthand_optional_binding`: Shorthand Optional Binding
* `single_test_class`: Single Test Class
* `sorted_first_last`: Min or Max over Sorted First or Last
* `static_operator`: Static Operator
* `strict_fileprivate`: Strict fileprivate
* `strong_iboutlet`: Strong IBOutlet
* `switch_case_on_newline`: Switch Case on Newline
* `test_case_accessibility`: Test case accessibility
* `toggle_bool`: Toggle Bool
* `unavailable_function`: Unavailable Function
* `unneeded_parentheses_in_closure_argument`: Unneeded Parentheses in Closure Argument
* `unowned_variable_capture`: Unowned Variable Capture
* `untyped_error_in_catch`: Untyped Error in Catch
* `weak_delegate`: Weak Delegate
* `xct_specific_matcher`: XCTest Specific Matcher
* `yoda_condition`: Yoda condition rule
