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
syn keyword tgVariableKeyword capture set unset remember forget contained
syn keyword tgScriptingKeyword run script contained
syn keyword tgDisplayKeyword include nobr print silently contained
syn keyword tgControlKeyword if for switch not else elseif contained
syn keyword tgInteractiveKeyword button checkbox link linkappend linkprepend linkreplace radiobutton textarea textbox contained
syn keyword tgLinkKeyword actions back return choice contained
syn keyword tgDOMKeyword addclass append copy prepend remove removeclass replace toggleclass contained
syn keyword tgAudioKeyword audio cacheaudio createaudiogroup createplaylist playlist masteraudio removeplaylist waitforaudio contained
syn keyword tgMiscKeyword goto repeat timed widget contained
" syn keyword tgKeyword if for switch not else capture set unset remember forget to print button checkbox link linkappend linkprepend linkreplace textbox radiobutton textarea contained run include nobr silently actions back return choice
syn keyword tgBool true false contained

syn region tgPrimaryMacro start="<<" end=">>" contains=tgVariableKeyword,tgScriptingKeyword,tgDisplayKeyword,tgVariable,tgString,tgBool,tgNumber
syn region tgSecondaryMacro start="<<" end=">>" contains=tgLinkKeyword,tgDOMKeyword,tgAudioKeyword,tgMiscKeyword,tgVariable,tgString,tgBool,tgNumber
syn region tgInteractiveMacro start="<<" end=">>" contains=tgInteractiveKeyword,tgVariable,tgString,tgBool,tgNumber
syn region tgControlMacro start="<<" end=">>" contains=tgControlKeyword,tgVariable,tgString,tgBool,tgNumber

syn region tgLink start="\[\[" end="\]\]" contains=tgLinkedPassage,tgVariable keepend
syn region tgComment start="<!--" end="-->"

syn match tgPassage "^::.*$" contains=tgPassageTitle,tgTag
syn match tgVariable "^[$_]\w*" contained
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

" Passage region
syn region tgPassageRegion start="::" end=/[\n\r]\:\:/ fold transparent

" some markdown
syn region mdItalic start="//" end="//"
syn region mdBold start="''" end="''"
syn region mdUnderline start="__" end="__"

hi def link tgVariableKeyword Keyword
hi def link tgScriptingKeyword Keyword
hi def link tgDisplayKeyword Keyword
hi def link tgControlKeyword Keyword
hi def link tgInteractiveKeyword Keyword
hi def link tgLinkKeyword Keyword
hi def link tgDOMKeyword Keyword
hi def link tgAudioKeyword Keyword
hi def link tgMiscKeyword Keyword
hi def link tgControlMacro Keyword
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
