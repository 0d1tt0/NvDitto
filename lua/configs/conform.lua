local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		black = {
			prepend_args = { "--fast" },
		},
	},
}

return options

