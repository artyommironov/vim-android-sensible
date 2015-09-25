if exists('g:current_compiler')
  finish
endif

let g:current_compiler = 'gradle'
CompilerSet makeprg=./gradlew\ --daemon\ --quiet\ installDebug
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
