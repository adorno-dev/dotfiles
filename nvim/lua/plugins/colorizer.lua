function Colorizer()
    local exists, colorizer = pcall(require, "colorizer")
    if not exists then
        return
    else
        colorizer.setup(
            {'*';},
            {
                names = true;   -- "Name" codes like "blue"
                rgbfn = true;   -- CSS rgb() / rgba() functions
                hsl_fn = true;  -- CSS hsl() / hsla() functions
                css = true;     -- Enable all css features
                css_fn = true;  -- Enable all css functions
                RGB = true;     -- RGB hex codes
                RRHHBB = true;  -- RRGGBB hex codes
            }
        )
    end
end

Colorizer()
