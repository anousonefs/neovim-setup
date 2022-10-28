local status, lualine = pcall(require, "lualine")
local lualine_nightfly = require("lualine.themes.nightfly")
if (not status) then
  print("import lualine failed")
  return
end

-- new colors for theme
local new_colors = {
  blue = "#4e81e6",
  green = "#2fc441",
  violet = "#FF61EF",
  yellow = "#cff71b",
  black = "#000000",
  orange = "#FFA500",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.orange
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colors.yellow,
    fg = new_colors.black, -- black
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    --[[ theme = 'solarized_dark', ]]
    theme = lualine_nightfly,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {},
    refresh = { -- sets how often lualine should refreash it's contents (in ms)
      statusline = 1000, -- The refresh option sets minimum time that lualine tries
      tabline = 1000, -- to maintain between refresh. It's not guarantied if situation
      winbar = 1000 -- arises that lualine needs to refresh itself before this time
      -- Also you can force lualine's refresh by calling refresh function
      -- like require('lualine').refresh()
    }
  },
  sections = {
    lualine_a = {
      {
        'mode',
        icons_enabled = false,
      },
      {
        'branch',
        icons_enabled = true,
        icon = {
          '',
          color = {
            fg = 'black'
          },
          align = 'right'
        },
        separator = { right = '' },
        --[[ section_separators = { left = '', right = '' }, ]]
        --[[ component_separators = { left = '', right = '' }, ]]
        cond = nil,
        --[[ color = { fg = 'pink', gui = 'italic' }, ]]
        type = nil,
        padding = 1,
        fmt = nil,
        on_click = nil,
      },
    },
    lualine_b = {
      {
        'diff',
        colored = true, -- Displays a colored diff status if set to true
        diff_color = {
          -- Same color values as the general color option can be used here.
          added    = 'DiffAdd', -- Changes the diff's added color
          modified = 'DiffChange', -- Changes the diff's modified color
          removed  = 'DiffDelete', -- Changes the diff's removed color you
        },
        symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
        source = nil, -- A function that works as a data source for diff.
        -- It must return a table as such:
        --   { added = add_count, modified = modified_count, removed = removed_count }
        -- or nil on failure. count <= 0 won't be displayed.
      },
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = true, -- Display new file status (new file means no write after created)
        shorting_target = 40,
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        symbols = {
          modified = ' [+]', -- Text to show when the file is modified.
          readonly = ' [-]', -- Text to show when the file is non-modifiable or readonly.
          unnamed = ' [No Name]', -- Text to show for unnamed buffers.
          newfile = ' [New]', -- Text to show for new created file before first writting
        }
      },
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        },
        update_in_insert = true,
        always_visible = false, -- Show diagnostics even if there are none.
      },
      --[[ 'filetype' ]]
    },
    lualine_x = {
      'encoding',
      --[[ 'fileformat', ]]
      {
        'filetype',
        colored = true, -- Displays filetype icon in color if set to true
        icon_only = false, -- Display only an icon for filetype
        icon = { align = 'left' }, -- Display filetype icon on the right hand side
      },
      'filesize',
      {
        'tabs',
        max_length = vim.o.columns / 3, -- Maximum width of tabs component.
        -- Note:
        -- It can also be a function that returns
        -- the value of `max_length` dynamically.
        mode = 0, -- 0: Shows tab_nr
        -- 1: Shows tab_name
        -- 2: Shows tab_nr + tab_name
        tabs_color = {
          -- Same values as the general color option can be used here.
          --[[ active = 'lualine_{section}_normal', -- Color for active tab. ]]
          --[[ inactive = 'lualine_{section}_inactive', -- Color for inactive tab. ]]
        },
      },
      --[[ { ]]
      --[[   'windows', ]]
      --[[   mode = 2 ]]
      --[[ } ]]
    },
    lualine_y = {
      'progress',
    },
    lualine_z = {
      'location'
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = { 'location' },
    lualine_y = {
    },
    lualine_z = {
    }
  },
  tabline = {
    --[[ lualine_a = { ]]
    --[[   'buffers', ]]
    --[[ }, ]]
    --[[ lualine_b = {}, ]]
    --[[ lualine_c = { ]]
    --[[ }, ]]
    --[[ lualine_x = { ]]
    --[[ }, ]]
    --[[ lualine_y = {}, ]]
    --[[ lualine_z = { 'tabs' }, ]]
  },
  --[[ winbar = { ]]
  --[[   lualine_a = {}, ]]
  --[[   lualine_b = {}, ]]
  --[[   lualine_c = { 'filename' }, ]]
  --[[   lualine_x = {}, ]]
  --[[   lualine_y = {}, ]]
  --[[   lualine_z = {} ]]
  --[[ }, ]]
  --[[ inactive_winbar = { ]]
  --[[   lualine_a = {}, ]]
  --[[   lualine_b = {}, ]]
  --[[   lualine_c = { 'filename' }, ]]
  --[[   lualine_x = {}, ]]
  --[[   lualine_y = {}, ]]
  --[[   lualine_z = {} ]]
  --[[ }, ]]
  extensions = { 'fugitive', 'nvim-tree' }
}
