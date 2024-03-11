return {
    "mhartington/formatter.nvim",
    version = "*",
    config = function()
        local util = require "formatter.util"
        local lsp_util = require("lspconfig/util")

        -- au BufWritePre * try | undojoin | :FormatWrite | catch /E790/ | :FormatWrite | endtry

        vim.api.nvim_exec(
            [[
              augroup FormatOnSave
                autocmd!
                autocmd BufWritePost * FormatWrite
              augroup end
            ]],
            true
        )

        require("formatter").setup {
            logging = true,
            log_level = vim.log.levels.WARN,

            filetype = {
                cs = {
                    function()
                        return {
                            exe = "dotnet",
                            args = {
                                "csharpier"
                            },
                            cwd = vim.fn.expand("%:p:h"),
                            stdin = true,
                            env = {
                                "DOTNET_CLI_TELEMETRY_OPTOUT=true",
                                "TERM=xterm-256color"
                            }
                        }
                    end
                },
                lua = {
                    require("formatter.filetypes.lua").stylua,
                },
                python = {
                    require("formatter.filetypes.python").black,
                },
                json = {
                    require("formatter.filetypes.json").jsbeautify,
                },
                typescriptreact = {
                    require("formatter.filetypes.typescriptreact").prettier,
                },
                typescript = {
                    require("formatter.filetypes.typescript").prettier,
                },
                go = {
                    require("formatter.filetypes.go").gofmt,
                    require("formatter.filetypes.go").goimports,
                }
            }
        }
    end
}
