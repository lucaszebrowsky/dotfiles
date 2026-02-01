-- Yes this config is mostly written with AI because i cant be arsed to spend
-- that muchtime to just get a somewhat working setup that does not rely on
-- 50 plugins like if this is some shitty JS project lol

vim.opt.belloff     = "all"
vim.opt.number      = true
vim.opt.relativenumber = true
vim.opt.syntax      = "enable"	
vim.opt.autoindent  = true
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.clipboard   = "unnamed"
vim.opt.background  = "dark"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.o.winborder = "rounded"
vim.opt.virtualedit = "onemore"
vim.opt.colorcolumn = "80"
vim.opt.list = true
vim.opt.listchars = {
    space = "·",      -- shows spaces as dots
    tab = "│ ",       -- shows tab with a vertical line and space
}


vim.cmd("colorscheme codedark")

-- vim.g.neoformat_enabled = { 'clangformat' }

-- vim.pack.add({
--   { src = 'https://github.com/neovim/nvim-lspconfig' }
-- })

vim.diagnostic.config({
  virtual_text = true,  -- show inline messages
  signs = true,         -- show signs in the gutter
  underline = true,     -- underline problematic text
  update_in_insert = true, -- don't update diagnostics while typing
  severity_sort = true,     -- sort diagnostics by severity
})

-- vim.api.nvim_create_autocmd("InsertCharPre", {
--   callback = function()
--     local char = vim.v.char  -- the character about to be inserted
--     -- Only trigger LSP completion for word characters
--     if vim.fn.pumvisible() == 0 and char:match("[%w_]") then
--       vim.lsp.completion.get()
--     end
--   end
-- })

vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/completion') then
          local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end

          client.server_capabilities.completionProvider.triggerCharacters = chars

          vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        end

      end,
})

-- Create an augroup to avoid duplicate autocmds
local format_grp = vim.api.nvim_create_augroup("LspAutoFormat", {})

-- Autoformat on save if any attached LSP supports formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_grp,
    callback = function()
        local buf = vim.api.nvim_get_current_buf()
        -- Get all LSP clients attached to this buffer
        local clients = vim.lsp.get_active_clients({bufnr = buf})
        for _, client in ipairs(clients) do
            if client.supports_method("textDocument/formatting") then
                -- Use the first LSP that supports formatting
                vim.lsp.buf.format({ async = false })
                break
            end
        end
    end,
})
-- Keybindings ---

-- Tab to select next item in completion popup
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})

-- Shift-Tab to select previous item in completion popup
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})

-- Enter to confirm completion (optional, but useful)
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? "\<C-y>" : "\<CR>"]], {expr = true, noremap = true})


--- LSP ---
vim.cmd("set completeopt=menuone,noselect")

vim.lsp.enable({'clangd'})

-- Diagnostic Colors --- 

-- Example: change virtual text colors
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ff0000", bg = "#1e1e2e"})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#ffaa00", bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { fg = "#00aaff", bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { fg = "#aaaaaa", bg = "#1e1e2e", italic = true })

vim.api.nvim_set_hl(0,"ColorColumn",{ bg = "#323232" })
