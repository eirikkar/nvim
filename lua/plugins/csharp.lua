return {
    {
        "iabdelkareem/csharp.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
            "Tastyep/structlog.nvim",
        },
        config = function()
            require("mason").setup()
            require("csharp").setup({
                lsp = {
                    omnisharp = {
                        enable = false,
                        cmd_path = nil,
                        default_timeout = 1000,
                        enable_editor_config_support = true,
                        organize_imports = true,
                        load_projects_on_demand = false,
                        enable_analyzers_support = true,
                        enable_import_completion = true,
                        include_prerelease_sdks = true,
                        analyze_open_documents_only = false,
                        enable_package_auto_restore = true,
                        debug = false,
                    },
                    -- Sets if you want to use roslyn as your LSP
                    roslyn = {
                        -- When set to true, csharp.nvim will launch roslyn automatically.
                        enable = true,
                        cmd_path = "~/tools/lsp/roslyn/",
                    },
                    capabilities = nil,
                    on_attach = nil,
                },
                logging = {
                    level = "INFO",
                },
                dap = {
                    --- @type string?
                    adapter_name = nil,
                },
            })
        end,
    },
}
