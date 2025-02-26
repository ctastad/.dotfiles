return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"
    config.sources = {
      -- Universal formatters
      null_ls.builtins.formatting.prettier.with {
        extra_args = {
          "--print-width",
          "80",
          "--single-quote",
          "--trailing-comma",
          "es5",
        },
        filetypes = {
          "javascript",
          "typescript",
          "json",
          "yaml",
          "markdown",
          "html",
          "css",
        },
      },

      -- Lua
      null_ls.builtins.formatting.stylua.with {
        extra_args = {
          "--column-width",
          "80",
          "--line-endings",
          "Unix",
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
        filetypes = { "lua" },
      },

      -- Python specific
      null_ls.builtins.formatting.black.with {
        extra_args = {
          "--fast",
          "--line-length",
          "80",
          "--string-normalization",
          "--preview", -- Enable preview features for better string handling
        },
        filetypes = { "python" },
      },
      null_ls.builtins.formatting.isort.with {
        extra_args = {
          "--profile",
          "black",
          "--line-length=80",
          "--wrap-length=80", -- Add wrap length for imports
        },
        filetypes = { "python" },
      },
      null_ls.builtins.diagnostics.flake8.with {
        extra_args = {
          "--max-line-length=80",
          "--extend-ignore=E501", -- Ignore line length errors
          "--docstring-convention=google",
          "--max-doc-length=72", -- Specific limit for docstrings
        },
        filetypes = { "python" },
      },

      -- R specific
      null_ls.builtins.formatting.styler.with {
        extra_args = {
          "--style_pkg_path",
          "styler::tidyverse_style(line_break.limit = 80)",
        },
        filetypes = { "r", "rmd" },
      },

      -- JavaScript/TypeScript specific
      null_ls.builtins.diagnostics.eslint_d.with {
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.js", ".eslintrc.json" }
        end,
        filetypes = {
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
        },
      },
    }
    return config
  end,
}
