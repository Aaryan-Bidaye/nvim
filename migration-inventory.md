# Neovim Migration Inventory

This report inventories the custom behavior in the current config and separates high-priority workflow items from lower-priority polish.

## Summary

### Essential to preserve first

- Core editing and window-management keymaps in `lua/keymaps.lua`
- LSP setup and diagnostics behavior in `init.lua`
- Terminal workflow via `lua/togterm.lua`
- Code runner workflow via `lua/coderunner.lua`
- Jupyter notebook workflow via `lua/jupynvim/init.lua` and `lua/jupynvim/ipynb.lua`
- UI defaults that affect usability: relative numbers, rounded borders, split behavior, undo persistence, clipboard, search behavior
- Active theme choice and transparency behavior from `lua/theme.lua` and `colors/ghostty.vim`

### Nice to have after the core migration works

- Alpha dashboard personalization
- Secondary custom colorschemes and custom lualine themes
- Colorizer, Copilot integration plumbing, LazyGit convenience binding
- Cosmetic plugin tweaks such as which-key grouping and comment italics settings

## 1. Custom Keybindings And Mappings

These are user-authored mappings, not plugin defaults. Preserve these if muscle memory matters.

### General editing and navigation

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `<Esc><Esc>` | `t` | Exit terminal mode | Essential | `lua/keymaps.lua:3` |
| `<leader>c` | `n` | Clear search highlights | Essential | `lua/keymaps.lua:4` |
| `<leader>q` | `n` | Populate diagnostic location list | Essential | `lua/keymaps.lua:5` |
| `n` / `N` | `n` | Next/previous search result, recentered | Essential | `lua/keymaps.lua:9-10` |
| `<C-d>` / `<C-u>` | `n` | Half-page move, recentered | Essential | `lua/keymaps.lua:11-12` |
| `<leader>p` | `x` | Paste without overwriting unnamed register | Essential | `lua/keymaps.lua:15` |
| `<leader>d` | `n,v` | Delete to black-hole register | Essential | `lua/keymaps.lua:18` |
| `<A-k>` / `<A-j>` | `n` | Move current line up/down | Essential | `lua/keymaps.lua:58-59` |
| `<A-Up>` / `<A-Down>` | `v` | Move selected lines up/down | Essential | `lua/keymaps.lua:60-61` |
| `<` / `>` | `v` | Reindent and keep selection | Nice-to-have | `lua/keymaps.lua:64-65` |

### Buffers, tabs, windows, splits

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `<leader>bn` / `<leader>bp` | `n` | Next/previous buffer | Essential | `lua/keymaps.lua:21-22` |
| `<leader>wn` / `<leader>wx` | `n` | New/close tab | Nice-to-have | `lua/keymaps.lua:25-26` |
| `<leader>wm` | `n` | Move tab | Nice-to-have | `lua/keymaps.lua:29` |
| `<leader>w<Right>` / `<leader>w<Left>` | `n` | Next/previous tab | Nice-to-have | `lua/keymaps.lua:30-31` |
| `<C-h> <C-j> <C-k> <C-l>` | `n` | Window navigation | Essential | `lua/keymaps.lua:43-46` |
| `<C-q>` | `n` | Close current window | Essential | `lua/keymaps.lua:47` |
| `<leader>sv` | `n` | Vertical split | Nice-to-have | `lua/keymaps.lua:50` |
| `<C-Up/Down/Left/Right>` | `n` | Resize windows | Nice-to-have | `lua/keymaps.lua:52-55` |

### Quickfix and location list

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `]q` / `[q` | `n` | Next/previous quickfix item | Nice-to-have | `lua/keymaps.lua:34-35` |
| `]d` / `[d` | `n` | Next/previous location-list item | Nice-to-have | `lua/keymaps.lua:38-39` |

### File, build, and working-directory workflow

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `<leader>pa` | `n` | Copy absolute file path to system clipboard | Essential | `lua/autocmd.lua:19-23` |
| `<leader>m` | `n` | `:make` | Essential if you use Make-based projects | `lua/keymaps.lua:82` |
| `<leader>mc` | `n` | `:make clean` | Nice-to-have | `lua/keymaps.lua:83` |
| `<leader>mr` | `n` | `:make run` | Nice-to-have | `lua/keymaps.lua:84` |
| `<leader>dc` | `n` | Enable `autochdir` | Nice-to-have; behavior is ambiguous because `autochdir` is already enabled globally | `lua/keymaps.lua:87`, `lua/options.lua:28` |

