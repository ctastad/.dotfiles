return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   'esensar/nvim-dev-container',
  --   requires = { 'nvim-treesitter/nvim-treesitter' },  -- Declare dependencies
  --   config = function()
  --     -- Configuration for the plugin
  --     require('devcontainer').setup{}
  --   end,
  --   event = "VeryLazy"
  -- },
  -- {
  --   'chipsenkbeil/distant.nvim',
  --   branch = 'v0.3',
  --   config = function()
  --     require('distant'):setup()
  --   end,
  --   event = "VeryLazy"
  -- },
  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   dependencies = { "3rd/image.nvim" },
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- these are examples, not defaults. Please see the readme
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 20
  --   end,
  --   event = "VeryLazy"
  -- },
  -- {
  --   -- see the image.nvim readme for more information about configuring this plugin
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = "kitty", -- whatever backend you would like to use
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },

  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",

    config = function()
      require("sg").setup{}
    end,
    event = "VeryLazy"
  },

  -- {
  --   "michaelb/sniprun",
  --   branch = "master",
  --
  --   build = "sh install.sh",
  --   -- do 'sh install.sh 1' if you want to force compile locally
  --   -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
  --
  --   config = function()
  --     require("sniprun").setup({
  --       selected_interpreters = { "Python3_fifo" },     --# use those instead of the default for the current filetype
  --       repl_enable = {},               --# enable REPL-like behavior for the given interpreters
  --       repl_disable = {},              --# disable REPL-like behavior for the given interpreters
  --
  --       interpreter_options = {         --# interpreter-specific options, see doc / :SnipInfo <name>
  --
  --         --# use the interpreter name as key
  --         GFM_original = {
  --           use_on_filetypes = {"markdown.pandoc"}    --# the 'use_on_filetypes' configuration key is
  --           --# available for every interpreter
  --         },
  --         Python3_original = {
  --           error_truncate = "auto"         --# Truncate runtime errors 'long', 'short' or 'auto'
  --           --# the hint is available for every interpreter
  --           --# but may not be always respected
  --         }
  --       },
  --
  --       --# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
  --       --# to filter only sucessful runs (or errored-out runs respectively)
  --       display = {
  --         -- "Classic",                    --# display results in the command-line  area
  --         -- "VirtualTextOk",              --# display ok results as virtual text (multiline is shortened)
  --
  --         -- "VirtualText",             --# display results as virtual text
  --         -- "TempFloatingWindow",      --# display results in a floating window
  --         -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
  --         "Terminal",                --# display results in a vertical split
  --         -- "TerminalWithCode",        --# display results and code history in a vertical split
  --         -- "NvimNotify",              --# display with the nvim-notify plugin
  --         -- "Api"                      --# return output to a programming interface
  --       },
  --
  --       live_display = { "VirtualTextOk" }, --# display mode used in live_mode
  --
  --       display_options = {
  --         terminal_scrollback = vim.o.scrollback, --# change terminal display scrollback lines
  --         terminal_line_number = false, --# whether show line number in terminal window
  --         terminal_signcolumn = false,  --# whether show signcolumn in terminal window
  --         terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
  --         terminal_width = 45,          --# change the terminal display option width (if vertical)
  --         terminal_height = 20,         --# change the terminal display option height (if horizontal)
  --         notification_timeout = 5      --# timeout for nvim_notify output
  --       },
  --
  --       --# You can use the same keys to customize whether a sniprun producing
  --       --# no output should display nothing or '(no output)'
  --       show_no_output = {
  --         "Classic",
  --         "TempFloatingWindow",      --# implies LongTempFloatingWindow, which has no effect on its own
  --       },
  --
  --       --# customize highlight groups (setting this overrides colorscheme)
  --       snipruncolors = {
  --         SniprunVirtualTextOk   =  {bg="#66eeff",fg="#000000",ctermbg="Cyan",cterfg="Black"},
  --         SniprunFloatingWinOk   =  {fg="#66eeff",ctermfg="Cyan"},
  --         SniprunVirtualTextErr  =  {bg="#881515",fg="#000000",ctermbg="DarkRed",cterfg="Black"},
  --         SniprunFloatingWinErr  =  {fg="#881515",ctermfg="DarkRed"},
  --       },
  --
  --       live_mode_toggle='off'      --# live mode toggle, see Usage - Running for more info   
  --     })
  --   end,
  --   event = "VeryLazy"
  -- },
}
