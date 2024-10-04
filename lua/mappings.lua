local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })

-- Movement
-- in insert mode, hold control to move around
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find File" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep text" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find Help" })
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Treesitter" })
map("n", "<leader>fd", "<cmd>Telescope lsp_document_diagnostics<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })
map("n", "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })
map("n", "<leader>fl", "<cmd>Telescope lsp_code_actions<CR>", { desc = "Code Actions" })

-- LSP
-- map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
-- map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
-- map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
-- map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })
