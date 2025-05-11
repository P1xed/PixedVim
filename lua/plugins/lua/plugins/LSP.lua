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
                typefiles = {
                    "c",
                    "cc",
                    "cpp",
                    "c++",
                },
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "--background-index",
                    "--clang-tidy",
                    "--pretty",
                    "--enable-config",
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
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",
        opts = {
            keymap = { preset = "super-tab" },
            completion = { documentation = { auto_show = true } },
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
                    },
                },
            },
            fuzzy = { implementation = "lua" },
        },
        opts_extend = { "sources.default" },
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
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                rensure_isinstall = { "lua", "cpp" },
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
                keys = {
                    quit = "q",
                    toggle_or_open = "<Tab>",
                    exec = "<CR>",
                },
            },
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
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
    },
}
