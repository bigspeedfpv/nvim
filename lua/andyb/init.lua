require("andyb.set")
require("andyb.remap")
require("andyb.plugins")

if (vim.fn.has("termguicolors")) then
 vim.g.termguicolors = true
end

local augroup = vim.api.nvim_create_augroup
local AndyBGroup = augroup('AndyB', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = AndyBGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
