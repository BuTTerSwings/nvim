return {
  "danymat/neogen",
  config = true,
  opts = function(_, opts)
    opts.snippet_engine = nil
    -- opts.languages = {
    --   cpp = {
    --     template = {
    --       annotation_convention = "cpp_doxygen",
    --       cpp_doxygen = {
    --         { nil, "/**", { no_results = true, type = { "func", "file", "class" } } },
    --         { nil, " * @file", { no_results = true, type = { "file" } } },
    --         { nil, " * @brief $1", { no_results = true, type = { "func", "file", "class" } } },
    --         { nil, " */", { no_results = true, type = { "func", "file", "class" } } },
    --         { nil, "", { no_results = true, type = { "file" } } },
    --
    --         { nil, "///", { type = { "func", "class", "type" } } },
    --         { "class_name", " /// @class %s", { type = { "class" } } },
    --         { "type", "/// @typedef %s", { type = { "type" } } },
    --         { nil, "/// @brief $1", { type = { "func", "class", "type" } } },
    --         { nil, "///", { type = { "func", "class", "type" } } },
    --         { "tparam", "/// @tparam %s $1" },
    --         { "parameters", "/// @param %s $1" },
    --         { "return_statement", "/// @return $1" },
    --         { nil, "///", { type = { "func", "class", "type" } } },
    --       },
    --     },
    --   },
    -- }
  end,
}
