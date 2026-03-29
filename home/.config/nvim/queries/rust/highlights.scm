;  ____  _   _ ____ _____
; |  _ \| | | / ___|_   _|
; | |_) | | | \___ \ | |
; |  _ <| |_| |___) || |
; |_| \_\\___/|____/ |_|
;
; Queries for tree-sitter highlighting.
; Intended to be used with tree-sitter-rust

; Keywords
[
    "as"
    "break"
    "dyn"
    "else"
    "enum"
    "fn"
    "for"
    "if"
    "impl"
    "in"
    "let"
    "loop"
    "match"
    "mod"
    "pub"
    "use"
    "static"
    "struct"
    "trait"
    "type"
    "while"
    (self)
    (mutable_specifier)
] @keyword

; Punctuations
[
    "{"
    "}"
    "["
    "]"
    "("
    ")"
] @punctuation.bracket

[
    ";"
    ":"
    ","
    "..="
] @punctuation.delimiter

; Operators
[
    "+"
    "-"
    "*"
    "/"
    "%"
    "!"
    "&"
    "|"
    "."
    "::"
    "="
    "+="
    "-="
    "<"
    ">"
    "=="
    "!="
    "<="
    ">="
    "&&"
    "||"
] @operator

; Comments
[
    (block_comment)
    (line_comment)
] @comment

; General
[
    "false"
    "true"
] @constant
(char_literal) @constant
(integer_literal) @number
(lifetime
    (identifier) @attribute)

; Strings
(string_literal) @string
(string_literal
    (escape_sequence) @string.escape)

; Symbols
((identifier) @variable
    (#set! priority 99))
(function_item
    name: (identifier) @function)
(call_expression function: (identifier) @function)
(field_identifier) @property
(macro_invocation
    macro: (identifier) @function.macro)

; Type
(type_identifier) @type
(primitive_type) @type.builtin
((identifier) @_id
    (#eq? @_id "f32")) @type.builtin
