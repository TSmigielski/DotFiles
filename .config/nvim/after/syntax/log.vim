" 12:34:56.789
syn match LogTime display '\<\\d\d:\d\d:\d\d.\d\{2,6}\>'
hi LogTime guifg=#ffb827

" C# exception stack trace
syn match StackTraceHlHl display '\<at \w\+\>'
hi StackTraceHlHl guifg=#6dd38c

" Log level custom colors
syn keyword logLvDebug DBG
syn keyword logLvFatal FTL
syn keyword logLvInfo INF
syn keyword logLvVerbose VRB
syn keyword logLvWarning WRN

hi link logLvDebug CustomLogDebug
hi link logLvError CustomLogError
hi link logLvFatal CustomLogFatal
hi link logLvVerbose CustomLogVerbose
hi link logLvWarning CustomLogWarning

hi CustomLogDebug guifg=#bc69c1
hi CustomLogError guifg=#f44747
hi CustomLogFatal guifg=#f44747 gui=bold
hi CustomLogVerbose guifg=#69cabc
hi CustomLogWarning guifg=#e0e646
