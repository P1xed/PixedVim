return {

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"cmake",
				},
				automatic_installation = true,
			})
			require("lspconfig")["lua_ls"].setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			require("lspconfig")["clangd"].setup({
				cmd = {
					"clangd",
					"--header-insertion=never",
					"--background-index",
					"--clang-tidy",
					"--pretty",
					"--enable-config",
					"--function-arg-placeholders=0",
				},
			})
			require("lspconfig")["cmake"].setup({})
			vim.cmd("LspStart")
			vim.diagnostic.config({
				virtual_text = true,
				underline = false,
				signs = false,
			})
		end,
	},

	{
		"saghen/blink.cmp",
		dependencies = {
			"xzbdmw/colorful-menu.nvim",
			"onsails/lspkind.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		version = "1.*",
		opts = {
			signature = { enabled = true, window = { show_documentation = true } },
			keymap = { preset = "super-tab" },
			completion = {
				documentation = { auto_show = true },
				list = { selection = { preselect = false, auto_insert = true } },
				keyword = { range = "full" },
				trigger = { show_on_trigger_character = true, show_on_blocked_trigger_characters = { " ", "\n", "\t" } },
				menu = {
					draw = {
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			cmdline = {
				sources = function()
					local cmd_type = vim.fn.getcmdtype()
					if cmd_type == "/" then
						return { "buffer" }
					end
					if cmd_type == ":" then
						return { "cmdline" }
					end
				end,
				keymap = {
					preset = "super-tab",
				},
				completion = {
					menu = {
						auto_show = true,
						draw = {
							columns = {
								{ "label", "label_description", gap = 1 },
								{ "kind_icon", "kind" },
							},
						},
					},
				},
			},
			fuzzy = { implementation = "lua" },
		},
	},

	{
		"nvimtools/none-ls.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			ui = {
				border = "none",
				devicon = true,
			},
			code_action = {
				keys = {
					quit = "q",
					exec = "<CR>",
				},
			},
			lightbulb = {
				enable = false,
			},
			finder = {
				keys = {
					toggle_or_open = "<Tab>",
					toggle_or_jump = "<CR>",
				},
			},
			outline = {
				auto_preview = true,
				show_icon = true,
				keys = {
					quit = "q",
					toggle_or_jump = "<Tab>",
				},
			},
			symbol_in_winbar = { enable = false },
			terminal = {
				layout = "horizontal",
				enter_on_open = true,
				close_on_exit = true,
			},
		},
		config = function(_, opts)
			require("lspsaga").setup(opts)
		end,
		event = "VeryLazy",
	},
}
