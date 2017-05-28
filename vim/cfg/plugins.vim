""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='fullpath'


""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35


""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = {
    \ "type": "style"}

""""""""""""""""""""""""""""""
" => git gutter
""""""""""""""""""""""""""""""
let g:gitgutter_map_keys = 0
let gitgutter_enabled = 1

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme="bubblegum"
let g:airline_section_a = airline#section#create(['mode',' ','branch'])
let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
let g:airline_section_c = airline#section#create(['filetype'])
let g:airline_section_x = airline#section#create(['%P'])
let g:airline_section_y = airline#section#create(['%B'])
let g:airline_section_z = airline#section#create_right(['%l','%c'])
