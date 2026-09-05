;   ____
;  / ___| _     _
; | |   _| |_ _| |_
; | |__|_   _|_   _|
;  \____||_|   |_|
;
; Queries for tree-sitter highlighting.
; Intended to be used with tree-sitter-cpp.

; Keywords
[
    "break"
    "case"
    "catch"
    "class"
    "const"
    "continue"
    "decltype"
    "default"
    "delete"
    "do"
    "else"
    "enum"
    "explicit"
    "for"
    "friend"
    "goto"
    "if"
    "mutable"
    "namespace"
    "new"
    "operator"
    "private"
    "protected"
    "public"
    "register"
    "return"
    "sizeof"
    "static"
    "struct"
    "switch"
    "template"
    "thread_local"
    "throw"
    "try"
    "typedef"
    "typename"
    "using"
    "virtual"
    "volatile"
    "while"
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

; General
(comment) @comment
(char_literal) @constant
(number_literal) @number

; Types
(primitive_type) @type.builtin
