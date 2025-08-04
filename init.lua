-- =============================================
-- ==               OPTIONS                   ==
-- =============================================
-- line numbers
vim.opt.relativenumber = true
vim.opt.nu = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Backups and undoing
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.autoread = true

vim.opt.hlsearch = false -- Highlight search
vim.opt.incsearch = true -- Incremental Search

vim.opt.scrolloff = 8 -- How many lines to keep vertically when scrolling up and down
vim.opt.sidescrolloff = 8
vim.opt.isfname:append("@-@")

-- Improved searching for files
vim.opt.path:append("**")
vim.opt.updatetime = 50

-- line wrapping
vim.opt.wrap = false

--search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line and column stuff
vim.opt.cursorline = true

-- appearance
vim.opt.termguicolors = true -- pywal16 sets this to true anyway
vim.opt.background = "dark"
vim.opt.signcolumn = "auto"
vim.opt.colorcolumn = "80"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Setting global variables
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Misc
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.showmode = false -- We show it in our status line, making it useless to show
                         -- twice

vim.opt.pumheight = 10  -- number of items in popup menu
vim.opt.showtabline = 1 -- always show the tab line
vim.opt.laststatus = 2  -- always show statusline

vim.o.winborder = "rounded"

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- =============================================
-- ==               COMPLETE                  ==
-- =============================================
-- Excluding results from the find menu
local exclude = ""

local exclude_dirs = {
    "zig-out",
    "bin",
    "obj",
    "build",
    "target",
}


for i, dir in ipairs(exclude_dirs) do
    local str = "*/" .. dir .. "/*"

    if i ~= 1 then
        str = "," .. str
    end

    exclude = exclude .. str
end

local exclude_ft = {
    "o",
    "pyc"
}

for _, ft in ipairs(exclude_ft) do
    local str = ",*." .. ft
    exclude = exclude .. str
end

exclude = exclude .. "," .. ".*"

vim.opt.wildignore:append(exclude)

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignorecase = true

-- Autocomplete
vim.opt.completeopt:append({ "menuone", "popup", "fuzzy", "noselect" })

-- AutoComplete Keymaps
-- Shortcut to start the file autocomplete faster
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", opts)


-- Map Tab and Shift-Tab to special keybinds if the popup-menu is open
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true })

-- =============================================
-- ==               REMAPS                    ==
-- =============================================
local opts = {
    noremap = true,
    silent = false,
}

-- File explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)

-- File finder (fuzzy finder kinda)
vim.keymap.set("n", "<leader>ff", ":find ", opts)

-- Grep a string in a file (recursively) starting from the current directory
vim.keymap.set("n", "<leader>gf", ":grep ")

-- Cycle through listings (errors, grep results, etc.)
vim.keymap.set("n", "[d", ":cp<CR>", opts) -- Cycle backwards
vim.keymap.set("n", "]d", ":cn<CR>", opts) -- Cycle forwards

-- Terminal stuff
vim.keymap.set("n", "<C-/>", ":split | term <CR>i", opts)

-- Build integration
vim.keymap.set("n", "<leader>cc", ":make<CR>", opts)

-- Snippets
-- Not that I'm going to use them, but the fact that I can make my own scuffed snippets
vim.keymap.set("n", ",cmain", ":-1read $HOME/.config/nvim/snippets/cmain.snip<CR>2jo", opts)

-- Reload the neovim config
vim.keymap.set("n", "<leader>r", function()
    local prefix = "$HOME/.config/nvim/"
    vim.cmd.source(prefix .. "init.lua")
end, opts)

-- Exit Terminal Mode into Normal Terminal mode
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", opts);

-- Jumping between buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", opts)
vim.keymap.set("n", "<leader><space>", ":b ", opts)

-- Scroll half screen lengths
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-u>", opts) -- Up
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-d>", opts) -- Down

-- Easily run shell commands
vim.keymap.set("n", "<leader>sh", ":!", opts);

-- Insert the current date and time
vim.keymap.set("n", "<leader>dt", ":.!date<CR>", opts) -- WHY DO I HAVE THIS??

