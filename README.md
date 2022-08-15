# number-representation.nvim

This simple plugin lets you get the binary, decimal and hexadecimal representation of the number under the cursor.

## Install
via [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'marcelTau/number-representation.nvim
```

## Keybinds
```vim
nnoremap <leader>x :lua require('number-representation').get_representation()<CR>
```
