return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
    },
    "nvim-treesitter/nvim-treesitter-context",
  },

  config = function()
    local ts = require("nvim-treesitter")
    local parsers = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "html",
      "css",
      "fish",
      "json",
      "scss",
      "toml",
      "yaml",
      "typescript",
      "javascript",
      "prisma",
      "bash",
      "sql",
      "go",
      "gomod",
      "gosum",
      "python",
      "dockerfile",
      "rust",
      "markdown",
      "markdown_inline",
      "tsx",
      "java",
    }
    ts.install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterMainSetup", { clear = true }),
      callback = function(args)
        -- Tenta iniciar o highlight nativo do Treesitter para o buffer
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
          if args.match ~= "cs" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end
      end,
    })

    local nodes_stack = {}

    local function select_node(node)
      if not node then
        return
      end
      local sr, sc, er, ec = node:range()
      vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
      vim.cmd("normal! v")
      if ec == 0 and er > sr then
        vim.api.nvim_win_set_cursor(0, { er, math.max(0, #vim.fn.getline(er) - 1) })
      else
        vim.api.nvim_win_set_cursor(0, { er + 1, math.max(0, ec - 1) })
      end
    end

    -- Inicia a seleção no modo normal com <C-Space>
    vim.keymap.set("n", "<C-Space>", function()
      nodes_stack = {}
      local node = vim.treesitter.get_node()
      if node then
        table.insert(nodes_stack, node)
        select_node(node)
      end
    end, { desc = "Treesitter: Iniciar seleção incremental" })

    -- Expande para o nó pai no modo visual com <C-Space>
    vim.keymap.set("x", "<C-Space>", function()
      local current = nodes_stack[#nodes_stack] or vim.treesitter.get_node()
      if current then
        local parent = current:parent()
        if parent then
          table.insert(nodes_stack, parent)
          select_node(parent)
        end
      end
    end, { desc = "Treesitter: Expandir seleção (node_incremental)" })

    -- Reduz para o nó anterior no modo visual com <M-Space>
    vim.keymap.set("x", "<M-Space>", function()
      if #nodes_stack > 1 then
        table.remove(nodes_stack)
        select_node(nodes_stack[#nodes_stack])
      end
    end, { desc = "Treesitter: Reduzir seleção (node_decremental)" })

    vim.treesitter.language.register("bash", "zsh")
    vim.treesitter.language.register("html", "hbs")

    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local ts_select = require("nvim-treesitter-textobjects.select")
    local ts_move = require("nvim-treesitter-textobjects.move")

    -- Keymaps de Textobjects: Select
    local select_maps = {
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    }
    for key, query in pairs(select_maps) do
      vim.keymap.set({ "x", "o" }, key, function()
        ts_select.select_textobject(query, "textobjects")
      end, { desc = "Select " .. query })
    end

    -- Keymaps de Textobjects: Move
    local move_maps = {
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    }
    for fn_name, maps in pairs(move_maps) do
      for key, query in pairs(maps) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          ts_move[fn_name](query, "textobjects")
        end, { desc = fn_name .. " " .. query })
      end
    end
  end,
}
