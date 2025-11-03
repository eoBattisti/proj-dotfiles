local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt


local for_loop = s("for", {
  t("{% for "), i(1, "item"), t(" in "), i(2, "iterable"), t(" %}"),
  t({"", "  "}), i(3, "code"),
  t({"", "{% endfor %}"}),
})

local for_empty = s("fore", {
  t("{% for "), i(1, "item"), t(" in "), i(2, "iterable"), t(" %}"),
  t({"", "  "}), i(3, "code"),
  t({"", "{% empty %}"}),
  t({"", "  "}), i(4, "empty code"),
  t({"", "{% endfor %}"}),
})

local ifcond = s("if", {
  t("{% if "), i(1, "condition"), t(" %}"),
  t({"", "  "}), i(2, "code"),
  t({"", "{% else %}"}),
  t({"", "  "}), i(3, "else code"),
  t({"", "{% endif %}"}),
})

local include = s("inc", {
  t("{% include '"), i(1, "template.html"), t("' %}"),
})

local extends = s("ext", {
  t("{% extends '"), i(1, "base.html"), t("' %}"),
})

local loaded = s("load", {
  t("{% load "), i(1, "library"), t(" %}"),
})

local static = s("static", {
  t("{% static '"), i(1, "path/to/file"), t("' %}"),
})


local block = s("block", {
  t("{% block "), i(1, "block_name"), t(" %}"),
  t({"", "  "}), i(2, "code"),
  t({"{% endblock "}), rep(1), t(" %}"),
})

ls.add_snippets("htmldjango", {
  for_loop,
  for_empty,
  ifcond,
  include,
  extends,
  loaded,
  static,
  block,
})
