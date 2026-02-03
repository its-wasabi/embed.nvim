" IMPORTANT: All of the code below is AI generated, be aware (vim script sucks)

if exists("b:sobsob_python_syntax")
  finish
endif
let b:sobsob_python_syntax = 1

" Load system Python syntax first
if filereadable($VIMRUNTIME . '/syntax/python.vim')
  execute 'source ' . $VIMRUNTIME . '/syntax/python.vim'
endif

" Include SQL syntax
if filereadable($VIMRUNTIME . '/syntax/sql.vim')
  unlet! b:current_syntax
  syntax include @SQL $VIMRUNTIME/syntax/sql.vim
endif

" SQL in triple-quoted strings (""")
" Match SELECT statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(SELECT\|select\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(SELECT\|select\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match INSERT statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(INSERT\|insert\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(INSERT\|insert\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match UPDATE statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(UPDATE\|update\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(UPDATE\|update\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match DELETE statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(DELETE\|delete\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(DELETE\|delete\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match CREATE statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(CREATE\|create\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(CREATE\|create\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match DROP statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(DROP\|drop\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(DROP\|drop\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match ALTER statements
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(ALTER\|alter\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(ALTER\|alter\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" Match WITH statements (CTEs)
syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+"""\s*\(WITH\|with\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLString
  \ matchgroup=pythonTripleQuotes
  \ start=+'''\s*\(WITH\|with\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

" SQL in regular strings (single line)
syntax region pythonSQLString
  \ matchgroup=pythonQuotes
  \ start=+"\s*\(SELECT\|INSERT\|UPDATE\|DELETE\)+
  \ end=+"+
  \ oneline
  \ contains=@SQL

syntax region pythonSQLString
  \ matchgroup=pythonQuotes
  \ start=+'\s*\(SELECT\|INSERT\|UPDATE\|DELETE\)+
  \ end=+'+
  \ oneline
  \ contains=@SQL

" Raw strings with SQL
syntax region pythonSQLRawString
  \ matchgroup=pythonQuotes
  \ start=+r"""\s*\(SELECT\|INSERT\|UPDATE\|DELETE\)+
  \ end=+"""+
  \ contains=@SQL
  \ keepend

syntax region pythonSQLRawString
  \ matchgroup=pythonQuotes
  \ start=+r'''\s*\(SELECT\|INSERT\|UPDATE\|DELETE\)+
  \ end=+'''+
  \ contains=@SQL
  \ keepend

let b:current_syntax = "python"
