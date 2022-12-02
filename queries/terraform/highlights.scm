; inherits: hcl

; { key: val }
;
; highlight identifier keys as though they were block attributes
(object_elem key: (expression (variable_expr (identifier) @field)))

((identifier) @keyword (#any-of? @keyword "module" "root" "cwd" "resource" "variable" "data" "locals" "terraform" "provider" "output"))
((identifier) @type.builtin (#any-of? @type.builtin "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))
(variable_expr (identifier) @variable.builtin (#any-of? @variable.builtin "var" "local" "path"))
(get_attr (identifier) @variable.builtin (#any-of? @variable.builtin  "root" "cwd" "module"))

(object_elem val: (expression
  (variable_expr
    (identifier) @type.builtin (#any-of? @type.builtin "bool" "string" "number" "object" "tuple" "list" "map" "set" "any"))))
