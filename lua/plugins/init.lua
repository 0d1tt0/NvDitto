return {
    -- neovim completions
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                -- install jsregexp (optional!).
                build = "make install_jsregexp",
            },
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local luasnip = require("luasnip")
    
            require("luasnip.loaders.from_vscode").lazy_load()
    
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
    
            vim.cmd([[
          set completeopt=menuone,noinsert,noselect
          highlight! default link CmpItemKind CmpItemMenuDefault
        ]])
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local nvim_lsp = require("lspconfig")
    
            local protocol = require("vim.lsp.protocol")
    
            local on_attach = function(client, bufnr)
                -- format on save
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("Format", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end
    
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
          return require "configs.mason"
        end,
        config = function(_, opts)
          if opts.ensure_installed then
            vim.api.nvim_echo({
              { "\n   ensure_installed has been removed! use M.mason.pkgs table in your chadrc.\n", "WarningMsg" },
              { "   https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua#L85 \n\n", "FloatBorder" },
              {
                "   MasonInstallAll will automatically install all mason packages of tools configured in your plugins. \n",
                "healthSuccess",
              },
              { "   Currently supported plugins are : lspconfig, nvim-lint, conform. \n", "Added" },
              { "   So dont add them in your chadrc as MasonInstallAll automatically installs them! \n", "Changed" },
            }, false, {})
          end
    
          require("mason").setup(opts)
        end,
    },

    -- other stuff
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'nvim-lua/plenary.nvim'},
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
          return require "configs.telescope"
        end,
      },
  
      {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
          return require "configs.treesitter"
        end,
        config = function(_, opts)
          require("nvim-treesitter.configs").setup(opts)
        end,
      },

      {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = {}
      },

      {
        'nvim-tree/nvim-web-devicons'
      },

      {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
      },
    
      {
        'stevearc/conform.nvim',
        event = { "BufReadPost", "BufNewFile" },
        opts = require "configs.conform",
      },
}
