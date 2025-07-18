vim.g.mapleader = " "

vim.keymap.set("n", ":Q", ":q")
vim.keymap.set("n", ":W", ":w")
vim.keymap.set("n", ":Q!", ":q!")
vim.keymap.set("n", ":W!", ":w!")
vim.keymap.set("n", ":Bd", ":bd")
vim.keymap.set("n", ":Ccl", ":ccl")
vim.keymap.set("n", ":CCl", ":ccl")
vim.keymap.set("n", ":So", ":so")

vim.keymap.set("n", "<leader>;", "A;<Esc>")
vim.keymap.set("n", "<leader>w", ":update<CR>")
vim.keymap.set("n", "<leader>q", ":q")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<C-w>jzz")
vim.keymap.set("n", "<C-k>", "<C-w>kzz")
vim.keymap.set("n", "<C-h>", "<C-w>hzz")
vim.keymap.set("n", "<C-l>", "<C-w>lzz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/jake/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("set hlsearch!")
end)

vim.keymap.set("n", "K", "<cmd>lua require('pretty_hover').hover()<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>lua require('pretty_hover').close()<CR>")

local function get_github_url(start_line, end_line)
  -- Get the git root directory
  local git_root = vim.fn.system('git rev-parse --show-toplevel 2>/dev/null'):gsub('\n', '')
  if git_root == '' then return nil end

  -- Get the remote origin URL
  local git_remote = vim.fn.system('git config --get remote.origin.url'):gsub('\n', '')
  if git_remote == '' then return nil end

  -- Convert SSH URL to HTTPS if necessary
  git_remote = git_remote:gsub('^git@github.com:', 'https://github.com/')
  git_remote = git_remote:gsub('%.git$', '')

  -- Get current branch
  local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD'):gsub('\n', '')

  -- Get file path relative to git root
  local file_path = vim.fn.expand('%:p'):gsub(git_root .. '/', '')

  -- Construct GitHub URL
  local github_url = string.format('%s/blob/%s/%s', git_remote, branch, file_path)

  -- Add line numbers if start_line is provided
  if start_line then
    if start_line == end_line then
      github_url = github_url .. '#L' .. start_line
    else
      github_url = github_url .. '#L' .. start_line .. '-L' .. end_line
    end
  end

  return github_url
end

vim.keymap.set("n", "<leader>fn", function()
  local github_url = get_github_url()
  if github_url then
    vim.fn.setreg('+', github_url)
    print("GitHub URL copied to clipboard!")
  else
    print("Not in a git repository or no remote origin set")
  end
end)

vim.keymap.set("v", "<leader>fn", function()
  -- Get the current visual selection lines
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  -- Ensure start_line is the smaller number
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local github_url = get_github_url(start_line, end_line)
  if github_url then
    vim.fn.setreg('+', github_url)
    print("GitHub URL with line numbers copied to clipboard!")
  else
    print("Not in a git repository or no remote origin set")
  end
end)
