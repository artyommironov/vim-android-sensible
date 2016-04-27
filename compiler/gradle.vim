if exists('g:current_compiler')
    finish
endif

let g:current_compiler = 'gradle'
exec 'CompilerSet makeprg=./gradlew\ --quiet\ --console=plain\ -b\ ' . gradle#findGradleFile() . '\ install$*Debug'
CompilerSet errorformat=
    \%f:%l:%c-%*\\d:\ %m,
    \%t:%f:\ (%l\\,\ %c):\ %m,
    \%E%f:%l:\ %m,%-Z%p^,%-C%.%#,
    \%-G%.%#
