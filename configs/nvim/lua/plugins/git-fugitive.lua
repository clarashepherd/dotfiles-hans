return {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
        "G",
        "Git",
        "Gdiffsplit",
        "Gread",
        "Gwrite",
        "Gclog",
        "GBrowse",
    },
    keys = {
        { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
    },
}
