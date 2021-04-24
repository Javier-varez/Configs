
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'vim-syntastic/syntastic'
    use 'rust-lang/rust.vim'
    use 'itchyny/lightline.vim'
    use 'machakann/vim-highlightedyank'
    use 'airblade/vim-rooter'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'morhetz/gruvbox'
    use 'mbbill/undotree'
    use 'airblade/vim-gitgutter'
    use 'easymotion/vim-easymotion'
    use 'rhysd/vim-clang-format'
    use 'preservim/nerdtree'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'
    use 'tpope/vim-fugitive'
    use 'mklabs/vim-cowsay'
    use 'alfredodeza/pytest.vim'
    use 'mhinz/vim-startify'
    use 'tpope/vim-surround'
    use 'javier-varez/neomoji.nvim'
    use 'cappyzawa/trim.nvim'
    use 'dbeniamine/cheat.sh-vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require('trim').setup({
    disable = { "markdown" },
})

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}
