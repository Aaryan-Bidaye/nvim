-- default_tweak.lua
-- Neovim default colorscheme with *very small* semantic tweaks:
-- - booleans → red
-- - keywords/constants → yellow
-- - numbers → purple

vim.cmd.colorscheme 'default'

local set = vim.api.nvim_set_hl

-- From your Ghostty palette
local red = '#CC6666' -- palette 1
local yellow = '#F0C674' -- palette 3
local purple = '#B294BB' -- palette 5

-- Booleans → red
set(0, 'Boolean', { fg = red })
set(0, '@boolean', { fg = red })

-- Keywords / constants → yellow
set(0, 'Keyword', { fg = yellow })
set(0, '@keyword', { fg = yellow })

set(0, 'Constant', { fg = yellow })
set(0, '@constant', { fg = yellow })

-- Numbers → purple
set(0, 'Number', { fg = purple })
set(0, 'Float', { fg = purple })
set(0, '@number', { fg = purple })
set(0, '@float', { fg = purple })
