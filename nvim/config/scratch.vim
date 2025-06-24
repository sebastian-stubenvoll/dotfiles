function! OpenScratchBuffer()
    " Create a new scratch buffer
    let buf = nvim_create_buf(0, 1) " 0 means no name, 1 means scratch buffer
    " Set the buffer options
    call nvim_buf_set_option(buf, 'filetype', 'tex')
    call nvim_buf_set_option(buf, 'conceallevel', 2) " Minimum conceal level

    " Split the window below and open the new buffer
    execute 'below split'
    execute 'buffer ' . buf

    " Insert the display math environment
    call nvim_buf_set_lines(buf, 0, 1, 0, ['$$', '', '$$'])
    " Move the cursor to the position between the math delimiters
    call nvim_win_set_cursor(0, [2, 1]) " Move to line 2, column 1
endfunction

" Map a key to open the scratch buffer (e.g., <leader>s)
nnoremap <leader>s :call OpenScratchBuffer()<CR>

