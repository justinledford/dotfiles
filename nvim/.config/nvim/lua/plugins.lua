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
    build = "fzf#install()",
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
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
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
      })

      lspconfig.clangd.setup({
        cmd = { 'clangd', '--background-index', '--clang-tidy' },
        capabilities = capabilities,
      })

      lspconfig.efm.setup {
        init_options = { documentFormatting = true },
        filetypes = { "python", "sh", "bzl" },
        rootMarkers = { ".git/" },
        capabilities = capabilities,
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

      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      lspconfig.verible.setup({
        capabilities = capabilities,
      })
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
    config = true,
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
      }
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

  -- LLM
  {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    config = function()
      require("parrot").setup {
        providers = {
          anthropic = {
            api_key = os.getenv("ANTHROPIC_API_KEY"),
          }
        },
        hooks = {
          ToString = function(prt, params)
            local template = [[
            I have the following code:

            ```{{filetype}}
            {{selection}}
            ```

            Please write a to_string / repr function.
            Respond just with the snippet of code that should be inserted."
            ]]
            local model_obj = prt.get_model "command"
            prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
          end,
          UnitTests = function(prt, params)
            local template = [[
            I have the following code from {{filename}}:

            ```{{filetype}}
            {{selection}}
            ```

            Please respond by writing unit tests for the code above. If the code
            is c++, then write gtest tests, if the code is python, write pytest tests.
            Respond only with the code.
            ]]
            local model_obj = prt.get_model "command"
            prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
            prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
          end,
        },
      }
    end,
  },
}
