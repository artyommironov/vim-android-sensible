if exists('g:current_compiler')
    finish
endif

let g:current_compiler = 'gradle'
exec 'CompilerSet makeprg=./gradlew\ --quiet\ --no-daemon\ --console=plain\ -b\ ' . gradle#findGradleFile()
CompilerSet errorformat=
    \%f:%l:%c:\ %t%*[^:]:\ %m,
    \%f:%l:%c-%*\\d:\ %m,
    \%t:%f:\ (%l\\,\ %c):\ %m,
    \%E%f:%l:\ %m,%-Z%p^,%-C%.%#,
    \%-G%.%#
