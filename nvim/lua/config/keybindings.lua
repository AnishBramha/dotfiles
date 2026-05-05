-- keymaps help buffer
local function show_styled_popup()

  -- define highlights 
  vim.api.nvim_set_hl(0, 'PopupTitle', { link = 'Title' })
  vim.api.nvim_set_hl(0, 'PopupText', { link = 'String' })
  vim.api.nvim_set_hl(0, 'PopupInfo', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'PopupClose', { link = 'WarningMsg' })
  vim.api.nvim_set_hl(0, 'MyFloatBorder', { link = 'Function' })
  vim.api.nvim_set_hl(0, 'MyFloatBg', { link = 'Pmenu' })

  -- namespace for buffer-local highlights
  local ns_id = vim.api.nvim_create_namespace('my_popup_ns')



-- content
-- All lines are 61 chars long for alignment.

  local lines = {
   '                                                        ',
   '       _____ _____ _____ _____ _____ _____ _____        ',
   '      || K ||| E ||| Y ||| M ||| A ||| P ||| S ||     ',
   '      ||___|||___|||___|||___|||___|||___|||___||     ',
   '      |/___\\|/___\\|/___\\|/___\\|/___\\|/___\\|/___\\|',
  '                                                          ',
  '  <C-h>          → Load this buffer                       ',
  '  q, <Esc>       → Close this buffer                      ',
  '                                                          ',
  ' ─────────── NORMAL (cursor) (default # = 1) ────────── ',
  '                                                          ',
  '  <Esc>, <C-c>   → Enter normal mode                     ',
  '  0              → Move to start of line                 ',
  '  $              → Move to end of line                   ',
  '  ^              → Move to first non-blank char in line  ',
  '  %              → Jump to matching bracket/paren/brace  ',
  '  #w             → Move # units forward to start         ',
  '  #b             → Move # units backward to start        ',
  '  #e             → Move # units backward to end          ',
  '  #W             → Move # words forward to start         ',
  '  #B             → Move # words backward to start        ',
  '  #E             → Move # words backward to end          ',
  '  }              → Jump to next blank line               ',
  '  {              → Jump to previous blank line           ',
  '  gg             → Go to start of file                   ',
  '  G              → Go to end of file                     ',
  '  #G, #gg        → Go to line #                          ',
  '  gd             → Go to local declaration               ',
  '  gD             → Go to global declaration              ',
  '  <C-f>          → Move down one screen                  ',
  '  <C-b>          → Move up one screen                    ',
  '  <C-d>          → Move down half a screen               ',
  '  <C-u>          → Move up half a screen                 ',
  '  zz             → Centre the screen around the cursor   ',
  '  #h, #j, #k, #l → Move cursor LDUR by # places          ',
  '  <M-j>, <M-k>   → Move line down, up                    ',
  '  i              → Insert under cursor                   ',
  '  I              → Insert at first nonblank char in line ',
  '  a              → Insert after cursor                   ',
  '  A              → Insert at end of line                 ',
  '  s              → Delete under cursor and insert        ',
  '  S              → Delete line and insert                ',
  '  o              → Open below and insert                 ',
  '  O              → Open above and insert                 ',
  '  v              → Enter visual mode                     ',
  '  V              → Enter visual-line mode                ',
  '  <C-v>          → Enter visual-block mode               ',
  '  gh             → Enter select mode                     ',
  '  gH             → Enter select-line mode                ',
  '  g<C-h>         → Enter select-block mode               ',
  '  <Space-e>      → Open diagnostics buffer               ',
  '                                                          ',
  ' ───────────────── NORMAL (Editing) ─────────────────── ',
  '                                                          ',
  '  <r-Space>      → Wipe under cursor                     ',
  '  x              → Delete under cursor                   ',
  '  s              → Delete under cursor and insert        ',
  '  daw            → Delete unit                           ',
  '  daW            → Delete word                           ',
  '  dd             → Delete line                           ',
  '  d$/D           → Delete line from cursor               ',
  '  #dd            → Delete # lines                        ',
  '  ddp            → Transpose lines                       ',
  '  dwwP           → Transpose words                       ',
  '  xp             → Transpose letters                     ',
  '  yl             → Yank under cursor                     ',
  '  yy             → Yank line                             ',
  '  cc, S          → Change line                           ',
  '  C              → Change line after cursor              ',
  '  ce             → Change word                           ',
  '  ~              → Toggle case under cursor              ',
  '  guiw           → Make inner word lowercase             ',
  '  guiw           → Make inner word lowercase             ',
  '  guu            → Make line lowercase                   ',
  '  gUU            → Make line uppercase                   ',
  '  >>             → Indent line                           ',
  '  >%             → Indent block under brace/paren        ',
  '  <<             → De-indent line                        ',
  '  ==             → Auto-indent line                      ',
  '  =G             → Auto-indent until EOF                 ',
  '  gg=G           → Auto-indent entire file               ',
  '  <%             → De-indent under brace/paren/bkt       ',
  '  p              → Put after cursor                      ',
  '  P              → Put before cursor                     ',
  '  u              → Undo                                  ',
  '  U              → Undo line                             ',
  '  <C-r>          → Redo                                  ',
  '  .              → Repeat last change                    ',
  '  r              → Replace under cursor                  ',
  '  R              → Enter Replace mode                    ',
  '  J              → Join line below to current line       ',
  '  s              → Delete letter under cursor and insert ',
  '  gi             → Jump to last insert mark              ',
  '  ds<c>          → Delete surrounding char <c>           ',
  '  cs<c1><c2>     → Change surrounding char <c1> to <c2>  ',
  '  ysiw<c>        → Insert surrounding char <c>           ',
  '  dst            → Delete surrounding HTML tag           ',
  '  K              → Open help for word under cursor       ',
  '  rN             → Rename & refactor symbol under cursor ',
  '  ZZ             → Save (if modifiable) and quit buffer  ',
  '                                                          ',
  ' ───────────────── NORMAL (Search) ────────────────────  ',
  '                                                          ',
  '  /              → Search                                ',
  '  ?              → Trace                                 ',
  '  f              → Search word in line                   ',
  '  F              → Trace word in line                    ',
  '  ;              → Repeat last find                      ',
  '  *              → Search word under cursor              ',
  '  #              → Trace word under cursor               ',
  '  n              → Repeat last find forward              ',
  '  N              → Repeat last find backward             ',
  '  gx             → Open URL under cursor in browser      ',
  '                                                          ',
  ' ─────────────── NORMAL (Buffers & Tabs) ───────────────  ',
  '                                                          ',
  '  <C-j>          → Open integrated terminal               ',
  '  <C-t>          → Switch buffer                         ',
  '  <leader>t      → Files for new tab (↑↓←→ & <Tab>)      ',
  '  <C-^>          → Switch to previous buffer             ',
  '  gt             → Go to next tab                        ',
  '  gT             → Go to previous tab                    ',
  '  gt#            → Go to tab # from left                 ',
  '  <leader>q      → Write file and open netrw in pwd      ',
  '  <leader>pf     → Search files in pwd                   ',
  '  <leader>ps     → Search string in files in pwd         ',
  '  <leader>gpf    → Search files globally                 ',
  '  <leader>gps    → Search string in files globally       ',
  '  <leader>lbf    → Fuzzy find in current buffer          ',
  '  <leader>bf     → Show list of open buffers             ',
  '  <leader>u      → Open undo tree                        ',
  '  <leader>gg     → Open fuGITive buffer                  ',
  '                                                          ',
  ' ────────────────── NORMAL (Macros) ────────────────────  ',
  '                                                          ',
  '  qa             → Record macro a                        ',
  '  q              → Save recorded macro a                 ',
  '  @a             → Play macro a                          ',
  '  @@             → Play last macro                       ',
  '                                                          ',
  ' ───────────────────── INSERT ─────────────────────────  ',
  '                                                          ',
  '  <C-w>          → Delete previous word                  ',
  '  <C-u>          → Delete line before cursor             ',
  '  <C-k>          → Insert special character              ',
  '  <C-t>          → Indent line                           ',
  '  <C-d>          → De-indent line                        ',
  '  <C-xl>         → Autocomplete line                     ',
  '                                                          ',
  ' ───────────────────── VISUAL ─────────────────────────  ',
  '                                                          ',
  '  gv             → Retrieve previous selection           ',
  '  >              → Indent selection                      ',
  '  <              → De-indent selection                   ',
  '  o              → Go to other end of selection          ',
  '  u              → Make selection lowercase              ',
  '  U              → Make selection uppercase              ',
  '  ~              → Toggle case on selection              ',
  '  g<C-a>         → Increment numbers in selection by one ',
  '  <M-j>, <M-k>   → Move selection down, up               ',
  '  ga<delimiter>  → Align delimiter in selection          ',
  '  <C-g>          → Toggle select mode                    ',
  '                                                          ',
  ' ───────────────────── COMMAND ────────────────────────  ',
  '                                                          ',
  '  :#             → Go to line #                          ',
  '  :<sel>d+       → Delete selection to clipboard         ',
  '  :<sel>y+       → Yank selection to clipboard           ',
  '  ⌘v             → Put from clipboard under cursor       ',
  '  :s/old/new     → Replace first occurence in line       ',
  '  :s/old/new/g   → Replace all occurences in line        ',
  '  :s/old/new/gc  → Ask & replace all occurences in line  ',
  '  :%s/old/new    → Replace all occurences in line        ',
  '  :%s/old/new/g  → Replace all occurences globally       ',
  '  :%s/old/new/gc → Ask & replace all occurences globally ',
  '  :tabe          → Open a blank tab                      ',
  '  :tabe <file>   → Open file in blank tab                ',
  '  :tabdo <cmd>   → Run cmd on all open tabs              ',
  '  :w             → Write file                            ',
  '  :q             → Quit (fails on unsaved buffers)       ',
  '  :x, :wq        → Write and quit                        ',
  '  :q!            → Quit without saving                   ',
  '  :e <file>      → Edit (open) file                      ',
  '  :ls            → List all open buffers                 ',
  '  :h <topic>     → Open help for <topic>                 ',
  '  :!<cmd>        → Run external shell command            ',
  '  q:             → Open command history buffer           ',
  '                                                          ',
  ' ────────────────────── TERMINAL ──────────────────────  ',
  '                                                          ',
  '  <Esc>          → Exit Terminal mode                    ',
  '  <Esc><Esc>     → Exit terminal                         ',
  '  <Esc><M-q      → Kill terminal                         ',
  '                                                          ',
  ' ────────────────────── FUGITIVE ──────────────────────  ',
  '                                                          ',
  '  <leader>gg     → Open fuGITive buffer                  ',
  '  -              → Stage/unstage changes                 ',
  '  cc             → Commit changes                        ',
  '  :Git push      → Push changes (upstream first time)    ',
}


  -- calculate window geometry 

  local height = #lines
  local width = vim.fn.strwidth(lines[1])
  local screen_height = vim.o.lines
  local screen_width = vim.o.columns
  local row = math.floor((screen_height - height) / 2)
  local col = math.floor((screen_width - width) / 2)

  -- create buffer

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'readonly', true)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)

  -- window options

  local win_opts = {

    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',

    -- border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    -- 1 = top-left, 2 = top, 3 = top-right, 4 = right,
    -- 5 = bottom-right, 6 = bottom, 7 = bottom-left, 8 = left

    focusable = true,
    zindex = 100,
  }

  -- create window
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- prevent infinite scrolling
  vim.api.nvim_win_set_option(win, 'scrolloff', 0)

  -- prevent wrapping
  vim.api.nvim_win_set_option(win, 'wrap', false)

  -- apply colours to window and text
  vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:MyFloatBg,FloatBorder:MyFloatBorder')

  -- apply colours to buffer contents

  for line_idx, line in ipairs(lines) do
    local lnum = line_idx - 1

    -- Colour the 'KEYMAPS' ASCII art

    if lnum >= 0 and lnum <= 4 then

      vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapHeader', lnum, 0, -1)

      if lnum == 2 then

        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 9, 10)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 15, 16)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 21, 22)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 27, 28)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 33, 34)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 39, 40)
        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapTitle', lnum, 45, 46)

      end
    end

    -- Colour the headers

    if line:match('─') then

      vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapHeader', lnum, 0, -1)
    end

    -- Colour the keymap-arrow-description text

    local arrow_start, arrow_end = line:find('→')

    if arrow_start then
      vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapArrow', lnum, arrow_start - 1, arrow_end)

      local desc_start = line:match('%s*()', arrow_end + 1)

      if desc_start then

        vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapDesc', lnum, desc_start - 1, -1)
      end

      local key_start_match = line:match('^%s*()')

      if key_start_match then

        local key_start_col = key_start_match - 1

        local pre_arrow_str = line:sub(1, arrow_start - 1)
        local key_text = pre_arrow_str:match('^%s*(.-)%s*$')

        if key_text then

          local key_end_col = key_start_col + #key_text
          vim.api.nvim_buf_add_highlight(buf, ns_id, 'KeymapKey', lnum, key_start_col, key_end_col)

        end
      end
    end
  end

  -- Colour the window background and borders
  vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:MyFloatBg,FloatBorder:MyFloatBorder')

  -- Colour the buffer text
  vim.api.nvim_set_hl(0, 'PopupTitle', {link = 'Title'})
  vim.api.nvim_set_hl(0, 'PopupText', {link = 'String'})
  vim.api.nvim_set_hl(0, 'PopupInfo', {link = 'Comment'})
  vim.api.nvim_set_hl(0, 'PopupClose', {link = 'WarningMsg'})
  vim.api.nvim_set_hl(0, 'MyFloatBorder', {link = 'Function'})
  vim.api.nvim_set_hl(0, 'MyFloatBg', {link = 'Pmenu'})

  vim.api.nvim_set_hl(0, 'KeymapTitle', { link = 'Title' , bold = true})

  local keymap_hl = vim.api.nvim_get_hl_by_name('String', true)
  keymap_hl.link = nil
  keymap_hl.bold = true
  vim.api.nvim_set_hl(0, 'KeymapHeader', keymap_hl)

  local keymap_hl = vim.api.nvim_get_hl_by_name('Identifier', true)
  keymap_hl.link = nil
  keymap_hl.bold = true
  vim.api.nvim_set_hl(0, 'KeymapKey', keymap_hl)
  
  local keymap_hl = vim.api.nvim_get_hl_by_name('Operator', true)
  keymap_hl.link = nil
  keymap_hl.bold = true
  vim.api.nvim_set_hl(0, 'KeymapArrow', keymap_hl)

  vim.api.nvim_set_hl(0, 'KeymapDesc', { link = 'Comment' })


  -- keymap to close
  vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = buf, silent = true })
  vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', { buffer = buf, silent = true })
end


-- keymap to trigger
vim.keymap.set('n', '<C-h>', show_styled_popup, { desc = 'Show styled help popup' })
vim.api.nvim_create_user_command('Keymaps', show_styled_popup, {desc = 'Show styled help popup'})





