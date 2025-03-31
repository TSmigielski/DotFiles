return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
        options = {
            icons_enabled = true,
            theme = "codedark",
            component_separators = "",
            section_separators = "",
            disabled_filetypes = {
                "git"
            },
            ignore_focus = {
                "query"
            }
        },
        sections = {
            lualine_c = {
                {
                    "filename",
                    newfile_status = true,
                    symbols = {
                        modified = '●',
                        readonly = '[readonly]',
                        unnamed = '[no name]',
                        newfile = '[new]'
                    }
                }
            },
            lualine_x = {
                "lsp_status", 
                "encoding",
                "fileformat",
                "filetype"
            }
        },
        inactive_sections = {
            lualine_x = {
                "filetype"
            }
        },
        tabline = {
            lualine_a = { 
                {
                    "buffers",
                    mode = 2,
                    symbols = {
                        alternate_file = "^",
                    }
                }
            }
        },
        extensions = {
            "fugitive",
            "fzf",
            "lazy",
            "man",
            "mason",
            "oil",
            "trouble"
        }
    }
}
