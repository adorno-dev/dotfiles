# LOCAL/CUSTOM BINS
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.config/dwm/scripts

# .NET PLATFORM
export DOTNET_ROOT=/opt/dotnet
export DOTNET_TOOLS=$HOME/.dotnet/tools
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_TOOLS

# GTK/QT COMPATIBILITY
export QT_QPA_PLATFORMTHEME=qt5ct

# FREETYPE PROPERTIES
#export FREETYPE_PROPERTIES="cff:no-stem-darkening=0"
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=25"
#export FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
#export FREETYPE_PROPERTIES="truetype:interpreter-version=40 cff:no-stem-darkening=1 autofitter:warping=1"
