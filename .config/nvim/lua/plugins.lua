-- lua/plugins.lua

require('packer').startup(function(use)
    
    -- Packages

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Status Line
    use {
        'nvim-lualine/lualine.nvim',    -- Status-line
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }   -- Icons
    }
    
    -- File-system navigation
    use {
        'kyazdani42/nvim-tree.lua',     -- Tree
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- Icons
    }

    -- UI
    use { 'mhinz/vim-startify' }            -- Start screen
    use { 'danilamihailov/beacon.nvim' }    -- Cursor Jump

    -- Colorschemes
    use { "catppuccin/nvim", as = "catppuccin" }    -- Catppuccin colorscheme
    -- use { 'Mofiqul/dracula.nvim' }                  -- Dracula colorscheme
    -- use { "ellisonleao/gruvbox.nvim" }              -- Gruvbox colorscheme
    use { 'rafamadriz/neon' }                       -- Neon colorscheme
    -- use { 'edeneast/nightfox.nvim' }                -- Nightfox colorscheme
    use { 'navarasu/onedark.nvim' }                 -- Onedark colorscheme



    -- Dev
    use { 'lewis6991/impatient.nvim' }              -- Auto-load plugins faster
    use {'windwp/nvim-autopairs' }                  -- Auto-pair
    use {
        'nvim-telescope/telescope.nvim',            -- Fuzzy Finder
         requires = { {'nvim-lua/plenary.nvim'} }   -- Functions
    }
    use { 'junegunn/gv.vim' }                       -- Git Commit History
    use { 'tpope/vim-fugitive' }                    -- Git Integration
    use { 'yggdroot/indentline' }                   -- Identation
    use { 'neovim/nvim-lspconfig' }
    use { 'tpope/vim-surround' }                    -- Surrounding
    use { 'majutsushi/tagbar' }                     -- Tagbar
    

    if install_plugins then
        require('packer').sync()
    end
end)
