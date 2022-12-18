-- import plugin safely
local whichkey_setup, wk = pcall(require, "which-key")
if not whichkey_setup then
  return
end

local setup = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "FileTree" }, -- toggle file explorer
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["W"] = { "<cmd>wall<CR>", "Save all" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },

  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<cr>", "Find Buffer" }, -- find string under cursor in current working directory
    c = { "<cmd>Telescope command_history<cr>", "Command History" }, -- find string under cursor in current working directory
    C = { "<cmd>Telescope commands<cr>", "Vim Commands" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" }, -- find files within current working directory, respects .gitignore
    F = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    h = { "<cmd>Telescope search_history<cr>", "Search History" },
    H = { "<cmd>Telescope help_tags<cr>", "Help" }, -- list available help tags   l = { "<cmd>Telescope resume<cr>", "Last Search" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    s = { "<cmd>Telescope live_grep<cr>", "Find Text" }, -- find string in current working directory as you type
    S = { "<cmd>Telescope grep_string<cr>", "Find String" }, -- find string under cursor in current working directory
  },

  z = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}

wk.setup(setup)
wk.register(mappings, opts)