### Telescope search workflow

These are custom mappings, but they depend on Telescope.

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `<leader>sh` | `n` | Help tags | Nice-to-have | `init.lua:247` |
| `<leader>sk` | `n` | Keymaps | Nice-to-have | `init.lua:248` |
| `<leader>sf` | `n` | Find files | Essential | `init.lua:249` |
| `<leader>ss` | `n` | Telescope picker list | Nice-to-have | `init.lua:250` |
| `<leader>sw` | `n` | Grep current word | Nice-to-have | `init.lua:251` |
| `<leader>sg` | `n` | Live grep | Essential | `init.lua:252` |
| `<leader>sd` | `n` | Diagnostics picker | Essential | `init.lua:253` |
| `<leader>sr` | `n` | Resume last picker | Nice-to-have | `init.lua:254` |
| `<leader>s.` | `n` | Recent files | Nice-to-have | `init.lua:255` |
| `<leader><leader>` | `n` | Open buffers | Essential | `init.lua:256` |
| `<leader>/` | `n` | Fuzzy search current buffer via dropdown | Essential | `init.lua:259-265` |
| `<leader>s/` | `n` | Live grep open files only | Nice-to-have | `init.lua:269-274` |
| `<leader>sn` | `n` | Search Neovim config files | Nice-to-have | `init.lua:277-279` |

### LSP-specific custom mappings

These are defined on `LspAttach`, so they are part of your workflow rather than plugin defaults.

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `grn` | `n` | Rename symbol | Essential | `init.lua:359` |
| `gra` | `n,x` | Code actions | Essential | `init.lua:363` |
| `grr` | `n` | References via Telescope | Essential | `init.lua:366` |
| `gri` | `n` | Implementations via Telescope | Nice-to-have | `init.lua:370` |
| `grd` | `n` | Definitions via Telescope | Essential | `init.lua:375` |
| `grD` | `n` | Declaration | Nice-to-have | `init.lua:379` |
| `gO` | `n` | Document symbols | Nice-to-have | `init.lua:383` |
| `gW` | `n` | Workspace symbols | Nice-to-have | `init.lua:387` |
| `grt` | `n` | Type definitions | Nice-to-have | `init.lua:392` |
| `<leader>th` | `n` | Toggle inlay hints | Nice-to-have | `init.lua:440-443` |

### Terminal, file explorer, Git, notebook, runner, tmux

| Key | Mode | Action | Priority | Source |
| --- | --- | --- | --- | --- |
| `<leader>u` | `n` | Toggle and focus UndoTree | Nice-to-have | `lua/keymaps.lua:68-71` |
| `-` | `n` | Open Oil float | Essential if Oil replaces netrw for you | `lua/keymaps.lua:75` |
| `<leader>g` | `n` | Open LazyGit | Nice-to-have | `lua/custom/plugins/lazygit.lua:17-18` |
| `<C-h/j/k/l>` | `n` | Tmux-aware navigation | Essential if you use tmux heavily | `lua/custom/plugins/vmuxnavigator.lua:12-17` |
| `<C-\>` | `n,t` | Close current float/split window | Essential for terminal workflow | `lua/togterm.lua:322-327` |
| `<leader>t` | `n` | Toggle floating terminal | Essential | `lua/togterm.lua:340-342` |
| `<leader>T` | `n` | Toggle split terminal | Essential | `lua/togterm.lua:344-346` |
| `<leader>tl` | `n` | List/switch persistent terminals | Essential | `lua/togterm.lua:348-350` |
| `<leader>r` | `n` | Run current file through custom runner | Essential if used daily | `lua/coderunner.lua:228-235`, `init.lua:861-875` |
| `<leader>no` / `<leader>ns` | `n` | Open/save `.ipynb` notebook buffers | Essential if using notebooks in Neovim | `lua/keymaps.lua:78-79` |
| `<leader>js` | `n` | Start Jupyter kernel | Essential if using JupyTerm | `lua/jupynvim/init.lua:284` |
| `<leader>jk` | `n` | Stop Jupyter kernel | Nice-to-have | `lua/jupynvim/init.lua:285` |
| `<leader>jr` | `n` | Restart kernel | Nice-to-have | `lua/jupynvim/init.lua:286` |
| `<leader>jc` | `n,x` | Run current cell / selection | Essential if using JupyTerm | `lua/jupynvim/init.lua:287-288` |
| `<leader>jf` | `n` | Run full file as cells | Nice-to-have | `lua/jupynvim/init.lua:289` |
| `<leader>jo` | `n` | Focus Jupyter output split | Nice-to-have | `lua/jupynvim/init.lua:290` |

