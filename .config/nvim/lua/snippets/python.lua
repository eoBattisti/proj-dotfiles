local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

-- Embeded IPython
local ipython_snippet = s("ipython", {
  t("import IPython; IPython.embed(); exit(1);"),
})

-- Python Class
local python_class = s("cl", {
  t("class "), i(1, "ClassName"), t("("), i(2, "object"), t("):"),
  t({"", "    "}),
  t({"", "    def __init__(self):"}),
})

-- List Comprehension
local lc = s("lc", {
    t("["), i(1, "expr"), t(" for "), i(2, "item"), t(" in "), i(3, "iterable"), c(4, {
      t(""),
      t(" if "), i(1, "condition"),
      t(" if "), i(1, "condition1"), t(" and "), i(2, "condition2"),
    }),
    t("]"),
})

-- Dictionary Comprehension
local dc = s("dc", {
  t("{"), i(1, "key"), t(": "), i(2, "value"), t(" for "), i(3, "item"), t(" in "), i(4, "iterable"),
  c(5, {
    t(""),
    t(" if "), i(1, "condition"),
    t(" if "), i(1, "condition1"), t(" and "), i(2, "condition2")
  }),
  t("}"), i(0)
})

-- Function
local def = s("def", {
  t("def "), i(1, "fname"), t("("), i(2, "args"), t(") ->"), i(3, "type"), t(":"),
  t({"", "    "}),
  t("pass"),
})

-- Async Function
local adef = s("adef", {
  t("async def "), i(1, "fname"), t("("), i(2, "args"), t(") ->"), i(3, "type"), t(":"),
  t({"", "    "}),
  t("pass"),
})

-- Async Method
local adefm = s("adefm", {
  t("async def "), i(1, "mname"), t("(self, "), i(2, "args"), t(") ->"), i(3, "type"), t(":"),
  t({"", "    "}),
  t("pass"),
})

-- Method
local defm = s("defm", {
  t("def "), i(1, "mname"), t("(self, "), i(2, "args"), t(") ->"), i(3, "type"), t(":"),
  t({"", "    "}),
  t("pass"),
})

ls.add_snippets("python", {
  ipython_snippet,
  python_class,
  lc,
  dc,
  def,
  adef,
  adefm,
  defm,
})
