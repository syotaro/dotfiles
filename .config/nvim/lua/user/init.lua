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
      -- ambiwidth = "single", -- https://github.com/rbtnn/vim-ambiwidth
      autoread = true, -- ファイルが他で変更されている場合に自動的に読み直します
      backspace = "indent,eol,start", -- インサートモード中の BS、CTRL-W、CTRL-U による文字削除を柔軟にする
      backup = false,
      clipboard = "unnamedplus", -- クリップボードを共有する
      hidden = true,
      hlsearch = true,
      list = true, -- 不可視文字表示
      mouse = "a",
      number = true,
      relativenumber = false,
      ruler = false,
      scrolloff = 8,
      shiftwidth = 2,
      showcmd = true,
      sidescrolloff = 8,
      spell = false, -- sets vim.opt.spell
      swapfile = false,
      tabstop = 2,
      undofile = false,
      whichwrap = "b,s,h,l,[,],<,>", -- カーソルを行頭、行末で止まらないようにする
      wildmenu = true, -- コマンドラインで補完候補をメニュー表示する
      wrap = false,
      writebackup = false,
      -- autoindent = true, -- ファイル保存時に、自動でインデントを揃える
      encoding = "utf-8",
      fenc = "utf-8", -- ファイルのエンコーディングを指定
      -- helplang = "ja",
      -- shell = "fish",
      -- smartindent = true, -- ファイル保存時に、自動でインデントを揃える
      -- title = true,
      -- AstroNVIMでデフォルト設定されているので、あえてやらないでいいやつ
      ---- listchars = "tab:▸ ,trail:_,extends:>,precedes:<,nbsp:%", -- " 不可視文字の表示形式
      ---- signcolumn = "true", signcolumnは常に有効にして、ファイル開く直後のガタつき予防
      ---- laststatus = 2,
      ---- cmdheight = 0, -- nvim0.8以降でサポート。かっこいい
      ---- background = "dark", --デフォルト有効になっている
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      copilot_assume_mapped = true,
      copilot_filetypes = {
        ["*"] = true,
        ["php"] = true,
      },
      vim_markdown_folding_disabled = 1, -- 折り畳みを無効化
      vim_markdown_conceal_code_blocks = 0, --   "構文隠蔽無効化
      vim_markdown_conceal = 0, --   "構文隠蔽無効化
      vim_markdown_frontmatter = 1, --   "frontmatterを強調表示
      vim_markdown_new_list_item_indent = 2, -- "listのインデントのスペースの数を4から2へ
      vim_markdown_folding_style_pythonic = 1,
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
      cmp = true,
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
      symbols_outline = true,
      telescope = true,
      treesitter = true,
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
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {} -- n:ノーマルモード
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
    n = { -- n:ノーマルモード
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<leader>vf"] = { "<cmd>save ~/Desktop/memo.md<cr>", desc = "メモをサクッと作成" },
      ["<Leader>."]  = { ":<C-u>edit ~/.config/nvim/lua/user/init.lua<CR>", desc = "" },
      ["<leader>ve"] = {
        "<cmd>e " .. vim.fn.stdpath "config" .. "/lua/user/init.lua<CR>",
        desc = "Open Astronvim config",
      },
      ["n"]          = { "nzz", desc = "" },
      ["N"]          = { "Nzz", desc = "" },
      ["#"]          = { "#zz", desc = "" },
      ["1"]          = { "^", desc = "Start of line (non-blank)" },
      ["9"]          = { "$", desc = "End of line" },
      [";"]          = { ":", desc = ";でコマンド入力( ;と:を入れ替)" },
      ["<C-b>"]      = { "<LEFT>", desc = "LEFT" },
      ["<C-e>"]      = { "<ESC>$", desc = "End of line" },
      ["<C-f>"]      = { "<RIGHT>", desc = "RIGHT" },
      ["<"]          = { "<<", desc = "left indent" },
      ["<C-j>"]      = { "<C-e><DOWN>", desc = "1行スクロール" },
      ["<C-k>"]      = { "<C-Y><UP>", desc = "1行スクロール" },
      [">"]          = { ">>", desc = "right indent" },
      ["<CR>"]       = { "<ESC>o<ESC>i", desc = "ノーマルモードのまま空行を挿入" },
      ["<S-CR>"]     = { "<ESC>O<ESC>i", desc = "ノーマルモードのまま空行を挿入" },
      ["<Esc><Esc>"] = { "<CMD>nohlsearch<CR><ESC>", desc = "ハイライト削除" },
      ["d"]          = { "_d", desc = "選択部分を、ヤンクせずに削除" },
      ["j"]          = { "gj", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
      ["k"]          = { "gk", desc = "折り返されたテキストでも、j/kの移動が自然に振る舞うように" },
      ["o"]          = { "A<CR>", desc = "行末に移動して改行" },
      ["q"]          = { "<CMD>q<CR>", desc = "qだけでエディタを閉じる" },
    },
    t = { -- t:ターミナルモード
      ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
      ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
      ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
      ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
    },
    i = { -- i:インサートモード
      ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
      ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
      ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
      ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
      ["<C-n>"] = { "<DOWN>", desc = "DOWN" },
      ["<C-p>"] = { "<UP>", desc = "UP" },
      ["<C-h>"] = { "<BACKSPACE>", desc = "delete left character" },
      ["<C-l>"] = { "<C-t>", desc = "Right Indent" },
      ["<C-s>"] = { "<ESC><CMD>:w!<CR>", desc = "Save File" },
      ["kk"]    = { "()<LEFT>", desc = "call ()" },
    },
    c = { -- c:コマンドモード
      ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
      ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
      ["<C-e>"] = { "<ESC>$<INS>", desc = "End of line" },
      ["<C-a>"] = { "<ESC>^<INS>", desc = "Start of line (non-blank)" },
    },
    v = { -- v:ヴィジュアルモード
      ["1"]     = { "^", desc = "Start of line (non-blank)" },
      ["9"]     = { "$", desc = "End of line" },
      ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
      ["<C-e>"] = { "$", desc = "End of line" },
      ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
      ["<C-j>"] = { "<CMD>move '>+1<CR>gv-gv", desc = "Move lines of code up" },
      ["<C-k>"] = { "<CMD>move '<-2<CR>gv-gv", desc = "Move lines of code down" },
      ["<C-h>"] = { "<gv", desc = "Left Indent & v-mode continue" },
      ["<C-l>"] = { ">gv", desc = "Right Indent & v-mode continue" },
    },
    x = { -- x:ヴィジュアルブロックモード
      ["9"]     = { "$", desc = "Start of line (non-blank)" },
      ["1"]     = { "^", desc = "End of line" },
      ["d"]     = { '"_d', desc = "ブラックホールレジスタでyankを回避して削除削除" },
      ["p"]     = { '"_dP', desc = "ブラックホールレジスタでペースト時ヤンク回避して削除" },
      ["<C-b>"] = { "<LEFT>", desc = "LEFT" },
      ["<C-e>"] = { "$", desc = "End of line" },
      ["<C-f>"] = { "<RIGHT>", desc = "RIGHT" },
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
      { "godlygeek/tabular" },
      { "preservim/vim-markdown" },
      -- { "rbtnn/vim-ambiwidth" },  -- これをインストールすると、UIがずれるので入れない方がいい
      { 'dsznajder/vscode-es7-javascript-react-snippets', run = 'yarn install --frozen-lockfile && yarn compile' }, -- https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets
      { 'junegunn/vim-easy-align' },
      { "andweeb/presence.nvim" },
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
      -- cspell start
      local cspell_config_dir = '~/.cspell'
      local cspell_data_dir = '~/.cspell'
      local cspell_files = {
        config = vim.call('expand', cspell_config_dir .. '/cspell.json'),
        user = vim.call('expand', cspell_data_dir .. '/custom-dictionary-user.txt'),
      }
      local cspell_append = function(opts)
        local word = opts.args
        if not word or word == "" then
          -- 引数がなければcwordを取得
          word = vim.call('expand', '<cword>'):lower()
        end

        -- bangの有無で保存先を分岐
        local dictionary_name = 'user'

        -- shellのechoコマンドで辞書ファイルに追記
        io.popen('echo ' .. word .. ' >> ' .. cspell_files[dictionary_name])

        -- 追加した単語および辞書を表示
        vim.notify(
          '"' .. word .. '" is appended to ' .. dictionary_name .. ' dictionary.',
          vim.log.levels.INFO,
          {}
        )
        -- cspellをリロードするため、現在行を更新してすぐ戻す
        if vim.api.nvim_get_option_value('modifiable', {}) then
          vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
          vim.api.nvim_command('silent! undo')
        end
      end

      vim.api.nvim_create_user_command(
        'CSpellAppend',
        cspell_append,
        { nargs = '?', bang = true }
      )
      -- cspell end

      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

      -- cspell start
      local cspell_custom_actions = {
        name = 'append-to-cspell-dictionary',
        method = null_ls.methods.CODE_ACTION,
        filetypes = {},
        generator = {
          fn = function(_)
            -- 現在のカーソル位置
            local lnum = vim.fn.getcurpos()[2] - 1
            local col = vim.fn.getcurpos()[3]

            -- 現在行のエラーメッセージ一覧
            local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

            -- カーソル位置にcspellの警告が出ているか探索
            local word = ''
            local regex = '^Unknown word %((%w+)%)$'
            for _, v in pairs(diagnostics) do
              if v.source == "cspell" and
                  v.col < col and col <= v.end_col and
                  string.match(v.message, regex) then
                -- 見つかった場合、単語を抽出
                word = string.gsub(v.message, regex, '%1'):lower()
                break
              end
            end

            -- 警告が見つからなければ終了
            if word == '' then
              return
            end

            -- cspell_appendを呼び出すactionのリストを返却
            return {
              {
                title = 'Append "' .. word .. '" to user dictionary',
                action = function()
                  cspell_append({ args = word })
                end
              }
            }
          end
        }
      }
      null_ls.register(cspell_custom_actions)
      -- cspell end

      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          -- filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "yaml", "markdown" },
        }),
        null_ls.builtins.diagnostics.textlint.with({
          filetypes = { "markdown", "html" }, -- textlintの対象
        }),
        null_ls.builtins.diagnostics.cspell.with({
          filetypes = { "markdown", "text", "json", "yaml", "html", "css", "scss", "less", "javascript",
            "javascriptreact", "typescript", "typescriptreact", "lua", "python", "rust", "dockerfile", "vim", "toml",
            "php", "ruby", "vue" },
          extra_args = { "--config", vim.fn.expand("~/.cspell/cspell.json") },
        }),
        null_ls.builtins.code_actions.cspell,
      }
      return config -- return final config table
    end,

    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- highlight = {
      --   enable = true,
      --   disable = { "markdown" },
      -- },
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "go",
        "diff",
        "html",
        "hcl",
        "javascript",
        "json",
        "gitignore",
        "lua",
        "markdown",
        "markdown_inline",
        "scss",
        "tsx",
        "jsonc",
        "typescript",
        "graphql",
        "yaml",
        "toml",
        "fish",
        "ruby",
        "prisma",
        "php",
        "rust",
      },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "sumneko_lua", automatic_installation = true },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = {
        "cspell",
        "cssmodules-language-serve",
        "eslint-lsp",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "rubocop",
        "ruby-lsp",
        "solargraph",
        "spectral-language-server",
        "stylelint-lsp",
        "terraform-ls",
        "textlint",
        "tflint",
        "typescript-language-serve",
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

    -- バッファが無くなると自動的にアルファを開く
    local function alpha_on_bye(cmd)
      local bufs = vim.fn.getbufinfo { buflisted = true }
      vim.cmd(cmd)
      if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
        require("alpha").start(true)
      end
    end

    vim.keymap.del("n", "<leader>c")
    if require("core.utils").is_available "bufdelete.nvim" then
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "Bdelete!"
      end, { desc = "Close buffer" })
    else
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "bdelete!"
      end, { desc = "Close buffer" })
    end

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
