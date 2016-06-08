" Plugins
" NERDTree
" CPP code completion http://vim.wikia.com/wiki/C%2B%2B_code_completion
execute pathogen#infect()
set nocompatible
syntax on

filetype plugin indent on
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set nolist
set listchars=tab:>-,trail:␠,nbsp:⎵

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on 

set tabstop=4
set shiftwidth=4
set expandtab
au BufWinLeave * mkview
au BufWinEnter * silent loadview
set number
highlight LineNr term=bold cterm=NONE ctermfg=Red ctermbg=Blue gui=NONE guifg=DarkGrey guibg=None

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
set nocp
filetype plugin on
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp_tags
set tags+=~/.vim/tags/sdl
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction



