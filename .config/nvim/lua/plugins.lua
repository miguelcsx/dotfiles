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

    -- Buffer Line
    use {
    'akinsho/bufferline.nvim',          -- Buffers
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- Icons
    }
    use 'tiagovla/scope.nvim'       -- Tabs

    -- UI
    use { 'mhinz/vim-startify' }            -- Start screen
    use { 'danilamihailov/beacon.nvim' }    -- Cursor Jump

    -- Colorschemes
    use { 'catppuccin/nvim', as = 'catppuccin' }    -- Catppuccin colorscheme
    -- use { 'mofiqul/dracula.nvim' }                  -- Dracula colorscheme
    -- use { 'ellisonleao/gruvbox.nvim' }              -- Gruvbox colorscheme
    use { 'rafamadriz/neon' }                       -- Neon colorscheme
    -- use { 'edeneast/nightfox.nvim' }                -- Nightfox colorscheme
    use { 'navarasu/onedark.nvim' }                 -- Onedark colorscheme


    -- Dev
    use { 'lewis6991/impatient.nvim' }              -- Auto-load plugins faster
    use {'windwp/nvim-autopairs' }                  -- Auto-pair
    use {
        'nvim-telescope/telescope.nvim',            -- Fuzzy Finder
        requires = { {'nvim-lua/plenary.nvim'} }    -- Functions
    }
    use { 'lewis6991/gitsigns.nvim' }               -- Git Buffers
    use { 'junegunn/gv.vim' }                       -- Git Commit History
    use { 'tpope/vim-fugitive' }                    -- Git Integration
    use { 'yggdroot/indentline' }                   -- Identation
    use { 'tpope/vim-surround' }                    -- Surrounding
    use { 'majutsushi/tagbar' }                     -- Tagbar


    -- Language Server
    use { 'neovim/nvim-lspconfig' }                 -- Lsp Server
    use { 'jose-elias-alvarez/null-ls.nvim' }       -- Lint and Formater
    use { 'williamboman/mason.nvim' }               -- Package Manager
    use { 'williamboman/mason-lspconfig.nvim' }     -- Package Manager & Lsp Integration
    use {
        'nvim-treesitter/nvim-treesitter',          -- Syntax-highlight
        run = function() require('nvim-treesitter.install').update({ with_sync = true })
        end }


    -- Completion
    use { 'hrsh7th/nvim-cmp' }          -- Completion
    use { 'hrsh7th/cmp-buffer' }        -- Buffer Completion
    use { 'hrsh7th/cmp-nvim-lsp' }      -- Neovim Integration
    use { 'hrsh7th/cmp-path' }          -- Path Completion

    -- Snips
    use { 'l3mon4d3/luasnip' }              -- Snnipet Engine
    use { 'saadparwaiz1/cmp_luasnip' }      -- Snnipet Completion
    use { 'rafamadriz/friendly-snippets' }  -- Snnipets to use

    -- Tmux
    use { "alexghergh/nvim-tmux-navigation" }



    if install_plugins then
        require('packer').sync()
    end
end)
