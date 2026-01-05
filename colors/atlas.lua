-- atlas_os.nvim (simple dark scheme inspired by your screenshot)
-- put this file at: ~/.config/nvim/colors/atlas_os.lua

vim.opt.termguicolors = true
vim.g.colors_name = 'atlas_os'

local c = {
  bg = '#1D1F21',
  fg = '#C5C8C6',
  dim = '#666666',
  white = '#EAEAEA',

  red = '#CC6666',
  green = '#B5BD68',
  yellow = '#F0C674',
  blue = '#81A2BE',
  purple = '#C397D8',
  magenta = '#B294BB',
  cyan = '#8ABEB7',
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Reset
hi('Normal', { fg = c.fg, bg = c.bg })
hi('NormalNC', { fg = c.fg, bg = c.bg })
hi('EndOfBuffer', { fg = c.bg, bg = c.bg })
hi('SignColumn', { fg = c.fg, bg = c.bg })
hi('LineNr', { fg = c.dim, bg = c.bg })
hi('CursorLineNr', { fg = c.white, bg = c.bg, bold = true })
hi('CursorLine', { bg = '#232527' })

-- UI bits (keep subtle)
hi('StatusLine', { fg = c.fg, bg = '#232527' })
hi('StatusLineNC', { fg = c.dim, bg = '#232527' })
hi('VertSplit', { fg = '#232527', bg = c.bg })
hi('Visual', { bg = '#2B2F33' })
hi('Search', { fg = c.bg, bg = c.yellow })
hi('IncSearch', { fg = c.bg, bg = c.purple })

-- Syntax (matches screenshot style)
hi('Comment', { fg = c.dim, italic = true })

hi('PreProc', { fg = c.cyan }) -- #define, #include
hi('Include', { fg = c.cyan })
hi('Define', { fg = c.cyan })
hi('Macro', { fg = c.cyan })

hi('String', { fg = c.purple }) -- "Hello ..."
hi('Character', { fg = c.purple })

hi('Number', { fg = c.purple }) -- 900, 600, 0xFF0000 vibe
hi('Float', { fg = c.purple })

hi('Boolean', { fg = c.purple, bold = true }) -- true/false pop

hi('Keyword', { fg = c.yellow }) -- general keywords
hi('Conditional', { fg = c.yellow, bold = true }) -- if
hi('Repeat', { fg = c.yellow, bold = true }) -- while/for

hi('Type', { fg = c.white }) -- int, Uint32, SDL_Rect
hi('StorageClass', { fg = c.white })

hi('Function', { fg = c.white }) -- printf, SDL_*
hi('Identifier', { fg = c.fg }) -- variables
hi('Constant', { fg = c.purple })

-- Common extras
hi('Operator', { fg = c.fg })
hi('Delimiter', { fg = c.fg })
hi('Special', { fg = c.magenta })
hi('Todo', { fg = c.bg, bg = c.yellow, bold = true })
