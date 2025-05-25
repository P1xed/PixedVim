return {
    {
        "sainnhe/everforest",
        --dependencies = {},
        --event = "VeryLazy",
        opts = {},
        --keys = {},
        --lazy = false,
        config = function() --opts
            --require("everforest").setup(opts)
            vim.cmd("colorscheme everforest")
        end,
    },
    { "catppuccin/nvim" },
    { "olimorris/onedarkpro.nvim" },
    { "sainnhe/gruvbox-material" },
}