## 2. Personal Plugin Configurations And Settings

### Strongly personal plugin configs

| Plugin | Customization | Priority | Source |
| --- | --- | --- | --- |
| `oil.nvim` | Replaces directory editing, uses float UI, custom columns, rounded borders, no trash, custom hidden-file logic, extensive Oil-local keymap table | Essential | `lua/custom/plugins/oil.lua:6-211` |
| `alpha-nvim` | Custom header, personalized buttons, plugin count footer, greeting with username and time | Nice-to-have | `lua/custom/plugins/alpha.lua:4-58` |
| `lualine.nvim` | Removes separators and disables global statusline | Nice-to-have | `lua/custom/plugins/lualine.lua:5-14` |
| `jupynvim` (local plugin) | Hooks notebook open/save/run commands into a custom REPL transport | Essential if notebook workflow matters | `lua/custom/plugins/jupynvim.lua:4-14` |
| `copilot.lua` + `blink-copilot` | Copilot loaded, but inline suggestions and panel are explicitly disabled | Nice-to-have | `lua/custom/plugins/copilot.lua:5-15` |
| `nvim-colorizer.lua` | Enables hex/RGB background highlighting globally, disables named colors | Nice-to-have | `lua/custom/plugins/colorizer.lua:5-15` |
| `lazygit.nvim` | Lazy command loading with one custom entry key | Nice-to-have | `lua/custom/plugins/lazygit.lua:1-20` |
| `vim-tmux-navigator` | Tmux-aware pane navigation keys | Essential if tmux is central | `lua/custom/plugins/vmuxnavigator.lua:3-18` |
| `undotree` | Installed mainly to support `<leader>u` | Nice-to-have | `lua/custom/plugins/undotree.lua` |
| `nvim-web-devicons` | Forces icons on, default icons enabled | Nice-to-have | `lua/custom/plugins/icons.lua` |

### Personal edits inside the main Kickstart plugin block

| Plugin | Customization | Priority | Source |
| --- | --- | --- | --- |
| `which-key.nvim` | `delay = 1000`, custom grouping labels for search/toggle/git hunk | Nice-to-have | `init.lua:118-170` |
| `gitsigns.nvim` | Custom gutter characters: `+`, `~`, `_`, `‾` | Nice-to-have | `init.lua:84-96` |
| `telescope.nvim` | `ui-select` dropdown extension and custom search mappings | Essential for your search workflow | `init.lua:224-279` |
| `mason.nvim` | Rounded UI border | Nice-to-have | `init.lua:303` |
| `conform.nvim` | Format-on-save policy and Lua formatter mapping | Essential | `init.lua:575-613` |
| `LuaSnip` | Loads `friendly-snippets` lazily; no personal snippet pack found | Nice-to-have | `init.lua:616-639` |
| `blink.cmp` | Uses default preset, docs auto-show after 500 ms, `lazydev` source, Luasnip snippets, rust fuzzy matcher, signature help enabled | Essential | `init.lua:641-723` |
| `tokyonight.nvim` | Comment italics disabled, but not the active colorscheme | Nice-to-have / possibly stale | `init.lua:731-739` |
| `todo-comments.nvim` | Signs disabled | Nice-to-have | `init.lua:748` |

## 3. Custom Color Scheme And UI Preferences

### Active UI and editor behavior

