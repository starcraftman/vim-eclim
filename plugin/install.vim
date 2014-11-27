com! -nargs=1 -complete=dir DeployEclimd call s:deploy_eclimd(<f-args>)

function! s:deploy_eclimd(eclipsePath)
    let l:eclim_d = '/tmp/eclim'
    let l:eclipse_d = resolve(getcwd() . '/' . a:eclipsePath)
    let l:vim_d = resolve($HOME . '/.vim/bundle/vim-eclim')

    if ! filereadable(l:eclipse_d . '/eclipse.ini')
        echom 'Eclipse path invalid.'
        return
    endif

    execute 'silent !git clone https://github.com/ervandew/eclim.git ' . l:eclim_d
    cd l:eclim_d
    let l:last_tag = split(system('git tag'), '\n')[-1]
    execute 'silent !git checkout ' . l:last_tag
    execute 'silent !ant -Dvim.files=' . l:vim_d '-Declipse.home=' . l:eclipse_d
    cd -
    "execute 'rm -rf ' . l:eclim_d
endfunction
