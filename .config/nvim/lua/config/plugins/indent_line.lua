return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	event = { "VeryLazy" },
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = { char = "▏" },
		whitespace = { remove_blankline_trail = false },
		scope = {
			char = "▏",
			highlight = "EndOfBuffer",
			show_start = false,
			show_end = false,
			show_exact_scope = false,
		},
	},
}
