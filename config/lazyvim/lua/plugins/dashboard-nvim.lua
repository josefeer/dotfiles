local logo = [[









                                        Welcome Back, Jose                                       


]]

return {
	"nvimdev/dashboard-nvim",
	opts = {
		config = {
			header = vim.split(logo, "\n"),
		},
	},
}
