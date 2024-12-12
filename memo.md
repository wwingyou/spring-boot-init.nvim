# Memo

## Useful APIs

```lua
-- Set option for the buffer
vim.api.nvim_set_option_value({key}, {value}, { buf = {buf} })

-- Get cursor position
local pos = vim.api.nvim_win_get_cursor({win})

-- Open new window
local win = vim.api.nvim_open_win({buf}, {focusable}, {
  relative = ...,
  width = ...,
  height = ...,
  col = ...,
  row = ...,
  anchor = ...,
  style = ...,
  border = ...,
})

-- Create buffer
local buf = vim.api.nvim_create_buf(false, true)

--- Set buffer's line
vim.api.nvim_buf_set_lines({buf}, start, end, true, { 'hello', 'world' })
```
