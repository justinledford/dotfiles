return {
  -- colorscheme
  {
    "mcchrish/zenbones.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[
        set termguicolors
        set background=light
        colorscheme zenwritten
      ]])
    end,
    dependencies = "rktjmp/lush.nvim",
  },

  -- enable nvim+tmux integration
  "christoomey/vim-tmux-navigator",

  -- indicate git diffs in the gutter
  "airblade/vim-gitgutter",

  -- git interface
  "tpope/vim-fugitive",

  -- fuzzy finder
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },
  "junegunn/fzf.vim",

  -- diagnostics
  {
    "folke/trouble.nvim",
    config = true,
  },

  -- file explorer
  {
    "stevearc/oil.nvim",
    config = true,
    lazy = false,
  },

  -- completion engine
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require('cmp')
      return {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
    dependencies = {
      -- snippet completion source for nvim-cmp
      "saadparwaiz1/cmp_luasnip",
      -- expand capabilities sent to LSP servers to the ones that nvim-cmp supports
      "hrsh7th/cmp-nvim-lsp",
      "nvimtools/none-ls.nvim",
    }
  },

  -- LSP client configs
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {
                "vim",
              },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      }

      vim.lsp.config.clangd = {
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
      }

      vim.lsp.config.efm = {
        init_options = { documentFormatting = true },
        filetypes = { "python", "sh", "bzl" },
        rootMarkers = { ".git/" },
        settings = {
          languages = {
            python = {
              {
                formatCommand = 'black --quiet -',
                formatStdin = true
              },
              {
                formatCommand = 'isort --quiet -',
                formatStdin = true
              },
              {
                lintCommand = 'mypy --show-column-numbers --disallow-untyped-defs',
                lintStdin = false
              },
            },
            sh = {
              { formatCommand = 'shfmt -i 2 -', formatStdin = true },
            },
            bzl = {
              { formatCommand = 'buildifier --type=build', formatStdin = true },
            }
          }
        }
      }
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
    }
  },

  -- snippet engine
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require('luasnip.loaders.from_snipmate').lazy_load({
        fs_event_providers = {
          libuv = true,
        },
      })
      require('luasnip').config.setup()
    end,
    dependencies = {
      -- snippets collection
      "honza/vim-snippets",
    }
  },

  -- package manager for LSP servers, linters, etc
  {
    "williamboman/mason.nvim",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        'clangd',
        'efm',
        'lua_ls',
        'pylsp',
        'verible',
        'vtsls',
      },
      automatic_enable = true
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  },

  -- use non-LSP sources in the LSP client
  "nvimtools/none-ls.nvim",
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        'black',
        'isort',
        'mypy',
        'shfmt',
        'shellcheck',
        'buildifier',
      }
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  },
}
