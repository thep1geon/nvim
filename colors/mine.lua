vim.g.colors = {
    black         = "#2f1e33", -- 0
    red           = "#ce808b", -- 1
    green         = "#80cea3", -- 2
    yellow        = "#cec580", -- 3
    blue          = "#809ace", -- 4
    magenta       = "#c080ce", -- 5
    cyan          = "#80cecd", -- 6
    white         = "#d7b1df", -- 7
    bold_black    = "#9c7da3", -- 8
    bold_red      = "#f48f9d", -- 9
    bold_green    = "#9ff5c0", -- 10
    bold_yellow   = "#f5eb9f", -- 11
    bold_blue     = "#9fb5f5", -- 12
    bold_magenta  = "#eb9ff5", -- 13
    bold_cyan     = "#9ff5f5", -- 14
    bold_white    = "#ffdcff", -- 15
    bg            = "#2f1e33",
    fg            = "#d7b1df"
}

vim.api.nvim_set_hl(0, "Pmenu", { fg = vim.g.colors.fg, ctermfg = 7, })

vim.api.nvim_set_hl(0, "Normal", { fg = vim.g.colors.fg, ctermfg = 7})

vim.api.nvim_set_hl(0, "FloatBorder", { fg = vim.g.colors.bold_black, ctermfg = 8 })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = vim.g.colors.fg, ctermfg = 7 })

vim.api.nvim_set_hl(0, "NormalNC", { fg = vim.g.colors.fg, ctermfg = 7 })

vim.api.nvim_set_hl(0, "NonText", { fg = vim.g.colors.fg, ctermfg = 7 })

vim.api.nvim_set_hl(0, "LineNr", { fg = vim.g.colors.bold_black, ctermfg = 8 })

vim.api.nvim_set_hl(0, "ColorColumn", { 
    bg = vim.g.colors.bold_black, ctermbg = 8
})

vim.api.nvim_set_hl(0, "StatusLine", { italic = true, bold = true })

vim.api.nvim_set_hl(0, "Boolean", { fg  = vim.g.colors.bold_red, ctermfg = 9 })
vim.api.nvim_set_hl(0, "Number", { fg  = vim.g.colors.bold_red, ctermfg = 9 })

vim.api.nvim_set_hl(0, "Indentifier", { fg  = vim.g.colors.cyan, ctermfg = 6 })
vim.api.nvim_set_hl(0, "@property", { fg  = vim.g.colors.cyan, ctermfg = 6 })

vim.api.nvim_set_hl(0, "String", { fg = vim.g.colors.green, ctermfg = 2 })
vim.api.nvim_set_hl(0, "@string.escape", { fg = vim.g.colors.bold_green, ctermfg = 10 })
vim.api.nvim_set_hl(0, "Character", { fg = vim.g.colors.blue, ctermfg = 4 })

vim.api.nvim_set_hl(0, "Function", { fg = vim.g.colors.cyan, ctermfg = 6 })
vim.api.nvim_set_hl(0, "@function.builtin", { fg = vim.g.colors.bold_cyan, ctermfg = 6 })
vim.api.nvim_set_hl(0, "Statement", { fg = vim.g.colors.red, ctermfg  = 1 })
vim.api.nvim_set_hl(0, "@function", { fg = vim.g.colors.cyan, ctermfg = 6 })
vim.api.nvim_set_hl(0, "Label", { fg = vim.g.colors.green, ctermfg = 2})

vim.api.nvim_set_hl(0, "Type", { fg = vim.g.colors.bold_blue, ctermfg = 12, italic = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = vim.g.colors.bold_blue, ctermfg = 12, italic = true })

vim.api.nvim_set_hl(0, "Keyword", { fg = vim.g.colors.magenta, ctermfg = 5})
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = vim.g.colors.bold_yellow, ctermfg = 3 })

vim.api.nvim_set_hl(0, "Comment", { fg = vim.g.colors.bold_black, ctermfg = 8 })

vim.api.nvim_set_hl(0, "Operator", { fg = vim.g.colors.bold_white, ctermfg = 15 })

vim.api.nvim_set_hl(0, "Constant", { fg = vim.g.colors.bold_red, ctermfg = 9 })

vim.api.nvim_set_hl(0, "Delimiter", { fg = vim.g.colors.fg, ctermfg = 7 })
vim.api.nvim_set_hl(0, "MatchParen", { bg = vim.g.colors.bold_black, ctermfg = 8 })
vim.api.nvim_set_hl(0, "@constructor", { fg = vim.g.colors.fg, ctermfg = 7 })

vim.api.nvim_set_hl(0, "netrwDir", { fg = vim.g.colors.bold_blue, ctermfg = 12 })
vim.api.nvim_set_hl(0, "netrwTreeBar", { fg = vim.g.colors.fg, ctermfg = 7 })
vim.api.nvim_set_hl(0, "netrwExe", { fg = vim.g.colors.cyan, ctermfg = 6 })

vim.api.nvim_set_hl(0, "CurSearch", { bg = vim.g.colors.bold_yellow, ctermfg = 11 })

vim.api.nvim_set_hl(0, "CursorLine", { underline = true })

vim.api.nvim_set_hl(0, "Visual", { bg = vim.g.colors.magenta, ctermbg = 5})
