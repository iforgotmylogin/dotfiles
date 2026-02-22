return {
	"stevearc/oil.nvim",
	dependancies = {"nvim-tree/nvim-web-devicons"},
	config = function()
		require("oil").setup({
			default_file_explorer = true, --start up nvim with oil instead of netrw
			columns = { },
			keymaps = {
				["<C-h>"] = false,
				["<C-c>"] = false, -- prevents ctrl+c from closing out of oil
				["<M-h>"] = "actions.select_split",
				["q"] = "actions.close",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
		})

		-- keymaps for oil
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }) -- opens parent dir over current window
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle float oil" }) -- toggles floating oil

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.cursorline = true
			end,
		})

		
	end
}
