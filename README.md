# What is this?
Minimal vim plugin for Android projects

# Installation
Vim 8 built-in package manager
```
git clone https://github.com/artyommironov/vim-android-sensible.vim ~/.vim/pack/plugins/start/vim-android-sensible.vim
```
NeoBundle/Vundle/vim-plug
```
NeoBundle 'artyommironov/vim-android-sensible'
Plugin 'artyommironov/vim-android-sensible'
Plug 'artyommironov/vim-android-sensible'
```

# Usage
```
:make installDebug
:make test
```

# Features
 - automatically detects if file belongs to gradle project
 - custom compiler
 - errorformat for java, kotlin and unit test errors
