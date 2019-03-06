# vim-ydict
`vim-ydict` is a Vim plugin for [ydict](https://github.com/TimothyYe/ydict), it helps you to query words from Vim.

## Installation

vim-ydict relies on [ydict](https://github.com/TimothyYe/ydict), to use it, you need to install ydict first.

Use Homebrew to install ydict:

```bash
brew tap timothyye/tap
brew install timothyye/tap/skm
```
Or you can download it from the [release](https://github.com/TimothyYe/ydict/releases) page.

Now you can install `vim-ydict`.

### Plug

```text
Plug 'TimothyYe/vim-ydict'
```

## Settings

`vim-ydict` supports 3 different query modes:

1. Query words from current cursor position, supported by command `:Ydc`.
2. Query selected words from the select mode, supported by command `:Ydv`.
3. Query words from user's input, supported by command `:Yde`.

## Examples

Edit your `vimrc` file, add example settings.

1. Press `Ctrl+t` to query selected words:

```text
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
```

2. Use `<leader>+yc` to query words from current cursor position:

```text
nnoremap <leader>yc :<C-u>Ydc<CR>
```

3. Use `<leader>+yd` to input the words you want to query:

```text
noremap <leader>ye :<C-u>Yde<CR>
```

## License
The MIT License (MIT)