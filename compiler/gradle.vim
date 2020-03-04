if exists('g:current_compiler')
    finish
endif

let g:current_compiler = 'gradle'
let g:gradle_init_file = expand('<sfile>:p:h:h') . '/gradle/init.gradle.kts'
exec 'CompilerSet makeprg=./gradlew\ --no-daemon\ --console=plain\ -I\ ' . g:gradle_init_file . '\ -b\ ' . gradle#findGradleFile()
CompilerSet errorformat=
    \%f:%l:\ %tarn:\ %m,
    \%f:%l:%c:\ %m,
    \%f:%l:%c:\ %t%*[^:]:\ %m,
    \%f:%l:%c-%*\\d:\ %m,
    \%t:%f:\ (%l\\,\ %c):\ %m,
    \%E%f:%l:\ %m,%-Z%p^,%-C%.%#,
    \%-G%.%#
