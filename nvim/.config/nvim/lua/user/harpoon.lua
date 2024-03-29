local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
	return
end

local mark_status_ok, mark = pcall(require, "harpoon.mark")
if not mark_status_ok then
	return
end

local ui_status_ok, ui = pcall(require, "harpoon.ui")
if not ui_status_ok then
	return
end

harpoon.setup({
  tabline = false,
	menu = {
		width = vim.api.nvim_win_get_width(0) - 60,
	},
})

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>h1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<leader>h5", function()
	ui.nav_file(5)
end)

-- vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
-- vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
-- vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
-- vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
-- vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

