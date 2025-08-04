vim.g.colors = {
    black         = "#2f1e33",
    red           = "#ce808b",
    green         = "#80cea3",
    yellow        = "#cec580",
    blue          = "#809ace",
    magenta       = "#c080ce",
    cyan          = "#80cecd",
    white         = "#d7b1df",
    bold_black    = "#9c7da3",
    bold_red      = "#f48f9d",
    bold_green    = "#9ff5c0",
    bold_yellow   = "#f5eb9f",
    bold_blue     = "#9fb5f5",
    bold_magenta  = "#eb9ff5",
    bold_cyan     = "#9ff5f5",
    bold_white    = "#ffdcff",
    bg            = "#2f1e33",
    fg            = "#d7b1df"
}

vim.api.nvim_set_hl(0, "Pmenu", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "Normal", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "NormalFloat", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "NormalNC", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "NonText", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "LineNr", { fg = vim.g.colors.bold_black })

vim.api.nvim_set_hl(0, "ColorColumn", { bg = vim.g.colors.bold_black })

vim.api.nvim_set_hl(0, "StatusLine", { italic = true, bold = true})

vim.api.nvim_set_hl(0, "Boolean", { fg  = vim.g.colors.bold_red })
vim.api.nvim_set_hl(0, "Number", { fg  = vim.g.colors.bold_red })

vim.api.nvim_set_hl(0, "String", { fg = vim.g.colors.green })
vim.api.nvim_set_hl(0, "@string.escape", { fg = vim.g.colors.bold_green })
vim.api.nvim_set_hl(0, "Character", { fg = vim.g.colors.green })

vim.api.nvim_set_hl(0, "Function", { fg = vim.g.colors.cyan })
vim.api.nvim_set_hl(0, "Statement", { fg = vim.g.colors.red })
vim.api.nvim_set_hl(0, "@function", { fg = vim.g.colors.cyan })
vim.api.nvim_set_hl(0, "Label", { fg = vim.g.colors.green })

vim.api.nvim_set_hl(0, "Type", { fg = vim.g.colors.bold_blue, italic = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = vim.g.colors.bold_blue, italic = true })

vim.api.nvim_set_hl(0, "Keyword", { fg = vim.g.colors.magenta })

vim.api.nvim_set_hl(0, "Comment", { fg = vim.g.colors.bold_black })

vim.api.nvim_set_hl(0, "Operator", { fg = vim.g.colors.bold_white })

vim.api.nvim_set_hl(0, "Constant", { fg = vim.g.colors.bold_red })

vim.api.nvim_set_hl(0, "Delimiter", { fg = vim.g.colors.fg })

vim.api.nvim_set_hl(0, "netrwDir", { fg = vim.g.colors.bold_blue })
vim.api.nvim_set_hl(0, "netrwTreeBar", { fg = vim.g.colors.fg })
vim.api.nvim_set_hl(0, "netrwExe", { fg = vim.g.colors.cyan })

vim.api.nvim_set_hl(0, "CurSearch", { bg = vim.g.colors.red })

vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
