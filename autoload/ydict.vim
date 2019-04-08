function! ydict#VimOutCallback(channel)
    let append_s=""
    while ch_status(a:channel, {'part': 'out'}) == 'buffered'
          let  append_s .=  ch_read(a:channel) . "\n"
    endwhile
    echo append_s
    call input('Press ENTER to continue')
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
