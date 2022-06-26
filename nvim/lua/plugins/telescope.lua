function Telescope()
    local exists, telescope = pcall (require, "telescope")
    if not exists then
        return
    else
        telescope.setup({})
    end
end

Telescope()