-- =============================================
-- ==               PAIRS                     ==
-- =============================================
-- Auto Pairs
-- My own auto-pair functionality

-- All the basic keymaps
vim.keymap.set("i", "(", "()<left>", opts)
vim.keymap.set("i", "{", "{}<left>", opts)
vim.keymap.set("i", "[", "[]<left>", opts)
vim.keymap.set("i", "<", "<><left>", opts)
vim.keymap.set("i", "/*", "/**/<left><left>", opts)

-- Do the funny thing when you press return in between a pair
vim.keymap.set("i", "<CR>", function ()
    -- If the popup-menu is open, use enter as confirmation, else
    -- do the normal funny thing with the pairs
    if vim.fn.pumvisible() == 1 then
        return "<right>"
    end

    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')

    -- We are at the beginng of the line
    if col == 1 then
        return "<CR>"
    end

    local next_char = line:sub(col, col)
    local prev_char = line:sub(col-1, col-1)

    local pairs = {
        ["("] = ")",
        ["{"] = "}",
        ["["] = "]",
        ["<"] = ">",
    }

    -- We are not in between a pair of characters in the list
    if pairs[prev_char] ~= next_char then
        return "<CR>"
    end

    return "<CR><C-o>O"

end, { noremap = true, expr = true })

-- Skip past closing characters. This gives it a more natural feel, similar to
-- other auto-pair plugins
local skip_pairs = {
    [")"] = true,
    ["}"] = true,
    ["]"] = true,
    ['"'] = true,
    [">"] = true,
}

for char, _ in pairs(skip_pairs) do
    vim.keymap.set("i", char, function()
        local line = vim.fn.getline('.')
        local col = vim.fn.col('.')
        local next_char = line:sub(col, col)
        if next_char == char then
            return "<Right>"
        else
            if char == '"' then
                return '""<left>'
            end

            return char
        end
    end, { expr = true, noremap = true })
end

-- Special functions for handling single quotes being used as an apstrophy
vim.keymap.set("i", "'", function()
    local col = vim.fn.col('.') -- current cursor column (1-based)
    local line = vim.fn.getline('.')

    local prev = line:sub(col - 1, col - 1)
    local next = line:sub(col, col)

    if next == "'" then
        return "<Right>"
    end

    if string.match(prev, "^%w+$") ~= nil then
        return "'"
    end

    return "''<left>"
end, { noremap = true, expr = true })

-- Delete the matching closing character if we delete the opeing character
vim.keymap.set("i", "<BS>", function()
    -- The pairs are defined here
    local pairs = {
        ["("] = ")",
        ["{"] = "}",
        ["["] = "]",
        ["<"] = ">",
        ['"'] = '"',
        ["'"] = "'",
    }

    local col = vim.fn.col('.') -- current cursor column (1-based)
    if col <= 1 then return "<BS>" end

    local line = vim.fn.getline('.')
    local prev = line:sub(col - 1, col - 1)
    local next = line:sub(col, col)

    if pairs[prev] and pairs[prev] == next then
        -- Delete both the opening and closing character
        return "<BS><Del>"
    else
        return "<BS>"
    end
end, { expr = true, noremap = true })

-- =============================================
-- ==               PLUGINS                   ==
-- =============================================
-- Setting up all my plugins
vim.pack.add({
    { src = "https://github.com/sainnhe/gruvbox-material" }, -- Colorscheme

    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- Better syntax highlighting
})

-- TreeSitter stuff
require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "zig", "markdown" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
    }
})

-- =============================================
-- ==              COLORSCHEME                ==
-- =============================================

vim.cmd.colorscheme("mine")

-- =============================================
-- ==               AUTOCMDS                  ==
-- =============================================
local augroup = vim.api.nvim_create_augroup("Magic", {})

-- Highlight the text we just yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Sets the filetype for c/c++ header files to C instead of C++
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    group = augroup,
    pattern = { '*.h' },
    callback = function()
        vim.bo.filetype = 'c'
    end,
})

