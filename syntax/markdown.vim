" IMPORTANT: All of the code below is AI generated, be aware (vim script sucks)

if exists("b:sobsob_markdown_syntax")
  finish
endif
let b:sobsob_markdown_syntax = 1

" Headers
syntax match markdownH1 "^#\s.*$"
syntax match markdownH2 "^##\s.*$"
syntax match markdownH3 "^###\s.*$"
syntax match markdownH4 "^####\s.*$"
syntax match markdownH5 "^#####\s.*$"
syntax match markdownH6 "^######\s.*$"

" Emphasis
syntax region markdownBold start="\*\*" end="\*\*" oneline
syntax region markdownBold start="__" end="__" oneline
syntax region markdownItalic start="\*" end="\*" oneline
syntax region markdownItalic start="_" end="_" oneline
syntax region markdownBoldItalic start="\*\*\*" end="\*\*\*" oneline

" Code
syntax region markdownCode start="`" end="`" oneline
syntax region markdownCodeBlock start="```\w\+" end="```" keepend
syntax region markdownCodeBlockPlain start="```\s*$" end="```" keepend

" Links
syntax region markdownLink matchgroup=markdownLinkDelimiter start="\[" end="\]" contains=markdownUrl
syntax region markdownUrl matchgroup=markdownUrlDelimiter start="(" end=")" contained
syntax match markdownAutoLink "<\(https\?\|ftp\)://[^>]\+>"

" Images
syntax match markdownImage "!\[[^\]]*\]([^)]*)"

" Lists
syntax match markdownListMarker "^\s*[-*+]\s"
syntax match markdownOrderedListMarker "^\s*\d\+\.\s"

" Blockquotes
syntax match markdownBlockquote "^>.*$"

" Horizontal rules
syntax match markdownRule "^[*-_]\{3,}$"

" Inline HTML
syntax match markdownInlineHTML "<[^>]\+>"

" Task lists
syntax match markdownTaskMarker "^\s*[-*+]\s\+\[[x ]\]\s"

" Strikethrough
syntax region markdownStrikethrough start="\~\~" end="\~\~" oneline

" Language-specific code blocks (for legacy vim)
" JavaScript
unlet! b:current_syntax
syntax include @markdownJavaScript $VIMRUNTIME/syntax/javascript.vim
syntax region markdownJSBlock matchgroup=markdownCodeDelimiter 
  \ start="```\(javascript\|js\|jsx\)" end="```" 
  \ contains=@markdownJavaScript keepend

" Python
unlet! b:current_syntax
syntax include @markdownPython $VIMRUNTIME/syntax/python.vim
syntax region markdownPythonBlock matchgroup=markdownCodeDelimiter 
  \ start="```\(python\|py\)" end="```" 
  \ contains=@markdownPython keepend

" Rust
if filereadable($VIMRUNTIME . '/syntax/rust.vim')
  unlet! b:current_syntax
  syntax include @markdownRust $VIMRUNTIME/syntax/rust.vim
  syntax region markdownRustBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(rust\|rs\)" end="```" 
    \ contains=@markdownRust keepend
endif

" Elixir
if filereadable($VIMRUNTIME . '/syntax/elixir.vim')
  unlet! b:current_syntax
  syntax include @markdownElixir $VIMRUNTIME/syntax/elixir.vim
  syntax region markdownElixirBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(elixir\|ex\|exs\)" end="```" 
    \ contains=@markdownElixir keepend
endif

" Go
if filereadable($VIMRUNTIME . '/syntax/go.vim')
  unlet! b:current_syntax
  syntax include @markdownGo $VIMRUNTIME/syntax/go.vim
  syntax region markdownGoBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(go\|golang\)" end="```" 
    \ contains=@markdownGo keepend
endif

" C/C++
if filereadable($VIMRUNTIME . '/syntax/cpp.vim')
  unlet! b:current_syntax
  syntax include @markdownCpp $VIMRUNTIME/syntax/cpp.vim
  syntax region markdownCppBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(cpp\|c++\|cxx\)" end="```" 
    \ contains=@markdownCpp keepend
endif

" Lua
if filereadable($VIMRUNTIME . '/syntax/lua.vim')
  unlet! b:current_syntax
  syntax include @markdownLua $VIMRUNTIME/syntax/lua.vim
  syntax region markdownLuaBlock matchgroup=markdownCodeDelimiter 
    \ start="```lua" end="```" 
    \ contains=@markdownLua keepend
endif

" HTML
if filereadable($VIMRUNTIME . '/syntax/html.vim')
  unlet! b:current_syntax
  syntax include @markdownHTML $VIMRUNTIME/syntax/html.vim
  syntax region markdownHTMLBlock matchgroup=markdownCodeDelimiter 
    \ start="```html" end="```" 
    \ contains=@markdownHTML keepend
endif

" CSS
if filereadable($VIMRUNTIME . '/syntax/css.vim')
  unlet! b:current_syntax
  syntax include @markdownCSS $VIMRUNTIME/syntax/css.vim
  syntax region markdownCSSBlock matchgroup=markdownCodeDelimiter 
    \ start="```css" end="```" 
    \ contains=@markdownCSS keepend
endif

" JSON
if filereadable($VIMRUNTIME . '/syntax/json.vim')
  unlet! b:current_syntax
  syntax include @markdownJSON $VIMRUNTIME/syntax/json.vim
  syntax region markdownJSONBlock matchgroup=markdownCodeDelimiter 
    \ start="```json" end="```" 
    \ contains=@markdownJSON keepend
endif

" YAML
if filereadable($VIMRUNTIME . '/syntax/yaml.vim')
  unlet! b:current_syntax
  syntax include @markdownYAML $VIMRUNTIME/syntax/yaml.vim
  syntax region markdownYAMLBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(yaml\|yml\)" end="```" 
    \ contains=@markdownYAML keepend
endif

" Shell/Bash
if filereadable($VIMRUNTIME . '/syntax/sh.vim')
  unlet! b:current_syntax
  syntax include @markdownShell $VIMRUNTIME/syntax/sh.vim
  syntax region markdownShellBlock matchgroup=markdownCodeDelimiter 
    \ start="```\(bash\|sh\|shell\)" end="```" 
    \ contains=@markdownShell keepend
endif

let b:current_syntax = "markdown"
