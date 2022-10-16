--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    default_theme = function(highlights) -- or a function that returns a new table of colors to set
      highlights.MatchParen = { fg = C.fg, bg = C.red } -- ペアの括弧のハイライトが灰色で見えにくいので赤色に
      return highlights
    end,

    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    --
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- ambiwidth = "single",
      autoread = true, -- ファイルが他で変更されている場合に自動的に読み直します
      backspace = "indent,eol,start",
      backup = false,
      clipboard = "unnamedplus", -- クリップボードを共有する
      fenc = "utf-8", -- ファイルのエンコーディングを指定
      hidden = true,
      -- helplang = "ja",
      -- title = true,
      -- autoindent = true, -- ファイル保存時に、自動でインデントを揃える
      hlsearch = true,
      -- lazyredraw = true,
      list = true, -- 不可視文字表示
      listchars = "tab:▸ ,trail:_,extends:>,precedes:<,nbsp:%", -- " 不可視文字の表示形式
      mouse = "a",
      number = true,
      relativenumber = false,
      ruler = false,
      scrolloff = 8,
      shell = "fish",
      shiftwidth = 2,
      showcmd = true,
      sidescrolloff = 8,
      swapfile = false,
      tabstop = 2,
      undofile = false,
      whichwrap = "b,s,h,l,[,],<,>", -- カーソルを行頭、行末で止まらないようにする
      wildmenu = true, -- コマンドラインで補完候補をメニュー表示する
      writebackup = false,
      wrap = false,
      -- AstroNVIMでデフォルト設定されているので、あえてやらないでいいやつ
      ---- signcolumn = "true", signcolumnは常に有効にして、ファイル開く直後のガタつき予防
      ---- laststatus = 2,
      ---- cmdheight = 0, -- nvim0.8以降でサポート。かっこいい
      ---- background = "dark", --デフォルト有効になっている
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      copilot_assume_mapped = true,
      copilot_filetypes = {
        ["*"] = true,
        ["javascript"] = true,
        ["typescript"] = true,
        ["lua"] = true,
        ["markdown"] = true,
        ["ruby"] = true,
        ["php"] = true,
      },
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = { "" },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
    cspell = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching

    mappings = {
      n = { -- n:ノーマルモード
        -- ["<LEADER>n"] = { "<CMD>enew<CR>", desc = "NEW FILE" },
        -- ["<LEADER>r"] = { function() require("telescope.builtin").oldfiles() end, desc = "履歴検索" },

        ["1"] = { "^", desc = "Start of line (non-blank)" },
        ["9"] = { "$", desc = "End of line" },
        [";"] = { ":", desc = ";でコマンド入力( ;と:を入れ替)" },
        ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
        ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
        ["<C-e>"] = { "<ESC>$", desc = "End of line" },
        ["<C-j>"] = { "<C-e><DOWN>", desc = "1行スクロール" },
        ["<C-k>"] = { "<C-Y><UP>", desc = "1行スクロール" },
        -- ["<C-c>"] = { "<ESC>", desc = "Ctrl + c とEscの動作を完全に一致させる" },
        ["<Esc><Esc>"] = { ":nohlsearch<CR><ESC>", desc = "ハイライト削除" },
        ["<C-H>"] = { "<<", desc = "" },
        ["<C-L>"] = { ">>", desc = "" },
        ["<CR>"] = { "o<ESC>", desc = "挿入モードにならずに改行" },
        ["<LEADER>m"] = { ":save ~/Desktop/memo.md<CR>", desc = "メモをサクッと作成" },
        ["d"] = { "_d", desc = "選択部分を、ヤンクせずに削除" },
        ["j"] = { "gj", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
        ["k"] = { "gk", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
        ["q"] = { "<ESC>:q<CR>", desc = "qだけでエディタを閉じる" },
      },
      t = { -- t:ターミナルモード
      },
      i = { -- i:インサートモード
        ["<C-k>"] = { "<LEFT>()<LEFT>", desc = "()をサクッと呼び出す" },
      },
      c = { -- c:コマンドモード
      },
      v = { -- v:ヴィジュアルモード
        ["9"] = { "$", desc = "" },
        ["1"] = { "^", desc = "" },
        ["<C-j>"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
        ["<C-k>"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
      },
      x = { -- x:ヴィジュアルブロックモード
        ["9"] = { "$", desc = "" },
        ["1"] = { "^", desc = "" },
        ["d"] = { '"_d', desc = "ブラックホールレジスタでyankを回避して削除削除" },
        ["p"] = { '"_dP', desc = "ブラックホールレジスタでペースト時ヤンク回避して削除" },
      },
    },

    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      { "github/copilot.vim" },

      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.textlint.with {
          filetypes = { "markdown", "text" }, -- textlintの対象はtextとmarkdownだけ
        },
      }
      return config -- return final config table
    end,

    treesitter = { -- overrides `require("treesitter").setup(...)`
      highlight = {
        enable = true,
        disable = { "markdown" }, -- なぜかTSによるmarkdownのハイライトがされないので解決するまで無効
      },
      ensure_installed = {
        "css",
        "dockerfile",
        "hcl",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "scss",
        "tsx",
        "typescript",
        "yaml",
      },
      autotag = { enable = true },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "sumneko_lua", automatic_installation = true },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = {
        -- Lsp
        "css-lsp",
        "cssmodules-language-server",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "rubocop",
        "solargraph", -- ruby
        "stylua",
        "terraform-ls",
        "typescript-language-server",
      },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