| Item | Current Behavior | Priority | Source |
| --- | --- | --- | --- |
| Line numbers | Absolute + relative numbers | Essential | `lua/ui.lua:7-8` |
| Cursor context | Cursorline on, `scrolloff = 10`, `sidescrolloff = 8` | Essential | `lua/ui.lua:9-12` |
| Wrapping and indentation | `wrap = false`, `breakindent = true` | Essential | `lua/ui.lua:10,13` |
| Floating style | Rounded borders globally, `winblend = 0`, `pumblend = 10` | Essential | `lua/ui.lua:24-26,34` |
| Split direction | Horizontal below, vertical right | Essential | `lua/ui.lua:37-38` |
| Visible whitespace | `list = true`, tabs/trailing/nbsp markers set | Essential | `lua/ui.lua:32-33` |
| Search behavior | Ignore case + smartcase, no persistent highlight, incremental search | Essential | `lua/options.lua:7-10` |
| Persistence | Undo file enabled in `~/.vim/undodir`, swap/backup disabled | Essential | `lua/options.lua:13-18` |
| Clipboard | Appends `unnamedplus` | Essential | `lua/options.lua:32` |
| Indentation default | `shiftwidth = 2`, `softtabstop = 2`, `expandtab = false` | Essential | `lua/options.lua:36-38` |
| Folding | Manual folds, `foldlevel = 99` | Nice-to-have | `lua/options.lua:41-44` |

### Active colorscheme and transparency

- Active colorscheme is `ghostty`. Source: `lua/theme.lua:3`, `colors/ghostty.vim:1-97`.
- The config forcibly clears backgrounds for `Normal`, `NormalNC`, `EndOfBuffer`, and a broad list of floating/popup groups including Telescope, WhichKey, Lazy, Mason, Oil, and completion menu groups. Source: `lua/theme.lua:5-36,57`.
- `ghostty` itself is a custom dark palette with red-forward syntax, yellow functions, blue identifiers, purple types, subdued comments, and explicit popup/search styling. Source: `colors/ghostty.vim:15-97`.

Priority: Essential. Your theme choice and transparent-background treatment are highly personalized and visually significant.

### Additional custom theme assets worth preserving

| Asset | Notes | Priority | Source |
| --- | --- | --- | --- |
| `colors/quieter.lua` | Fully custom muted grayscale colorscheme with Treesitter, Telescope, GitSigns, UndoTree highlights | Nice-to-have | `colors/quieter.lua:1-222` |
| `colors/unokai-pastel.lua` | Fully custom pastel Monokai variant | Nice-to-have | `colors/unokai-pastel.lua` |
| `lua/lualine/themes/quieter.lua` | Matching lualine theme for `quiet_gray` | Nice-to-have | `lua/lualine/themes/quieter.lua` |
| `lua/lualine/themes/custom_unokai*.lua` | Matching lualine themes for alternate colorschemes | Nice-to-have | `lua/lualine/themes/custom_unokai.lua`, `lua/lualine/themes/custom_unokai_pastel.lua` |

### Migration note

`init.lua` ends with `require 'ntheme'` at `init.lua:860`, but there is no `lua/ntheme.lua` in the repo. The actual active theme logic appears to live in `lua/theme.lua`. This should be verified during migration because it may be a stale require or a local missing file.

## 4. LSP Server Configurations And Customizations

### Servers configured

| Server | Customization | Priority | Source |
| --- | --- | --- | --- |
| `clangd` | Explicit command `clangd --background-index --clang-tidy`; filetypes `c/cpp/objc/objcpp`; treated as system-installed, not Mason-installed; also enabled through Neovim 0.11 native `vim.lsp.config`/`vim.lsp.enable` | Essential | `init.lua:493-496`, `init.lua:541-571` |
| `gopls` | Enabled with defaults | Essential if Go is part of your workflow | `init.lua:497` |
| `pyright` | Enabled with defaults | Essential if Python is part of your workflow | `init.lua:498` |
| `rust_analyzer` | Enabled with defaults | Nice-to-have unless you actively write Rust | `init.lua:499` |
| `lua_ls` | `Lua.completion.callSnippet = "Replace"` | Essential for Neovim-config authoring | `init.lua:509-521` |

### LSP behavior customizations

| Item | Behavior | Priority | Source |
| --- | --- | --- | --- |
| Attach-time mappings | All `gr*` and symbol mappings created on `LspAttach` | Essential | `init.lua:344-445` |
| Reference highlighting | Uses `CursorHold/CursorMoved` autocmds when server supports it | Nice-to-have | `init.lua:407-434` |
| Inlay hints | Toggle available on `<leader>th` when supported | Nice-to-have | `init.lua:436-444` |
| Diagnostics UI | Rounded diagnostic floats, severity sort, underline only for errors, custom Nerd Font signs, virtual text enabled with source info | Essential | `init.lua:448-475` |
| Completion capabilities | LSP capabilities extended from `blink.cmp` | Essential | `init.lua:477-481,558` |
| Mason installation policy | Installs all configured servers except `clangd`, plus `stylua` | Essential | `init.lua:539-547` |
| Lua dev experience | `lazydev.nvim` adds luv typings when `vim.uv` is present | Nice-to-have but valuable for config hacking | `init.lua:287-294` |

