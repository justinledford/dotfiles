return {
  -- colorscheme
  {
    "nvim-mini/mini.base16",
    lazy = false,
    priority = 1000,
    config = {
      palette = {
        -- ui colors
        base00 = "#242424", -- [black]       - default background
        base01 = "#3f3f3f", -- [faded black] - lighter background (status bars)
        base02 = "#5c5c5c", -- [dark dust]   - selection background
        base03 = "#93928d", -- [tear]        - comments / dim text
        base04 = "#98989a", -- [stone]       - dark foreground (ui borders)
        base05 = "#f8f9f4", -- [milk]        - default foreground
        base06 = "#ece5db", -- [bone]        - light foreground
        base07 = "#f8f9f4", -- [milk]        - lightest foreground
        -- syntax colors
        base08 = "#e2e2e2", -- [oyster]      - variables, xml tags (red)
        base09 = "#c2c3be", -- [dinge]       - integers, booleans (orange)
        base0A = "#c2c3be", -- [dinge]       - classes, search text (yellow)
        base0B = "#7a6f69", -- [dust]        - strings (green)
        base0C = "#e1e1df", -- [ash]         - regex, escape characters (cyan)
        base0D = "#dcdcd0", -- [pearl]       - functions, methods (blue)
        base0E = "#5c5c5c", -- [dark dust]   - keywords, storage (purple)
        base0F = "#e2e2e2"  -- [oyster]      - deprecated/misc (brown)
      }
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    config = {
      min_horizontal_distance_smear = 32,
      min_vertical_distance_smear = 8,
      cursor_color = "#bbc5ce", -- 46 POWDER BLUE
      particles_enabled = true,
      stiffness = 0.5,
      trailing_stiffness = 0.2,
      trailing_exponent = 5,
      damping = 0.6,
      gradient_exponent = 0,
      gamma = 2.2,
      never_draw_over_target = true,
      hide_target_hack = true,
      particle_spread = 1,
      particles_per_second = 500,
      particles_per_length = 50,
      particle_max_lifetime = 300,
      particle_max_initial_velocity = 20,
      particle_velocity_from_cursor = 0.5,
      particle_damping = 0.15,
      particle_gravity = -50,
      min_distance_emit_particles = 0,
      particles_over_text = false,
    },
  },


  -- indicate git diffs in the gutter
  "airblade/vim-gitgutter",

  -- git interface
  "tpope/vim-fugitive",

  -- fuzzy finder
  {
    "junegunn/fzf",
    build = ":call fzf#install()",
  },

  {
    "ibhagwan/fzf-lua",
    opts = {
      grep = {
        hidden = true,
      }
    }
  },

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
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
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

      vim.lsp.config.neocmake = {
        settings = {
          init_options = {
            format = {
              enable = false
            },
            lint = {
              enable = false
            },
          }
        }
      }

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
        filetypes = { "python", "sh", "bzl", "json", "cmake", "html" },
        rootMarkers = { ".git/" },
        settings = {
          languages = {
            python = {
              {
                formatCommand = 'black --quiet --line-length 80 -',
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
            },
            json = {
              { formatCommand = 'jq .', formatStdin = true },
            },
            cmake = {
              { formatCommand = 'cmake-format', formatStdin = false },
            },
            html = {
              { formatCommand = 'prettier', formatStdin = false },
            },
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
        'bashls',
        'clangd',
        'efm',
        'lua_ls',
        'neocmake',
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
        'buildifier',
        'cmakelang',
        'isort',
        'jq',
        'mypy',
        'prettier',
        'shfmt',
        'shellcheck',
      }
    },
    dependencies = {
      "williamboman/mason.nvim",
    }
  },

  -- select venv for python LS
  {
    "linux-cultist/venv-selector.nvim",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      ft = "python",
    }
  },

  -- open links, search text and other custom handlers with `gx`
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    config = true,
    submodules = false,
  },

  -- resize windows without the weird default invertedness
  {
    'mrjones2014/smart-splits.nvim',
    opts = {
      default_amount = 4
    }
  },
}
