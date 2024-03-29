local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_cutoff = 1,
        preview_height = 0.6,
      },
      horizontal = {
        preview_width = 0.7,
      },
    },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      hidden = true,
      -- return absolute paths
      path_display = { "absolute" },
      file_ignore_patterns = {
        "node_modules",
        ".git",
      },
    },
    live_grep = {
      hidden = true,
      -- return absolute paths
      path_display = { "absolute" },
      file_ignore_patterns = {
        "node_modules",
        ".git",
      },
    },
    lsp_references = {
      fname_width = 130,
      path_display = {
        shorten = { len = 1, exclude = { -1, -2, -3, -4, -5, -6, -7, -8 } }
      }
    },
  },
})
