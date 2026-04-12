vim.cmd 'hi clear'

if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end

vim.o.background = 'dark'
vim.g.colors_name = 'alacritty'

local p = {
  bg = '#181818',
  fg = '#d8d8d8',
  black = '#181818',
  red = '#ac4242',
  green = '#90a959',
  yellow = '#f4bf75',
  blue = '#6a9fb5',
  magenta = '#aa759f',
  cyan = '#75b5aa',
  white = '#d8d8d8',

  bright_black = '#6b6b6b',
  bright_red = '#c55555',
  bright_green = '#aac474',
  bright_yellow = '#feca88',
  bright_blue = '#82b8c8',
  bright_magenta = '#c28cb8',
  bright_cyan = '#93d3c3',
  bright_white = '#f8f8f8',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base
hl('Normal', { fg = p.fg, bg = p.bg })
hl('NormalNC', { fg = p.fg, bg = p.bg })
hl('NormalFloat', { fg = p.fg, bg = p.bg })
hl('FloatBorder', { fg = p.bright_black, bg = p.bg })
hl('EndOfBuffer', { fg = p.bg, bg = p.bg })

hl('Cursor', { fg = p.bg, bg = p.white })
hl('CursorLine', { underline = true })
hl('CursorColumn', {})
hl('ColorColumn', { bg = p.black })
hl('LineNr', { fg = p.bright_black, bg = p.bg })
hl('CursorLineNr', { fg = p.bright_white, bold = true, bg = p.bg })
hl('VertSplit', { fg = p.bright_black, bg = p.bg })
hl('WinSeparator', { fg = p.bright_black, bg = p.bg })

hl('StatusLine', { fg = p.bright_white, bg = p.black, bold = true })
hl('StatusLineNC', { fg = p.bright_black, bg = p.black })
hl('Visual', { fg = p.bg, bg = p.white })
hl('Search', { fg = p.bg, bg = p.yellow })
hl('IncSearch', { fg = p.bg, bg = p.bright_yellow })
hl('CurSearch', { fg = p.bg, bg = p.bright_yellow })
hl('MatchParen', { fg = p.bg, bg = p.cyan, bold = true })

hl('Pmenu', { fg = p.fg, bg = p.black })
hl('PmenuSel', { fg = p.bg, bg = p.blue })
hl('PmenuSbar', { bg = p.bright_black })
hl('PmenuThumb', { bg = p.bright_white })

hl('Folded', { fg = p.bright_black, bg = p.black })
hl('FoldColumn', { fg = p.bright_black, bg = p.bg })
hl('SignColumn', { fg = p.fg, bg = p.bg })

-- Syntax
hl('Comment', { fg = p.bright_black, italic = true })

hl('String', { fg = p.green })
hl('Character', { fg = p.green })

hl('Number', { fg = p.cyan })
hl('Boolean', { fg = p.cyan })
hl('Float', { fg = p.cyan })
hl('Constant', { fg = p.cyan })

hl('Keyword', { fg = p.red })
hl('Conditional', { fg = p.red })
hl('Repeat', { fg = p.red })
hl('Exception', { fg = p.red })
hl('Statement', { fg = p.red })

hl('Operator', { fg = p.bright_red })

hl('Function', { fg = p.yellow, bold = true })

hl('Identifier', { fg = p.blue })
hl('@variable.builtin', { fg = p.fg })

hl('Type', { fg = p.magenta })
hl('StorageClass', { fg = p.magenta })
hl('Structure', { fg = p.magenta })
hl('Typedef', { fg = p.magenta })

hl('PreProc', { fg = p.bright_magenta })
hl('Include', { fg = p.bright_magenta })
hl('Define', { fg = p.bright_magenta })
hl('Macro', { fg = p.bright_magenta })

hl('Delimiter', { fg = p.fg })

hl('Error', { fg = p.bright_white, bg = p.red, bold = true })
hl('WarningMsg', { fg = p.bright_yellow })
hl('Todo', { fg = p.bright_magenta, bold = true })

-- Diagnostics
hl('DiagnosticError', { fg = p.red })
hl('DiagnosticWarn', { fg = p.bright_yellow })
hl('DiagnosticInfo', { fg = p.blue })
hl('DiagnosticHint', { fg = p.bright_cyan })

hl('DiagnosticUnderlineError', { undercurl = true, sp = p.red })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = p.bright_yellow })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = p.blue })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = p.bright_cyan })

-- Git
hl('DiffAdd', { fg = p.green })
hl('DiffChange', { fg = p.yellow })
hl('DiffDelete', { fg = p.red })
hl('DiffText', { fg = p.blue, bold = true })

-- Terminal / toggle terminal consistency
hl('Terminal', { fg = p.fg, bg = p.bg })

-- Common treesitter links
hl('@comment', { link = 'Comment' })
hl('@string', { link = 'String' })
hl('@character', { link = 'Character' })
hl('@number', { link = 'Number' })
hl('@boolean', { link = 'Boolean' })
hl('@constant', { link = 'Constant' })
hl('@keyword', { link = 'Keyword' })
hl('@keyword.return', { link = 'Keyword' })
hl('@conditional', { link = 'Conditional' })
hl('@repeat', { link = 'Repeat' })
hl('@exception', { link = 'Exception' })
hl('@operator', { link = 'Operator' })
hl('@function', { link = 'Function' })
hl('@function.call', { link = 'Function' })
hl('@variable', { link = 'Identifier' })
hl('@property', { link = 'Identifier' })
hl('@field', { link = 'Identifier' })
hl('@type', { link = 'Type' })
hl('@type.builtin', { link = 'Type' })
hl('@include', { link = 'Include' })
hl('@parameter', { fg = p.fg })
hl('@punctuation', { link = 'Delimiter' })
