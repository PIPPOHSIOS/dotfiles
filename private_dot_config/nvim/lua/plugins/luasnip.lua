return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    build = (not LazyVim.is_win())
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          local ls = require("luasnip")

          vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.expandable() then
              ls.expand()
            elseif ls.locally_jumpable(1) and ls.in_snippet() then
              ls.jump(1)
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
          end, { silent = true, noremap = true, buffer = false })
          vim.keymap.set({ "s", "i" }, "<S-Tab>", function()
            ls.jump(-1)
          end, { silent = true, noremap = true, buffer = false })
          vim.keymap.set({ "s", "i" }, "<C-1>", function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, { silent = true, noremap = true, buffer = false })

          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
          ls.config.setup({ enable_autosnippets = true })
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
  },

  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "L3MON4D3/LuaSnip" },
    opts = {
      keymap = { preset = "super-tab" },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
        providers = { snippets = { score_offset = 85 } },
      },
    },
  },
}
