
return require('packer').startup(function()
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
end)

