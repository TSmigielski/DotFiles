local ls = require("luasnip")
local s = ls.snippet;
local t = ls.text_node;
local i = ls.insert_node;

return {
   s(
      "prop",
      {
         t("public "),
         i(1, "type"),
         t(" "),
         i(2, "Name"),
         t(" { get; set; }")
      }
   ),
   s(
      "propg",
      {
         t("public "),
         i(1, "type"),
         t(" "),
         i(2, "Name"),
         t(" { get; private set; }")
      }
   ),
   s(
      "propi",
      {
         t("public "),
         i(1, "type"),
         t(" "),
         i(2, "Name"),
         t(" { get; init; }")
      }
   )
}
