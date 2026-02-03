;; JavaScript in script tags
((script_element
  (start_tag
    (tag_name) @_tag)
  (raw_text) @injection.content)
 (#eq? @_tag "script")
 (#set! injection.language "javascript"))

;; JavaScript in script tags with type
((script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (quoted_attribute_value (attribute_value) @_type)))
  (raw_text) @injection.content)
 (#eq? @_attr "type")
 (#any-of? @_type "text/javascript" "application/javascript" "module")
 (#set! injection.language "javascript"))

;; CSS in style tags
((style_element
  (start_tag
    (tag_name) @_tag)
  (raw_text) @injection.content)
 (#eq? @_tag "style")
 (#set! injection.language "css"))

;; Inline JavaScript in event handlers
((attribute
  (attribute_name) @_attr
  (quoted_attribute_value (attribute_value) @injection.content))
 (#lua-match? @_attr "^on")
 (#set! injection.language "javascript"))
