--setup rust keybinds

-- Open runnables
vim.keymap.set("n", "<leader>rr", require("rust-tools").runnables.runnables, { desc = "Open Runnables" })

-- Open hover actions
vim.keymap.set("n", "<leader>ra", require("rust-tools").hover_actions.hover_actions, { desc = "Open Hover Actions" })

-- Open Cargo TOML file
vim.keymap.set(
	"n",
	"<leader>rt",
	require("rust-tools").open_cargo_toml.open_cargo_toml,
	{ desc = "Open Cargo TOML File" }
)

-- Move item down
vim.keymap.set("n", "<leader>rj", function()
	local up = false
	require("rust-tools").move_item.move_item(up)
end, { desc = "Move Item Down" })

-- Move item up
vim.keymap.set("n", "<leader>rk", function()
	local up = true
	require("rust-tools").move_item.move_item(up)
end, { desc = "Move Item Up" })
