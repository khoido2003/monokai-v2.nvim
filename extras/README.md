# Monokai Pro V2 - Terminal Extras

This directory contains terminal emulator configuration files to match the Monokai Pro V2 colorscheme variants.

## Available Terminal Configurations

### Kitty
Configuration files for [Kitty terminal](https://sw.kovidgoyal.net/kitty/).

**Installation:**
```bash
# Copy the desired variant to your kitty config directory
cp extras/kitty/monokai-pro-*.conf ~/.config/kitty/monokai-pro.conf

# Then include it in your kitty.conf:
# include monokai-pro.conf
```

### Alacritty
Configuration files for [Alacritty terminal](https://alacritty.org/).

**Installation:**
```bash
# Copy the desired variant to your Alacritty config directory
cp extras/alacritty/monokai-pro-*.yml ~/.config/alacritty/monokai-pro.yml

# Then include it in your alacritty.yml:
# import:
#   - ~/.config/alacritty/monokai-pro.yml
```

### WezTerm
Configuration files for [WezTerm terminal](https://wezfurlong.org/wezterm/).

**Installation:**
Add the color scheme configuration to your `~/.config/wezterm/wezterm.lua`:

```lua
local wezterm = require 'wezterm'
return {
  color_schemes = {
    ["Monokai Pro"] = wezterm.color.load_scheme("extras/wezterm/monokai-pro-pro.toml"),
  },
  color_scheme = "Monokai Pro",
}
```

### Windows Terminal
Configuration for [Windows Terminal](https://github.com/microsoft/terminal).

**Installation:**
1. Open Windows Terminal Settings (JSON)
2. Add the color scheme to the `schemes` array in your `settings.json`
3. Set it as your default color scheme

### tmux
Configuration files for [tmux](https://github.com/tmux/tmux).

**Installation:**
```bash
# Copy the desired variant to your tmux config
cat extras/tmux/monokai-pro-*.conf >> ~/.tmux.conf

# Or source it directly:
# source-file ~/.config/tmux/monokai-pro.conf
```

### Fish Shell
Configuration for [Fish shell](https://fishshell.com/).

**Installation:**
```bash
# Copy the desired variant to your Fish config directory
cp extras/fish/monokai-pro-*.fish ~/.config/fish/conf.d/monokai-pro.fish
```

## Available Variants

- **classic** - The original Monokai theme
- **pro** - The signature Monokai Pro look (default)
- **light** - Light variant for bright environments
- **machine** - Industrial, high-contrast variant
- **octagon** - Geometric, structured appearance
- **ristretto** - Muted, coffee-inspired tones
- **spectrum** - Vibrant, colorful variant

## Notes

- Terminal colors are mapped from the Neovim colorscheme palette
- Some terminals may require restarting to apply changes
- Colors may appear slightly different due to terminal emulator rendering differences
