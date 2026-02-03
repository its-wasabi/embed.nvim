;; extends

; TODO: Write similar queries for other languages

;; SQL via comment marker
((comment) @_comment
 (string
   (string_fragment) @injection.content) 
 (#lua-match? @_comment "sql")
 (#set! injection.language "sql"))

((comment) @_comment
  (template_string
    (string_fragment) @injection.content)
  (#lua-match? @_comment "sql")
  (#set! injection.language "sql"))

;; LUA via comment marker
((comment) @_comment
 (string
   (string_fragment) @injection.content) 
 (#lua-match? @_comment "lua")
 (#set! injection.language "lua"))

((comment) @_comment
  (template_string
    (string_fragment) @injection.content)
  (#lua-match? @_comment "lua")
  (#set! injection.language "lua"))

;; GraphQL via comment marker
((comment) @_comment
 (string
   (string_fragment) @injection.content) 
 (#lua-match? @_comment "graphql")
 (#set! injection.language "graphql"))

((comment) @_comment
  (template_string
    (string_fragment) @injection.content)
  (#lua-match? @_comment "graphql")
  (#set! injection.language "graphql"))
