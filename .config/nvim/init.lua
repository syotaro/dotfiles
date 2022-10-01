local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.bootstrap",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

-- カスタム設定
local opts = { noremap = true, silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- ハイライト削除
keymap("n", "<C-c><C-c>", ":nohlsearch<CR><ESC>", opts)

-- ;でコマンド入力( ;と:を入れ替)
keymap("n", ";", ":", opts)
keymap("n", "q", ":q<cr>", opts)
-- Ctrl + c とEscの動作を完全に一致させる
keymap("i", "<C-c>", "<ESC>", opts)

--  挿入モードにならずに改行できる
keymap("n", "<CR>", "o<ESC>", opts)

-- インデント
keymap("n", "<C-l>", ">>", opts)
keymap("n", "<C-h>", "<<", opts)

-- カーソル移動
keymap("n", "9", "$", opts)
keymap("v", "9", "$", opts)
keymap("x", "9", "$", opts)
keymap("n", "1", "^", opts)
keymap("v", "1", "^", opts)
keymap("x", "1", "^", opts)
keymap("n", "<C-B>", "<LEFT>", opts)
keymap("n", "<C-F>", "<RIGHT>", opts)
keymap("n", "<C-e>", "<Esc>$", opts)
keymap("n", "<C-j>", "<C-e><DOWN>", opts)
keymap("n", "<C-k>", "<C-y><UP>", opts)

--  選択部分を、コピーせずに削除
keymap("n", "d", '"_d', opts)
keymap("x", "d", '"_d', opts)
keymap("x", "p", '"_dP', opts)

--  AstroNVIMの既存マッピングを修正する場合は、/.config/nvim/lua/core/mappings.luaに追記する（書き換えてはダメ）る

-- j,kによる移動を、折り返されたテキストでも自然に振る舞うように変更
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- メモをサクッと作成
keymap("n", "<LEADER>f", ":save ~/Desktop/memo.md<CR>", opts)

-- 細かい設定
vim.opt.ambiwidth = "single"
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.fenc = "utf-8"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.shell = "fish"
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undofile = false
vim.opt.whichwrap = "b,s,h,l,[,],<,>" -- カーソルを行頭、行末で止まらないようにする
vim.opt.wildmenu = true -- コマンドラインで補完候補をメニュー表示する
vim.opt.writebackup = false
vim.opt.autoread = true -- ファイルが他で変更されている場合に自動的に読み直します
vim.opt.list = true -- 不可視文字表示
vim.opt.listchars = "tab:▸ ,trail:_,extends:>,precedes:<,nbsp:%" -- " 不可視文字の表示形式

-- space + ? で各種設定をトグル
keymap("i", "<C-k>", "()<LEFT>", opts)
keymap("n", "z", ":setl wrap!<CR>:setl wrap?<CR>", opts)

-- color → /.config/nvim/lua/default_theme/base.lua
