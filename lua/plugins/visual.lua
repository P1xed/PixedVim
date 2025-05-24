return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				rensure_isinstall = { "lua", "cpp", "markdown", "markdown_inline" ,"yaml"},
				auto_install = true,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = {
			options = {
				icons_enable = true,
				theme = "auto",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extension = { "nvim-tree" },
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-web-devicons",
		},
		opts = {},
		event = "VeryLazy",
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		opts = {},
	},
}
