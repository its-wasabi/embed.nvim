;; extends

; TODO: Make that ignore sql string if it contains invalid sql syntax

; SQL injection for Python strings
; SELECT statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Ss][Ee][Ll][Ee][Cc][Tt]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; INSERT statements  
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Ii][Nn][Ss][Ee][Rr][Tt]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; UPDATE statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Uu][Pp][Dd][Aa][Tt][Ee]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; DELETE statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Dd][Ee][Ll][Ee][Tt][Ee]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; CREATE statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Cc][Rr][Ee][Aa][Tt][Ee]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; WITH statements (CTEs)
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Ww][Ii][Tt][Hh]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; ALTER statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Aa][Ll][Tt][Ee][Rr]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))
; DROP statements
((string
  (string_content) @injection.content)
 (#lua-match? @injection.content "^%s*[Dd][Rr][Oo][Pp]%s")
 (#set! injection.language "sql")
 (#set! injection.combined))


; TODO: Write similar queries for other languages and resolve depth of nodes issue

(
  (comment) @_comment
  (#lua-match? @_comment "lua")
  .
  (_
    (_
      (string
        (string_content) @injection.content) @s)
  (#set! injection.language "lua")
  (#set! injection.combined)
))

(
  (comment) @_comment
  (#lua-match? @_comment "lua")
  .
  (_
	(_
	  (_
        (string
          (string_content) @injection.content) @s)
  (#set! injection.language "lua")
  (#set! injection.combined)
)))
