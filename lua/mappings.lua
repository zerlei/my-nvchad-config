---@type MappingsTable
local M = {}
M.general = {
  n = {
    ["J"] = {
      "3j",
      "Jump down 3 lines",
      opts = {
        nowait = true,
      },
    },
    ["K"] = {
      "3k",
      "Jump up 3 lines",
      opts = {
        nowait = true,
      },
    },
    ["L"] = {
      "$",
      "Move to line end",
      opts = {
        nowait = true,
      },
    },
    ["H"] = {
      "^",
      "Move to line begin",
      opts = {
        nowait = true,
      },
    },
    ["<C-z>"] = {
      "u",
      "use C-z for undo",
      opts = {
        nowait = true,
      },
    },
    ["p"] = {
      "p`]",
      "When pasted, move the cursor to the end of the yanked text",
      opts = {
        nowait = true,
      },
    },
    ["<c-v>"] = {
      '"*p`]',
      "ctrl+v for paste from system",
      opts = {
        nowait = true,
      },
    },
    ["<leader>p"] = {
      '"*p`]',
      "<leader>p for paste from system",
      opts = {
        nowait = true,
      },
    },
    ["<leader>"] = {
      "<Nop>",
      "Nop space"
    }
  },
  v = {
    ["J"] = {
      "3j",
      "Jump down 3 lines",
      opts = {
        nowait = true,
      },
    },
    ["K"] = {
      "3k",
      "Jump up 3 lines",
      opts = {
        nowait = true,
      },
    },
    ["L"] = {
      "$",
      "Move to line end",
      opts = {
        nowait = true,
      },
    },
    ["H"] = {
      "^",
      "Move to line begin",
      opts = {
        nowait = true,
      },
    },
    ["<c-v>"] = {
      'd<Esc>"*P`]',
      "ctrl+v for delete current text and paste from system",
      opts = {
        nowait = true,
      },
    },
    ["<leader>p"] = {
      'd<Esc>"*P`]',
      "<leader>p for delete current text and paste from system",
      opts = {
        nowait = true,
      },
    },
    ["<leader>"] = {
      "<Nop>",
      "Nop space"
    },
    ["<leader>y"] = {
    '"*y`><Esc>',
    "use <leader>y copy to system",
    opts = {
      nowait = true,
    },
  }

  },
  i = {
    ["<c-v>"] = {
      '<Esc>"*p`]a',
      "ctrl+v for quit i mode and  paste from system",
      opts = {
        nowait = true,
      },
    },
  },
  x = {
    ["y"] = {
      "y`>",
      "When yanked, move the cursor to the end of the selected text",
      opts = {
        nowait = true,
      },
    },
  },
}

if vim.g.vscode then
  local vscode = require "vscode-neovim"
  M.general.n["<leader>s"] = {
    function()
      vscode.call "bing-search.commandPaletteBingSearch"
    end,
    "vscode bing search",
    opts = {
      nowait = true,
    },
  }

  M.general.n["<leader>fm"] = {
    function()
      vscode.call "editor.action.formatDocument"
    end,
    "vscode format",
    opts = {
      nowait = true,
    },
  }

  M.general.n["<leader>e"] = {
    function()
      vscode.call "workbench.explorer.fileView.focus"
    end,
    "vscode explore view",
    opts = {
      nowait = true,
    },
  }
  M.general.n["<leader>c"] = {
    function()
      vscode.call "workbench.action.closeActiveEditor"
    end,
    "vscode close active editor",
    opts = {
      nowait = true,
    },
  }
else
  M.general.v["<C-c>"] = {
    '"*y`><Esc>',
    "use Ctrl+c copy to system",
    opts = {
      nowait = true,
    },
  }
  -- M.general.n["<a-f>"] = {
  --   function()
  --     vim.lsp.buf.format { async = true }
  --   end,
  --   "LSP formatting",
  -- }
end
-- more keybinds!

return M
