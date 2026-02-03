" IMPORTANT: All of the code below is AI generated, be aware (vim script sucks)

" Prevent infinite recursion
if exists("b:current_syntax_html_loaded")
  finish
endif
let b:current_syntax_html_loaded = 1

" Only run if treesitter is not active
if exists('g:loaded_nvim_treesitter') && luaeval("vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil")
  finish
endif

" Load the default runtime HTML syntax
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Source the system HTML syntax file (not our own)
" Use $VIMRUNTIME to get the built-in syntax file
if filereadable($VIMRUNTIME . '/syntax/html.vim')
  unlet! b:current_syntax
  execute 'source ' . $VIMRUNTIME . '/syntax/html.vim'
endif

" Now enhance it with JavaScript support
" JavaScript syntax
if !exists("main_syntax")
  let main_syntax = 'html'
endif

" Include JavaScript syntax for embedding
syntax include @htmlJavaScript $VIMRUNTIME/syntax/javascript.vim
unlet! b:current_syntax

" Enhanced script block
syntax region htmlScriptBlock
  \ start=+<script[^>]*>+
  \ end=+</script>+
  \ keepend
  \ contains=htmlScriptTag,@htmlJavaScript

syntax region htmlScriptTag
  \ start=+<script+
  \ end=+>+
  \ contained
  \ contains=htmlTagName,htmlArg,htmlString

" Inline event handlers
syntax match htmlEventAttr
  \ "\<on\w\+\ze\s*="
  \ contained

syntax region htmlEventJS
  \ matchgroup=htmlString
  \ start=+\<on\w\+\s*=\s*[\"']+ 
  \ end=+[\"']+
  \ contains=@htmlJavaScript
  \ contained

" Add event attributes to tag arguments
syntax cluster htmlArgCluster add=htmlEventAttr,htmlEventJS

let b:current_syntax = "html"

if main_syntax == 'html'
  unlet main_syntax
endif
