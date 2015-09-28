if exists('g:current_compiler')
  finish
endif

let g:current_compiler = 'gradle'
exec 'CompilerSet makeprg=./gradlew\ --no-color\ --daemon\ --quiet\ -b\ ' . gradle#findGradleFile() . '\ installDebug'
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
