-- Source legacy Vimscript config if needed
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/oldinit.vim')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      require('onedark').load()
    end,
  },
  -- Lualine for statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = { theme = "onedark" }
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("bufferline").setup {
      options = {
        -- Optional: add your preferred options here
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        -- more options: https://github.com/akinsho/bufferline.nvim#configuration
      }
    }
  end,
},
  -- Alpha dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
"    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀:⡿⡇⠀⠀⢀⢀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠛⣟⣤⣀⠜⠈⠘⣄⣠⠜⡟⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣤⡀⢸⡠⠨⠄⠀⠠⡤⣤⡸⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣷⣭⣭⣭⣭⣭⣭⣭⡁⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠟⠉⠉⠉⠉⠉⠻⣿⣦⡀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡿⠋⠁⠀⠀⣀⣴⣶⣶⣶⣾⣿⣿⣦⡀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⡿⠋⠀⠀⢀⣤⣾⣿⣿⣿⣿⣷⣾⡿⠛⠻⣿⣦⣀⠀⠀",
"⠀⠀⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⡿⠋⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠙⣿⣷⠆",
"⠀⢸⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠴⢿⣿⣶⣦⣴⣾⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⢀⣠⣶⠿⠋⠀",
"⠀⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡛⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⠿⠿⠛⠁⠀⠀⠀",
"⢰⣿⣿⣿⣿⡿⠟⠛⣿⡆⠀⠀⠀⠀⢀⣼⡿⠋⠙⢿⣦⡀⠀⠀⠉⠙⠛⠿⢿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢸⣿⠟⠋⠉⠀⠀⠀⠸⣿⡀⠀⢀⣴⡿⠋⠀⠀⠀⠈⠻⣿⣦⡀⠀⠀⠀⠀⠀⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢸⡏⠀⠀⠀⢀⣠⣴⣾⣿⣇⣴⣿⠟⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣦⡀⠀⠀⠀⢈⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢸⣿⣀⣤⣾⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠠⢤⣤⣤⣤⡄⠀⠀⠈⠻⣿⣦⡀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠈⣿⣿⣿⣿⣿⣿⣿⡿⢻⣿⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣦⠀⠀⠀⠈⠻⣿⣦⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠹⣿⣿⣿⠿⠛⠁⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣷⡀⠀⠀⠀⠈⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠹⣿⡅⠀⠀⠀⢀⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣄⠀⠀⠀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠙⣿⣦⣠⣶⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣧⡀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠟⠋⠻⣿⣷⣄⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣤⣤⣤⣤⣤⣤⣤⣾⣿⣿⣿⣿⣷⣄⠙⢿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠓⠀⠉⠉⠉⠉⠉⠑⠀⠀⠀⠀⠀⠀⠀⠀",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "󰋚  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("g", "  Grep String", ":Telescope live_grep<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }
      dashboard.section.footer.val = "Any sufficiently advanced technology is equivalent to magic. - Arthur C. Clarke"
      require("alpha").setup(dashboard.config)
            -- Auto-open NvimTree after the dashboard loads
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.cmd("NvimTreeOpen")
        end,
      })
    end,
  },
  -- Telescope for dashboard buttons
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{}
    end,
  },
  -- GitHub Copilot for Neovim
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
  "puremourning/vimspector",
  lazy = false,
}
}, {
  install = { colorscheme = { "onedark" } },
  checker = { enabled = true },
})
-- Vimspector keymaps
-- Vimspector mappings with <leader> and numbers
vim.keymap.set('n', '<leader>1', ':call vimspector#Launch()<CR>', { desc = "Vimspector Launch" })
vim.keymap.set('n', '<leader>2', ':call vimspector#Reset()<CR>', { desc = "Vimspector Reset" })
vim.keymap.set('n', '<leader>3', ':call vimspector#Continue()<CR>', { desc = "Vimspector Continue" })
vim.keymap.set('n', '<leader>4', ':call vimspector#StepOver()<CR>', { desc = "Vimspector Step Over" })
vim.keymap.set('n', '<leader>5', ':call vimspector#StepInto()<CR>', { desc = "Vimspector Step Into" })
vim.keymap.set('n', '<leader>6', ':call vimspector#StepOut()<CR>', { desc = "Vimspector Step Out" })
vim.keymap.set('n', '<leader>8', ':call vimspector#ToggleBreakpoint()<CR>', { desc = "Vimspector Toggle Breakpoint" })
vim.keymap.set('n', '<leader>0', ':call vimspector#Reset()<CR>', { desc = "Vimspector Close Session" })
