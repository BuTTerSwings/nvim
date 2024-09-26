return {
  "rohit-kumar-j/cmake-tools.nvim",
  branch = "master",
  config = function()
    require("cmake-tools").setup({
      cmake_build_directory = "build",
      cmake_build_directory_prefix = "",
    })
  end,
}

-- return {
--   "Civitasv/cmake-tools.nvim",
-- }
