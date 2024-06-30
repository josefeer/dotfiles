local logo = [[









         -------------------        
        < Welcome Back, Jose >      
         -------------------        
                \   ^__^            
                 \  (oo)\_______    
                    (__)\       )\/\
                        ||----w |   
                        ||     ||   
                                    


]]

return {
	"nvimdev/dashboard-nvim",
	opts = {
		config = {
			header = vim.split(logo, "\n"),
		},
	},
}
