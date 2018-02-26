# What is this?

Vim plugin for Gradle based Android projects

# Installation

NeoBundle/Vundle/vim-plug
```vim
    NeoBundle 'kazufukurou/vim-android-sensible'
    Plugin 'kazufukurou/vim-android-sensible'
    Plug 'kazufukurou/vim-android-sensible'
```
pathogen
```
    git clone https://github.com/kazufukurou/vim-android-sensible.vim ~/.vim/bundle/vim-android-sensible.vim
```

# Usage

```
:make installDebug
```

# Features

 - Automatically detects if file belongs to Gradle based project
 - Sets custom compiler
 - Sets errorformat for java and kotlin errors
