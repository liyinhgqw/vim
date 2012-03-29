" Setting
set sw=2

" OmniCppComplete initialization
call omni#cpp#complete#Init()

" Mapping for cpp file
nnoremap <buffer> <Leader>cr :cs kill 0<cr>:cs add cscope.out<cr>
nnoremap <buffer> <Leader><space> :make<cr>
