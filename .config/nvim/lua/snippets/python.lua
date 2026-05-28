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
local rep = require("luasnip.extras").rep

-- Embeded IPython
local ipython_snippet = s("ipython", {
  t("import IPython; IPython.embed(); exit(1);"),
})

-- Python Class
local python_class = s("cl", fmt("class {}:\n\tdef __init__(self, {}):\n\t\tself.{} = {}", {i(1, "ClassName"), i(2, "parameters"), rep(2), rep(2)}))

-- List Comprehension
local lc = s("lc", fmt("[{} for {} in {}]", {i(1, "item"), rep(1), i(2, "iterable")}))

-- Function
local def = s("def", fmt("def {}({}) -> {}:\n\tpass", {i(1, "fname"), i(2, "params"), i(3, "type")}))

-- Async Function
local adef = s("adef", fmt("async def {}({}) -> {}:\n\tpass", {i(1, "fname"), i(2, "params"), i(3, "type")}))

-- Async Method
local adefm = s("adefm", fmt("async def {}(self, {}) -> {}:\n\tpass", {i(1, "mname"), i(2, "parameter"), i(3, "type")}))

-- Method
local defm = s("defm", fmt("def {}(self, {}) -> {}:\n\tpass", {i(1, "mname"), i(2, "parameter"), i(3, "type")}))

local try = s("try", fmt("try:\n\t{}\nexcept {} as e:\n\t{}", {i(1, "body"), i(2, "Exception"), i(3, "ebody")}))

local ifstatement = s("if", fmt("if {}:\n\tpass", { i(1, "")}))
local ifternary = s("ift", fmt("{} = {} if {} else {}", { i(1, ""), i(2, ""), i(3, "True"), i(4, "")}))

local akw = s("akw", t("*args, **kwargs,"))

local addp = s("addp", t("parser = argparse.ArgumentParser()"))
local addarg = s("addarg", fmt('parser.add_argument("{}", "{}", default={}, help={})', { i(1, "short"), i(2, "long"), i(3, "default"), i(4, "help")}))
local pargs = s("pargs", t("parser.parse_args()"))

ls.add_snippets("python", {
  ipython_snippet,
  python_class,
  lc,
  def,
  adef,
  adefm,
  defm,
  try,
	ifstatement,
	ifternary,
	akw,
	addp,
	addarg,
	pargs,
})
