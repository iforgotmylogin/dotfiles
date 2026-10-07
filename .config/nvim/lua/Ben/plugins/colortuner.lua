return {
    "zefei/vim-colortuner",
    init = function()
        vim.g.colortuner_filepath = vim.fn.stdpath("config") .. "/colortuner"
    end,
}
