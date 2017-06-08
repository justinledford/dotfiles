" Show an error in statusline if current buffer
" has a mix of tabs and spaces
"
" Adopted from
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
"
" statusline should have the following:
"
" set statusline+=%#error#
" set statusline+=%{MixedIndentingWarning()}
" set statusline+=%*

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:mixed_indenting_warning

"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! MixedIndentingWarning()
    if !exists("b:mixed_indenting_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:mixed_indenting_warning =  '[mixed-indenting]'
        else
            let b:mixed_indenting_warning = ''
        endif
    endif
    return b:mixed_indenting_warning
endfunction