## 5. Filetype-Specific Settings And Autocmds

### General autocommands

| Event | Behavior | Priority | Source |
| --- | --- | --- | --- |
| `TextYankPost` | Highlights yanked text | Nice-to-have | `lua/autocmd.lua:7-13` |
| `BufReadPost` | Restores last cursor position on reopen | Essential | `lua/autocmd.lua:26-35` |
| `TermOpen` | Turns off numbers and signcolumn in terminal buffers | Essential | `lua/autocmd.lua:38-45` |
| `VimResized` | Equalizes splits across tabs after resize | Nice-to-have | `lua/autocmd.lua:48-53` |
| `LspAttach` | Creates buffer-local LSP mappings and optional highlight/inlay-hint helpers | Essential | `init.lua:344-445` |

### Filetype-aware behavior

| Filetype / Context | Behavior | Priority | Source |
| --- | --- | --- | --- |
| `lua` | `lazydev.nvim` only loads for Lua buffers | Nice-to-have | `init.lua:287-289` |
| `c`, `cpp` | Conform format-on-save is disabled | Essential if intentional | `init.lua:591-603` |
| `lua` | Conform uses `stylua` | Essential | `init.lua:605-606` |
| `c`, `cpp`, `objc`, `objcpp` | Bound to custom `clangd` config | Essential | `init.lua:493-496`, `564-566` |
| Notebook buffers opened from `.ipynb` | Filetype forced to `python`, buffer marked with `b:ipynb_mode` | Essential for notebook editing | `lua/jupynvim/ipynb.lua:247-255` |
| Jupyter output split | Filetype set to `jupyterm` | Nice-to-have | `lua/jupynvim/init.lua:56-60` |
| Markdown buffers | JupyTerm treats fenced ```python blocks as runnable cells | Essential if using literate workflows | `lua/jupynvim/init.lua:138-157` |
| `# %%` cell markers | JupyTerm treats these as code-cell separators in normal source files | Essential if using cell-based scripting | `lua/jupynvim/init.lua:159-180,248-262` |
| Code runner | Dispatches by `vim.bo.filetype` for Python, Lua, JS, TS, shell, C, C++, Java | Essential if used | `lua/coderunner.lua:26-46,181-195,210-221` |

## 6. Custom Functions And Utility Code

### Major custom modules

| Module | What it does | Priority | Source |
| --- | --- | --- | --- |
| `lua/togterm.lua` | Persistent terminal manager keyed by working directory; float/split toggle; custom terminal selection UI; custom terminal highlights | Essential | `lua/togterm.lua:9-350` |
| `lua/coderunner.lua` | Save-and-run current file using filetype-specific commands, rooted to LSP/project directory, integrated with `togterm` | Essential | `lua/coderunner.lua:9-236` |
| `lua/jupynvim/init.lua` | Custom Jupyter REPL transport with cell extraction from code or Markdown and a dedicated output split | Essential if notebook workflow matters | `lua/jupynvim/init.lua:7-292` |
| `lua/jupynvim/ipynb.lua` | Open, render, edit, save, run, and create `.ipynb` notebooks as plain text buffers | Essential if notebook workflow matters | `lua/jupynvim/ipynb.lua:10-435` |
| `lua/utils/init.lua` | User-name helper plus icon/header exports | Nice-to-have | `lua/utils/init.lua:1-15` |

### Notable custom helper logic

- `togterm` persists one terminal buffer per working directory and revives dead terminal jobs when needed. Source: `lua/togterm.lua:113-150`.
- `togterm` includes Linux `/proc/.../cwd` and macOS `lsof` fallback logic to discover terminal working directories. Source: `lua/togterm.lua:65-96`.
- `coderunner` prefers LSP workspace roots over current buffer directory when deciding where to run commands. Source: `lua/coderunner.lua:51-75`.
- `jupynvim` sends cells using bracketed-paste sequences, which is an intentional quality-of-life choice for IPython. Source: `lua/jupynvim/init.lua:210-218`.
- `ipynb.lua` renders markdown cells with `# ` prefixes and reconstructs notebook JSON on save. Source: `lua/jupynvim/ipynb.lua:91-121,139-199,258-288`.