-- =============================================
-- ==               STATUSLINE                ==
-- =============================================
function ModeStr()
    local mode_map = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'V-LINE',
        [''] = 'V-BLOCK',
        c = 'COMMAND',
        R = 'REPLACE',
        t = 'TERMINAL',
        nt = 'NORMAL-TERM',
    }
    local mode_code = vim.api.nvim_get_mode().mode
    return mode_map[mode_code] or mode_code
end

-- Get the size of the file in a human readable way
function FileSize()
    local size = vim.fn.getfsize(vim.fn.expand("%:p"))
    if size < 0 then return "" end
    if size < 1000 then return size .. "B" end
    if size < 1000 * 1000 then return string.format("%.1fK", size / 1000) end
    return string.format("%.1fM", size / (1000 * 1000))
end

-- Set the colors we're going to use for the various modules of out statusline
local col_purple = vim.g.colors.magenta
local col_aqua   = vim.g.colors.cyan
local col_red    = vim.g.colors.red
local col_blue   = vim.g.colors.blue
local col_green  = vim.g.colors.green
local col_yellow = vim.g.colors.yellow
local col_bg     = vim.g.colors.bg
local col_fg     = vim.g.colors.fg

vim.cmd("highlight StatusMode           guibg=none guifg=" .. col_red)
vim.cmd("highlight StatusType           guibg=none guifg=" .. col_purple)
vim.cmd("highlight StatusReadOnly       guibg=none guifg=" .. col_green)
vim.cmd("highlight StatusModified       guibg=none guifg=" .. col_yellow)
vim.cmd("highlight StatusFile           guibg=none guifg=" .. col_aqua)
vim.cmd("highlight StatusFileSize       guibg=none guifg=" .. col_green)
vim.cmd("highlight StatusEncoding       guibg=none guifg=" .. col_blue)
vim.cmd("highlight StatusLocation       guibg=none guifg=" .. col_yellow)
vim.cmd("highlight StatusPercent        guibg=none guifg=" .. col_red)
vim.cmd("highlight StatusNorm           guibg=none guifg=" .. col_fg)
vim.cmd("highlight StatusExtraMagenta   guibg=none guifg=" .. col_fg)

-- Set the status line
vim.o.statusline =
    "%#StatusNorm#"
    .. "%#StatusMode#"
    .. "%{v:lua.ModeStr()}"
    .. "%#StatusType#"
    .. " %Y"
    .. "%#StatusReadOnly#"
    .. " %R"
    .. "%#StatusModified#"
    .. " %M"
    .. "%#StatusNorm#"
    .. "%="
    .. "%#StatusFile#"
    .. " %F"
    .. "%="
    .. "%<"
    .. "%#StatusFileSize#"
    .. " %{v:lua.FileSize()}"
    .. "%#StatusEncoding#"
    .. " %{&fileencoding}"
    .. " %{&fileformat}"
    .. "%#StatusLocation#"
    .. " %l/%L,%c"
    .. "%#StatusPercent#"
    .. " %p%%"

-- =============================================
-- ==                  LSP                    ==
-- =============================================
local enable_lsp = false

if enable_lsp then
    -- The function to be run when a language server attaches to a buffer
    -- Mostly just setting up specifics for most LSPs
    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
            vim.keymap.set("i", "<C-o>", "<C-x><C-o>", opts) -- Autocomplete much faster
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if client:supports_method('textDocument/completion') then
                local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                client.server_capabilities.completionProvider.triggerCharacters = chars
                vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            end

            if client:supports_method('textDocument/codeAction') then
                vim.keymap.set("n", "<leader>qa", vim.lsp.buf.code_action, opts);
            end
        end,
    })

    -- Actually enable the LSPs we want
    vim.lsp.enable({ 'zls', 'luals', 'rust-analyzer', 'clangd' })

    -- Yes.
    vim.diagnostic.config({ virtual_text = true })
end

-- =============================================
-- ==                 AFTER                   ==
-- =============================================
-- Start nvim in the netrw file explorer
if vim.fn.argc() == 0 then
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            vim.cmd("Ex")
        end
    })
end
