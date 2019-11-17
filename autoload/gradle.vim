function! gradle#findGradleFile()
    let l:file = ""
    let l:path = expand("%:p:h")
    if len(l:path) <= 0
        let l:path = getcwd()
    endif
    let l:file = findfile("build.gradle", l:path . ";$HOME")
    if len(l:file) == 0
        let l:file = findfile('build.gradle.kts', l:path . ';$HOME')
    endif
    if len(l:file) == 0
        return ""
    endif
    return copy(fnamemodify(l:file, ":p"))
endfunction

function! gradle#isGradleProject()
    return filereadable(gradle#findGradleFile())
endfunction
