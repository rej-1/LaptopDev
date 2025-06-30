-- Vimspector keymaps using F-keys
vim.keymap.set('n', '<F5>', ':VimspectorLaunch<CR>', { desc = 'Vimspector Launch' })
vim.keymap.set('n', '<F6>', ':VimspectorReset<CR>', { desc = 'Vimspector Reset' })
vim.keymap.set('n', '<F8>', ':call vimspector#ToggleBreakpoint()<CR>', { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F9>', ':call vimspector#Continue()<CR>', { desc = 'Continue' })
vim.keymap.set('n', '<F10>', ':call vimspector#StepOver()<CR>', { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', ':call vimspector#StepInto()<CR>', { desc = 'Step Into' })
vim.keymap.set('n', '<F12>', ':call vimspector#StepOut()<CR>', { desc = 'Step Out' })
