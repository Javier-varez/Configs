require('javier_varez.utils')

nvim_create_autogroups {
    JavierAlvarez = {
        { 'BufRead,BufNewFile', '*', ':set undofile' },
        { 'BufRead,BufNewFile', '*', ':set expandtab' },
        { 'BufRead,BufNewFile', '*', ':set tabstop=4' },
        { 'BufRead,BufNewFile', '*', ':set shiftwidth=4' },
        { 'BufRead,BufNewFile', '*.cpp,*.c,*.hpp,*.h', ':set expandtab' },
        { 'BufRead,BufNewFile', '*.cpp,*.c,*.hpp,*.h', ':set tabstop=2' },
        { 'BufRead,BufNewFile', '*.cpp,*.c,*.hpp,*.h', ':set shiftwidth=2' },
        { 'BufRead,BufNewFile', '*.go', ':set noexpandtab' },
        { 'BufRead,BufNewFile', '*.go', ':set tabstop=4' },
        { 'BufRead,BufNewFile', '*.go', ':set shiftwidth=4' },
        { 'BufRead,BufNewFile', 'COMMIT_EDITMSG', ':set colorcolumn=50,72' },
    }
}
