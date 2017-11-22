 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => lightline
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:lightline = {
       \ 'colorscheme': 'Dracula',
       \ }

 let g:lightline = {
       \ 'colorscheme': 'Dracula',
       \ 'active': {
       \   'left': [ ['mode', 'paste'],
       \             ['fugitive', 'readonly', 'filename', 'modified'] ],
       \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]]
       \ },
       \ 'component': {
       \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
       \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
       \ },
       \ 'component_visible_condition': {
       \   'readonly': '(&filetype!="help"&& &readonly)',
       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
       \ },
       \ 'separator': { 'left': ' ', 'right': ' ' },
       \ 'subseparator': { 'left': ' ', 'right': ' ' }
       \ }
