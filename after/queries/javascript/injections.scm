; extends

; comment marker in declarations and foos (any)
(
  (comment) @injection.language
  . (_ (string_fragment) @injection.content)
  (#set! injection.combined)
  (#gsub! @injection.language "^%s*/%*%s*(.-)%s*%*/%s*$" "%1")
)
