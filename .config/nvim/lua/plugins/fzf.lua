return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    "max-perf", -- no icons, no previewer in file lists: fastest profile
    files = { cmd = "fd --type f --hidden --follow --exclude .git" },
    grep = { rg_glob = true },
  },
  keys = {
    { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>r", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>/", "<cmd>FzfLua blines<cr>", desc = "Buffer lines" },
    { "<leader>:", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>h", "<cmd>FzfLua helptags<cr>", desc = "Help" },
  },
}
