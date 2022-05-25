"  .oooooooo  .ooooo.  oooo    ooo  .ooooo.  
" 888' `88b  d88' `88b  `88.  .8'  d88' `88b 
" 888   888  888   888   `88..8'   888   888 
" `88bod8P'  888   888    `888'    888   888 
" `8oooooo.  `Y8bod8P'     .8'     `Y8bod8P' 
" d"     YD            .o..P'                
" "Y88888P'            `Y8P'                 


let g:goyo_width=120

function! s:goyo_enter()

  set textwidth=100
  set linebreak
  "set spell spelllang=ens

  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif

  set noshowmode
  set noshowcmd
  set scrolloff=999


endfunction



function! s:goyo_leave()

  set nolinebreak
  
  "set nospell

  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  
  set textwidth=0
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  set number
  set relativenumber

endfunction



autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
