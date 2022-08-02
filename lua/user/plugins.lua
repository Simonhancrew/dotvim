local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--[[

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]--)
--]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require('packer').startup(function(use)
	-- My plugins here
	use 'wbthomason/packer.nvim' -- use packer to manager itself
  

	-- starup time optimise
	use 'dstein64/vim-startuptime'
	use 'lewis6991/impatient.nvim'
	use 'nathom/filetype.nvim'

	use 'moll/vim-bbye' -- for more sensible delete buffer cmd

	-- used by others 
	use 'nvim-lua/plenary.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- multiple window
	use 'akinsho/toggleterm.nvim'


	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	-- buffer line 
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
  
	-- theme
	use 'sainnhe/sonokai'
	use 'tiagovla/tokyodark.nvim'
	use "rebelot/kanagawa.nvim"
	use 'NLKNguyen/papercolor-theme'
	use 'liuchengxu/space-vim-dark'
  
	-- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
  
	-- cmp plugins
 	use 'hrsh7th/nvim-cmp' -- completion plugins 
	use 'hrsh7th/cmp-nvim-lsp' 
	use 'hrsh7th/cmp-buffer'-- buffer completion
	use 'hrsh7th/cmp-path'  -- path completion 
	use 'hrsh7th/cmp-cmdline'  
	use 'saadparwaiz1/cmp_luasnip' -- snippet completions

	-- snippets
	use 'L3MON4D3/LuaSnip' -- snippet engine
	use 'rafamadriz/friendly-snippets'  -- a bunch of snippets to use

	-- LSP
	use 'neovim/nvim-lspconfig' -- enable LSP
	use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
	use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

	-- file telescope 
	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}
  
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		tag = 'release',
	}

	-- indent guide 
	use "lukas-reineke/indent-blankline.nvim"

	-- startup screen
	use 'leslie255/aleph-nvim'

	-- comment smart 
	use 'numToStr/Comment.nvim'

	-- auto pair
	use 'windwp/nvim-autopairs'

	-- project 
	use 'ahmedkhalf/project.nvim'

	-- start up page 
	use 'goolord/alpha-nvim'

	-- better keybinding
	use "folke/which-key.nvim"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
