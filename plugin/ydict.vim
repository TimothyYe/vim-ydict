if exists('v:true')
    let s:translator = {'stdout_buffered': v:true, 'stderr_buffered': v:true}
else
    let s:translator = {'stdout_buffered': 1, 'stderr_buffered': 1}
endif

function! s:translator.on_stdout(jobid, data, event)
    if !empty(a:data) | echo a:data | endif
endfunction
let s:translator.on_stderr = function('s:translator.on_stdout')

function! s:translator.start(lines)
    let cmd = ydict#GetAvailableCmd()
    if empty(cmd)
        echoerr "[Vim-Ydict] [Error]: ydict neeeds to be installed! Please visit: https://github.com/TimothyYe/ydict to install it."
        return -1
    endif

    let cmd = printf("%s %s %s", cmd, "-q", a:lines)
    if exists('*jobstart')
        return jobstart(cmd, self)
    elseif exists('*job_start') && ! has("gui_macvim")
        return job_start(cmd, {'out_cb': "ydict#VimOutCallback"})
    else
        echo system(cmd)
    endif
endfunction

function! s:YdictVisualTranslate()
    call s:translator.start(ydict#GetVisualSelection())
endfunction

function! s:YdictCursorTranslate()
    call s:translator.start(expand("<cword>"))
endfunction

function! s:YdictEnterTranslate()
    let word = input("Please enter the word: ")
    redraw!
    call s:translator.start(word)
endfunction

command! Ydv call <SID>YdictVisualTranslate()
command! Ydc call <SID>YdictCursorTranslate()
command! Yde call <SID>YdictEnterTranslate()
