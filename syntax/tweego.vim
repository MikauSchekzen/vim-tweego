" Vim syntax file
" Language: Tweego + Sugarcube 2
" Maintainer: Freya Duffy
" Latest Revision: 23 September 2017

" NOTE: there's probably a lot of stuff missing (mostly macro names)
" for now im just tryin to get stuff in that i've been using myself

if exists("b:current_syntax")
    finish
endif

" tweego syntax stuff
syn keyword tgKeyword if not else set to print textbox radiobutton contained
syn keyword tgBool true false contained

syn region tgMacro start="<<" end=">>" contains=tgKeyword,tgVariable,tgString,tgBool,tgNumber
syn region tgLink start="\[\[" end="\]\]" contains=tgLinkedPassage,tgVariable keepend
syn region tgComment start="<!--" end="-->"

syn match tgPassage "^::.*$" contains=tgPassageTitle,tgTag
syn match tgVariable "[$_]\w*"
syn match tgString "\(["']\).*\1" contained
syn match tgNumber "\d\+" contained

" matching passage names in titles and links
" ::x
syn match tgPassageTitle "::\zs[^|<>:\[\]]*" contained
" [[x]]
syn match tgLinkedPassage "\[\[\zs[^|<>]*\ze\]\]" contained
" [[y|x]]
syn match tgLinkedPassage "|\zs[^|<>]*\ze\]\]" contained
" [[y->x]]
syn match tgLinkedPassage "->\zs[^|<>]*\ze\]\]" contained
" [[x<-y]]
syn match tgLinkedPassage "\[\[\zs[^|<>]*\ze<-" contained

" passage tags
syn match tgTag "\[\zs.*\ze\]" contained

" some markdown
syn region mdItalic start="//" end="//"
syn region mdBold start="''" end="''"
syn region mdUnderline start="__" end="__"

hi def link tgKeyword Keyword
hi def link tgVariable Identifier
hi def link tgString String
hi def link tgBool Boolean
hi def link tgNumber Number
hi def link tgLinkedPassage StorageClass
hi def link tgPassageTitle StorageClass
hi def link tgComment Comment
hi def link tgTag Function

hi def mdItalic term=italic cterm=italic
hi def mdBold term=bold cterm=bold
hi def mdUnderline term=underline cterm=underline

let b:current_syntax = "tweego"
