com! -nargs=1 -complete=dir DeployEclimd call s:DeployEclimd(<f-args>)

function! s:DeployEclimd(eclipsePath)
    let l:eclim_d = '/tmp/eclim'
    let l:eclipse_d = resolve(getcwd() . '/' . a:eclipsePath)
    let l:vim_d = resolve($HOME . '/.vim/bundle/vim-eclim')

    if ! filereadable(l:eclipse_d . '/eclipse.ini')
        echom 'Eclipse path invalid.'
        return
    endif

    let l:cmd_fmt = "silent !git clone https://github.com/ervandew/eclim.git %s -b 2.4.0 && "
                \ . "cd %s && ant -Dvim.files=%s -Declipse.home=%s && "
                \ . "cd - && rm -rf %s"
    let l:cmd = printf(l:cmd_fmt, l:eclim_d, l:eclim_d, l:vim_d, l:eclipse_d, l:eclim_d)
    execute l:cmd
endfunction
