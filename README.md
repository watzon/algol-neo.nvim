# algol-neo.nvim

A Neovim colorscheme inspired by the ALGOL programming language's emphasis on typography, offering both light and dark variants.

## Features

- Light and dark variants
- Emphasis on typographic features (bold, italic, underline) for clear code distinction
- Minimal color usage focusing on readability
- Support for popular plugins (coming soon)

## Requirements

- Neovim >= 0.7.0

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'watzon/algol-neo.nvim',
    config = function()
        require('algol-neo').setup({
            variant = "light" -- or "dark"
        })
    end
}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    'watzon/algol-neo.nvim',
    opts = {
        variant = "light" -- or "dark"
    }
}
```

## Configuration

```lua
require('algol-neo').setup({
    variant = "light", -- "light" or "dark"
    -- More options coming soon
})
```

## Toggle between variants

Add this to your config to create a command that toggles between light and dark variants:

```lua
vim.api.nvim_create_user_command('AlgolNeoToggle', function()
    local theme = require('algol-neo')
    local new_variant = theme.config.variant == "light" and "dark" or "light"
    theme.setup({ variant = new_variant })
end, {})
```

## Screenshots

[Add screenshots here]

## License

MIT

## Credits

Inspired by the ALGOL programming language and the Chroma syntax highlighter's ALGOL theme.
