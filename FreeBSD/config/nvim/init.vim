source ~/.config/nvim/status.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/settings.vim

" treesitter settings

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
    },
  indent = {
    enable = true,
    },
}
EOF
