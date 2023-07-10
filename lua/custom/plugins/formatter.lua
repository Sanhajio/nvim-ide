return {
    "mhartington/formatter.nvim",
    version = "*",
    config = function()
        local util = require "formatter.util"
        local lsp_util = require("lspconfig/util")
        vim.api.nvim_exec(
            [[
              augroup FormatOnSave
                autocmd!
                au BufWritePre * try | undojoin | :FormatWrite | catch /E790/ | :FormatWrite | endtry
              augroup end
            ]],
            true
        )

        require("formatter").setup {
            logging = false,
            log_level = vim.log.levels.WARN,
            require("formatter.filetypes.lua").stylua,
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.json").jsbeautify,
            require("formatter.filetypes.typescript").prettier,
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
                }
            }
        }
    end
}
