return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter")

            -- install parsers (main branch: setup() no longer takes these options)
            treesitter.install({
                "json",
                "javascript",
                "typescript",
                "tsx",
                "go",
                "yaml",
                "html",
                "css",
                "python",
                "http",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "cpp",
                "glsl",
                "java",
                "rust",
                "ron",
            })
            -- force start treesitter for all filetypes
            vim.api.nvim_create_autocmd('FileType', {
                pattern = '*',
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
    -- NOTE: js,ts,jsx,tsx Auto Close Tags
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
        config = function()
            -- Independent nvim-ts-autotag setup
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,           -- Auto-close tags
                    enable_rename = true,          -- Auto-rename pairs
                    enable_close_on_slash = false, -- Disable auto-close on trailing `</`
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true, -- Disable auto-closing for HTML
                    },
                    ["typescriptreact"] = {
                        enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
                    },
                },
            })
        end,
    },
}
