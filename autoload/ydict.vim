function! ydict#VimOutCallback(chan, msg)
    echo a:msg
endfunction

function! ydict#GetVisualSelection()
    try
        let a_save = @a
        normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

function! ydict#GetAvailableCmd()
    for cmd in ['ydict']
        if executable(cmd)
            return cmd
        endif
    endfor

    return ""
endfunction
