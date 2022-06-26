function Signature()
    local exists, signature = pcall(require, "lsp_signature")
    if not exists then
        return
    else
        signature.setup({})
    end
end

Signature()
