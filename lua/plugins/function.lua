return {
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {},
        config = function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup({
                check_ts = true,
            })
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        opts = {
            disable_netrw = true,
            hijack_netrw = true,
        },
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&"
                    .. "cmake --build build --config Release &&"
                    .. "cmake --install build --prefix build",
            },
        },
        event = "VeryLazy",
        opts = {
            defaults = {
                border = false,
                borderchars = nil,
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("fzf")
        end,
    },

    {
        "MagicDuck/grug-far.nvim",
        event = "VeryLazy",
        opts = {},
    },

    {

        "kylechui/nvim-surround",
        event = "VeryLazy",
    },
}
