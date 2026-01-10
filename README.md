#### Vim plugin for nature language
https://github.com/nature-lang/nature  

Install using [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'angluca/nature.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

au filetype nature call LspAddServer([#{
            \    name: 'nature',
            \    filetype: ['nature'],
            \    path: 'nls',
            \  }])
```

