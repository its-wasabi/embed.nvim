;; extends

; (call_expression
;   function: (non_null_expression
;     (instantiation_expression
;       (await_expression
;         (identifier) @_name)))
;   arguments: (template_string) @injection.content
;   (#eq? @_name "sql")
;   (#set! injection.language "sql")
;   (#set! injection.include-children))
;
; ;; Handle simpler variants like sql`...` and await sql`...`
; (call_expression
;   function: [
;     (identifier) @_name
;     (await_expression (identifier) @_name)
;     (instantiation_expression function: (identifier) @_name)
;   ]
;   arguments: (template_string) @injection.content
;   (#eq? @_name "sql")
;   (#set! injection.language "sql")
;   (#set! injection.include-children))
;
; ;; Support tx`...` and tx<User>`...`
; (call_expression
;   function: (non_null_expression
;     (instantiation_expression
;       (await_expression
;         (identifier) @_name)))
;   arguments: (template_string) @injection.content
;   (#eq? @_name "tx")
;   (#set! injection.language "sql")
;   (#set! injection.include-children))
;
; ;; Handle simpler variants for tx as well
; (call_expression
;   function: [
;     (identifier) @_name
;     (await_expression (identifier) @_name)
;     (instantiation_expression function: (identifier) @_name)
;   ]
;   arguments: (template_string) @injection.content
;   (#eq? @_name "tx")
;   (#set! injection.language "sql")
;   (#set! injection.include-children))


; (variable_declarator
;   (comment) @injection.language (#offset! @injection.language 0 3 0 -3)
;   (template_string) @injection.content (#offset! @injection.content 0 1 0 -1)
;   )
;
; ; foo(/* html */ `<span>`)
; ; foo(/* sql */ `SELECT * FROM foo`)
; (call_expression
;   arguments: [
;               (arguments
;                 (comment) @injection.language (#offset! @injection.language 0 3 0 -3)
;                 (template_string) @injection.content (#offset! @injection.content 0 1 0 -1)
;                 )
;               ]
;   )

;; Extend built-in injections
(call_expression
  function: (non_null_expression
    (instantiation_expression
      (await_expression
        (identifier) @_name)))
  arguments: (template_string) @injection.content
  (#eq? @_name "sql")
  (#set! injection.language "sql")
  (#set! injection.include-children))

;; Handle simpler variants like sql`...` and await sql`...`
(call_expression
  function: [
    (identifier) @_name
    (await_expression (identifier) @_name)
    (instantiation_expression function: (identifier) @_name)
  ]
  arguments: (template_string) @injection.content
  (#eq? @_name "sql")
  (#set! injection.language "sql")
  (#set! injection.include-children))

;; Support tx`...` and tx<User>`...`
(call_expression
  function: (non_null_expression
    (instantiation_expression
      (await_expression
        (identifier) @_name)))
  arguments: (template_string) @injection.content
  (#eq? @_name "tx")
  (#set! injection.language "sql")
  (#set! injection.include-children))

;; Handle simpler variants for tx as well
(call_expression
  function: [
    (identifier) @_name
    (await_expression (identifier) @_name)
    (instantiation_expression function: (identifier) @_name)
  ]
  arguments: (template_string) @injection.content
  (#eq? @_name "tx")
  (#set! injection.language "sql")
  (#set! injection.include-children))    
