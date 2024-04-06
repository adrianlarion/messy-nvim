-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { "nvim-neotest/nvim-nio" }
	use { "christoomey/vim-tmux-navigator" }
	--Fzf
	use {
		'nvim-telescope/telescope.nvim', -- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	--Color Scheme
	use "EdenEast/nightfox.nvim" -- Packer
	use "NLKNguyen/papercolor-theme"
	use "romainl/Apprentice"
	use {
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	}
	use { "ellisonleao/gruvbox.nvim" }

	--Completion
	use { 'neoclide/coc.nvim', branch = 'release' }

	--Other
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('mbbill/undotree')

	-- nvim dap, for go debugging
	use('mfussenegger/nvim-dap')
	use('leoluz/nvim-dap-go')
	use('rcarriga/nvim-dap-ui')
	use {
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	}


	--FromVim
	-----------------------------------------------------------------------------------
	--

	-- Which key
	use 'folke/which-key.nvim'

	-- Lightline
	use 'itchyny/lightline.vim'

	--TimPope
	use 'tpope/vim-commentary'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-surround'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-sleuth'


	--NerdTree
	use 'preservim/nerdtree'
	use 'Xuyuanp/nerdtree-git-plugin'
	use 'ryanoasis/vim-devicons'
	use 'yegappan/taglist'

	-- "git gutter
	use 'airblade/vim-gitgutter'

	-- " colored brackets
	use 'frazrepo/vim-rainbow'

	-- " Ack
	use 'mileszs/ack.vim'

	use 'easymotion/vim-easymotion'

	-- "display marks
	use 'kshenoy/vim-signature'

	-- " startify
	use 'mhinz/vim-startify'

	-- " async search
	use 'dyng/ctrlsf.vim'

	-- Zen mode
	use("folke/zen-mode.nvim")

	-- use    {
	--   -- Theme inspired by Atom
	--   'navarasu/onedark.nvim',
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme 'onedark'
	--   end,
	-- }

	-- adds indentation lines
	use {
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
	}


	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	
	use {
		"vrischmann/tree-sitter-templ",
		require('nvim-treesitter.configs').setup {
			highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
		}
		

	}
end)
