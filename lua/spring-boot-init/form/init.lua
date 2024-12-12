local M = {}

M.create_form = function(opts)
  return {
    props = nil,
    change = function(self, value)
      self.props = value
    end,
    show = function()
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
        'Spring Boot Initializer',
        '',
        'Name: ',
        'Package: ',
        'Deps: ',
        '',
        '',
        '       [OK]  [Cancel]',
      })

      local width = vim.api.nvim_win_get_width(0)
      local height = vim.api.nvim_win_get_height(0)
      local win = vim.api.nvim_open_win(buf, true, {
        relative = 'win',
        width = math.floor(width * 0.5),
        height = math.floor(height * 0.5),
        col = math.floor(width * 0.25),
        row = math.floor(height * 0.25),
        anchor = 'NW',
        style = 'minimal',
        border = 'solid'
      })

      vim.api.nvim_set_option_value('filetype', 'spring-boot-init', { buf = buf })
      vim.keymap.set('n', 'i', ':echo "Blocked!"<CR>', { buffer = buf })
      vim.keymap.set('n', '<tab>', function()
        local pos = vim.api.nvim_win_get_cursor(win)
        pos[1] = pos[1] + 1
        vim.api.nvim_win_set_cursor(win, pos)
      end, { buffer = buf })

      vim.keymap.set('n', '<CR>', function()
        local line = vim.api.nvim_buf_get_lines(buf, 2, 3, true)[1]
        print('input text:', string.sub(line, 7))
      end, { buffer = buf })
    end
  }
end

local form = M.create_form {}
form:show()
print('Before change:', form.props)
form:change(3)
print('After chnage:', form.props)

return M
