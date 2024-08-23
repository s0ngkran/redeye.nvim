-- local fg  = "#B5AF8F"
local fg       = "#A68B3A"
local bg       = "#1e1e1b"
local bg2      = "#333022"

local colors   = {
   bg_darker = "#1e1e1b",
   bg_light  = "#2e2e2a",
   menu_bg   = "#3b3a32",
   sel_bg    = "#4a4a40",
   line_num  = "#4a4a40",
   highlight = "#D17776",
   fg        = "#F8F8F0",
   accent    = "#B5AF8F",
}

local common   = {
   Normal        = { fg = fg, bg = bg },
   NormalFloat   = { link = 'Pmenu' }, -- floating window

   -- cursor and cursor lines
   Cursor        = { fg = colors.bg_darker, bg = colors.fg },
   CursorColumn  = { bg = bg2 },
   CursorLine    = { bg = bg2 },

   -- sign column and line numbers
   ColorColumn   = { bg = bg2 },
   CursorLineNr  = { fg = colors.highlight, bg = bg2 },
   LineNr        = { fg = colors.line_num, bg = bg2 },
   SignColumn    = { bg = bg2 },

   -- command line elements and prompts
   Error         = { fg = "#FF5555", bg = bg2 },
   ErrorMsg      = { fg = "#FF5555", bg = bg2 },
   ModeMsg       = { fg = "#8be9fd" },
   WarningMsg    = { fg = "#FF5555", bg = bg2 },
   Question      = { fg = "#DB70D6" },

   -- other interface elements
   Conceal       = { fg = "#8be9fd" },
   Directory     = { fg = "#8be9fd" },
   Folded        = { bg = colors.sel_bg },
   FoldColumn    = { fg = colors.highlight, bg = colors.menu_bg },
   NonText       = { fg = colors.line_num },                       -- interface tildes
   Pmenu         = { bg = colors.menu_bg },                        -- vertical popup menu elements
   PmenuSel      = { fg = colors.accent, bg = colors.sel_bg },
   PmenuSbar     = { link = 'Pmenu' },                             -- fill menu scrollbar with same color as menu itself
   PmenuThumb    = { bg = colors.sel_bg },
   SpecialKey    = { fg = colors.sel_bg },                         -- non whitespace special characters in 'listchars'. See ':help listchars'. Whitespace group links to NonText for whitespace ones
   StatusLine    = { fg = colors.highlight, bg = colors.menu_bg }, -- also sets the color of the non-active entries in the wildmenu.
   StatusLineNC  = { fg = colors.line_num, bg = colors.menu_bg },  -- non current window's status line
   TabLine       = { bg = colors.menu_bg },                        -- non-selected tabs
   TabLineFill   = { bg = bg },                                    -- the rest of the tab line
   TabLineSel    = { fg = colors.accent, bg = colors.sel_bg },     -- selected tab
   Visual        = { bg = colors.sel_bg },                         -- visual selection
   WildMenu      = { fg = colors.accent, bg = "#8be9fd" },         -- horizontal wildmenu (active when wildoptions doesn't contain pum, otherwise see Pmenu* groups)
   WinSeparator  = { fg = colors.line_num, bg = bg2 },             -- splits and window separators

   -- syntax elements
   ['@variable'] = { link = 'Identifier' },
   Comment       = { fg = colors.line_num },
   Constant      = { fg = "#FF79C6" },
   Delimiter     = { fg = colors.highlight },
   Function      = { fg = "#C17937" },
   Identifier    = { fg = fg },
   Number        = { fg = "#FFB86C" },
   Operator      = { link = 'Statement' },
   PreProc       = { fg = "#C5AA20" },
   Special       = { fg = "#FFB86C" },
   Statement     = { fg = colors.highlight },
   String        = { fg = "#72A56D" },
   Title         = { fg = "#FFB86C" }, -- Some HTML tags like <title>, <h*>s etc.
   Todo          = { fg = "#FF79C6" },
   Type          = { fg = "#FFB86C" },
   Underlined    = { fg = "#F1FA8C", underline = true }, -- <a> tags

   Added         = { fg = "#50fa7b" },                   -- light_green in default theme
   Changed       = { fg = "#8be9fd" },                   -- light_cyan in default theme
   Removed       = { fg = "#FF5555" },                   -- light_red in default theme

   DiffAdd       = { fg = "#72A56D" },
   DiffChange    = { fg = "#C5AA20" },
   DiffText      = { fg = "#8be9fd" },
   DiffDelete    = { fg = "#FF5555" },
   DiffSubname   = { fg = colors.line_num },
}

local spell    = {
   Search     = { fg = "#1E1E1B", bg = "#F1FA8C" },
   CurSearch  = { fg = "#FF79C6", bg = "#F1FA8C" },
   MatchParen = { fg = "#50fa7b", bold = true },

   SpellBad   = { sp = "#FF5555", undercurl = true },
   SpellCap   = { sp = "#F1FA8C", undercurl = true },
   SpellRare  = { sp = "#8be9fd", undercurl = true },
   SpellLocal = { sp = "#50fa7b", undercurl = true }
}

local terminal = {
   terminal_color_0  = colors.bg_darker,
   terminal_color_1  = "#FF5555",
   terminal_color_2  = "#50fa7b",
   terminal_color_3  = "#F1FA8C",
   terminal_color_4  = "#8be9fd",
   terminal_color_5  = "#bd93f9",
   terminal_color_6  = "#8be9fd",
   terminal_color_7  = colors.fg,

   terminal_color_8  = colors.bg_darker,
   terminal_color_9  = "#FF5555",
   terminal_color_10 = "#50fa7b",
   terminal_color_11 = "#F1FA8C",
   terminal_color_12 = "#8be9fd",
   terminal_color_13 = "#bd93f9",
   terminal_color_14 = "#8be9fd",
   terminal_color_15 = colors.fg
}

local Theme    = {
   common = common,
   redeye = spell,
   terminal = terminal
}

function Theme.set_highlights(highlights)
   for group, value in pairs(highlights) do
      -- if group is cursor then set reverse to true

      vim.api.nvim_set_hl(0, group, value)
   end
   -- vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
   --
   vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = '#ff0000', bg = '#000000', bold = true })
   vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = '#00ff00', bg = '#000000', bold = true })
   vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#555555' })
   vim.api.nvim_set_hl(0, 'LeapMatch', { fg = '#ffffff', bold = true })
end

function Theme:set_terminal_colors()
   for term_color, value in pairs(self.terminal) do
      vim.g[term_color] = value
   end
end

local Redeye = {}

-- called every time when theme is selected
function Redeye:load()
   vim.cmd.highlight('clear')
   vim.o.background = 'dark'
   vim.o.termguicolors = true
   vim.g.colors_name = 'redeye'
   self:set_colors()
end

function Redeye:setup()
end

function Redeye:set_colors()
   Theme.set_highlights(Theme.common)
   Theme.set_highlights(Theme.redeye)
   Theme:set_terminal_colors()
end

return Redeye