## 7. Personal Snippets And Templates

### Personal snippets

No personal snippet files or custom snippet definitions were found in this config.

What exists instead:

- `LuaSnip` is installed and `friendly-snippets` is loaded lazily. This is third-party content, not personal snippet inventory. Source: `init.lua:616-637`.

### Personal templates

| Template | Behavior | Priority | Source |
| --- | --- | --- | --- |
| New Jupyter notebook template | `:JupyNbNew` creates a notebook with one markdown cell (`# New Notebook`) and one code cell (`print("Hello World!")`) plus Python kernel metadata | Nice-to-have unless this is part of your workflow | `lua/jupynvim/ipynb.lua:377-434` |

## 8. Workflow-Specific Configurations

These are the clearest signs of how this config is used day to day.

### Primary workflows

| Workflow | Evidence | Priority | Source |
| --- | --- | --- | --- |
| Terminal-centric editing | Dedicated persistent terminal manager, float/split toggles, close binding, terminal-local UI cleanup | Essential | `lua/togterm.lua`, `lua/autocmd.lua:38-45` |
| Run-code-from-editor workflow | `<leader>r` plus filetype-specific runners for Python/Lua/JS/TS/C/C++/Java; uses project root from LSP | Essential | `lua/coderunner.lua:10-46,51-75,199-235`, `init.lua:861-875` |
| Notebook-in-Neovim workflow | Native `.ipynb` open/save/new/run support and IPython-backed cell execution | Essential if still desired in new config | `lua/jupynvim/init.lua`, `lua/jupynvim/ipynb.lua`, `lua/custom/plugins/jupynvim.lua` |
| Oil-first file navigation | `-` opens Oil float; Alpha dashboard links into Oil; Oil is configured as the default file explorer | Essential if this replaced netrw/tree plugins for you | `lua/keymaps.lua:75`, `lua/custom/plugins/alpha.lua:17-18`, `lua/custom/plugins/oil.lua:6-8` |
| Search-heavy workflow | Telescope bindings cover files, grep, diagnostics, buffers, config search, and current-buffer fuzzy find | Essential | `init.lua:245-279` |
| Make-based local builds | Direct bindings for `make`, `make clean`, `make run` | Essential if used frequently | `lua/keymaps.lua:82-84` |
| tmux + Neovim pane movement | `vim-tmux-navigator` bindings preserve cross-pane movement | Essential if tmux is part of the environment | `lua/custom/plugins/vmuxnavigator.lua:12-17` |

### Secondary workflow preferences

- Transparent-editor aesthetic across normal windows and floating UIs. Source: `lua/theme.lua:5-36`.
- Strong preference for rounded borders across Lazy, Mason, diagnostics, Oil, and global floats. Source: `lua/ui.lua:34`, `init.lua:303,452`, `lua/custom/plugins/oil.lua:134,179,192,200,204`.
- Clipboard-integrated editing and absolute-path copying. Source: `lua/options.lua:32`, `lua/autocmd.lua:19-23`.
- Relative-number, no-wrap, visible-whitespace editing style. Source: `lua/ui.lua:7-13,32-33`.

## Recommended Migration Order

1. Move core options and UI defaults: `lua/options.lua`, `lua/ui.lua`, the active theme, and transparency logic.
2. Recreate custom keymaps and LSP setup, including diagnostics, Mason policy, completion, and formatting.
3. Port `togterm.lua`, `coderunner.lua`, and all notebook-related modules if those workflows still matter.
4. Reapply Oil configuration and any tmux, LazyGit, UndoTree, and dashboard integrations.
5. Migrate secondary themes, lualine theme files, and cosmetic plugin tweaks last.

## Gaps / Things Not Found

- No personal snippet collection directory.
- No dedicated file templates beyond `JupyNbNew`.
- No classic `ftplugin/`, `after/ftplugin/`, or per-filetype option files; filetype customization is mostly embedded in LSP, Conform, code runner, and Jupyter modules.
