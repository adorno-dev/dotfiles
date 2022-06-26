function ColorScheme()
    local cmd = vim.cmd
    cmd [[
        try

            if exists('+termguicolors')
              let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
              let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
              set termguicolors
            endif

            colorscheme gruvbox

            highlight Normal guibg=NONE ctermbg=NONE
            highlight EndOfBuffer guibg=NONE ctermbg=NONE

        catch /^Vim\%((\a\+)\)\=:E185/

            colorscheme default
            set background=dark

        endtry
    ]]
end

ColorScheme()
