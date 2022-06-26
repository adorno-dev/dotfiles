function Installer()
	local exists, installer = pcall(require, "nvim-lsp-installer")
	if not exists then
		return
	else
        local handler = require("languages.handler")
        handler.setup()
		installer.on_server_ready(function(server)
			local opts = { on_attach = handler.on_attach, capabilities = handler.capabilities }
			server:setup(opts)
		end)
	end
end

Installer()
