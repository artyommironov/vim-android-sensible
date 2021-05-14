if exists("current_compiler")
  finish
endif
let current_compiler = "gradle"
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let g:gradle_init_file = expand('<sfile>:p:h:h') . '/gradle/init.gradle.kts'
exec 'CompilerSet makeprg=./gradlew\ --no-daemon\ --console=plain\ -I\ ' . g:gradle_init_file . '\ -b\ ' . gradle#findGradleFile()

CompilerSet errorformat=
  \%f:%l:\ %tarn:\ %m,
  \%f:%l:%c\ %m,
  \%f:%l:%c:\ %m,
  \%f:%l:%c:\ %t%*[^:]:\ %m,
  \%f:%l:%c-%*\\d:\ %m,
  \%t:%f:\ (%l\\,\ %c):\ %m,
  \%E%f:%l:\ %m,%-Z%p^,%-C%.%#,
  \%-G%.%#
