return {
	"gelguy/wilder.nvim",
	event = "CmdlineEnter", -- lazy-load when entering command-line mode
	config = function()
		local wilder = require("wilder")
		wilder.setup({
      modes = { ":", "/", "?" },
      next_key = "<Down>",
      previous_key = "<Up>",
      accept_key = "<Right>",
      reject_key = "<Left>"
    })

		-- Use popup menu renderer with rounded border
		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				border = "rounded",
				highlights = {
					border = "Normal", -- or "FloatBorder"
				},
			}))
		)

		-- Optional: add a highlighter (fuzzy matching)
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1, -- enable fuzzy matching
				}),
				wilder.search_pipeline()
			),
		})
	end
}
