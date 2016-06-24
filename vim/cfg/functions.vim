"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str) "{{{
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction
"-----------------------}}}


function! VisualSelection(direction, extra_filter) range "{{{
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"---------------------------------------------------------}}}

function! HasPaste() "{{{
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
"---------------------}}}

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt() "{{{
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
        if buflisted(l:currentBufNum)
            execute("bdelete! ".l:currentBufNum)
        endif
    endif
endfunction
"---------------------------------}}}

function! AirlineInit() "{{{
	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
	let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
	let g:airline_section_c = airline#section#create(['filetype'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
"------------------------}}}

" xclip
command! -range=% -nargs=0 Clip :<line1>,<line2>w !Clip
