return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved these local imports below back to lspconfig.lua due to mason deprecated handlers
        -- local lspconfig = require("lspconfig")
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
        -- local capabilities = cmp_nvim_lsp.default_capabilities()

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_enable = false,
            -- LSP servers for mason to install
            ensure_installed = {
                -- Web / scripting
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                "emmet_language_server",
                "angularls",
                "astro",
                "marksman",

                -- Systems / compiled
                "gopls",
                "rust_analyzer", -- fixed: was "rust-analyzer"
                "clangd",        -- C and C++

                -- JVM
                "jdtls",         -- fixed: was "JDTLS"

                -- Scripting
                "pyright",

                -- "eslint",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                -- Formatters
                "prettier",   -- JS/TS/HTML/CSS formatter
                "stylua",     -- Lua formatter
                "isort",      -- Python import sorter
                "black",      -- Python formatter
                "clang-format", -- C/C++/Java formatter

                -- Linters
                "pylint",     -- Python linter
                "cpplint",    -- C/C++ linter

                -- Other
                "denols",

                -- { 'eslint_d', version = '13.1.2' },
            },
            -- NOTE: mason BREAKING Change! Removed setup_handlers
            -- moved lsp configuration settings back into lspconfig.lua file
        })
    end,
}
