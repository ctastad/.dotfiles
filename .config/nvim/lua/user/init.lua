return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "nord",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "python",
          "lua",
          "javascript",
          "typescript",
          "json",
          "yaml",
          "r",
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 10000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "pyright",
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Configure Python docstring handling
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      callback = function()
        -- Set textwidth for Python files (docstrings will wrap at this width)
        vim.opt_local.textwidth = 72

        -- Enable automatic text wrapping in comments and docstrings
        vim.opt_local.formatoptions:append "r" -- Auto-insert comment leader after <Enter>
        vim.opt_local.formatoptions:append "o" -- Auto-insert comment leader after o or O
        vim.opt_local.formatoptions:append "q" -- Allow formatting of comments with gq
        vim.opt_local.formatoptions:append "j" -- Remove comment leader when joining lines
        vim.opt_local.formatoptions:append "c" -- Auto-wrap comments using textwidth

        -- Fix Python smartindent issues
        vim.opt_local.smartindent = false
        vim.opt_local.autoindent = true
        vim.opt_local.cindent = true

        -- Define Python docstring as comments for better wrapping
        vim.cmd [[
        syntax match pythonDocstring /"""\_.\{-}"""/
        syntax match pythonDocstring /'''\_.\{-}'''/
        highlight link pythonDocstring Comment
      ]]
      end,
    })

    -- Add direct autocommand for formatting Python files on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      callback = function() vim.lsp.buf.format { timeout_ms = 5000 } end,
    })

    -- Add Mason bin directory to PATH
    local mason_path = vim.fn.stdpath "data" .. "/mason/bin"
    vim.env.PATH = mason_path .. ":" .. vim.env.PATH
  end,
}
