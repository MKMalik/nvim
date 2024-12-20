local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define snippets
ls.add_snippets("dart", {
    s("stful", {
        t("class "), i(1, "MyWidget"), t(" extends StatefulWidget {\n"),
        t("  const "), i(1), t("({Key? key}) : super(key: key);\n"),
        t("  @override\n  State<"), i(1), t("> createState() => _"), i(1), t("State();\n"),
        t("}\n\n"),
        t("class _"), i(1), t("State extends State<"), i(1), t("> {\n"),
        t("  @override\n  Widget build(BuildContext context) {\n"),
        t("    return "), i(0, "Container()"), t(";\n"),
        t("  }\n"),
        t("}"),
    }),
})

