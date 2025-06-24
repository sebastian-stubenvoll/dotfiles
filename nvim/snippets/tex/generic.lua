local ts_utils = require("utils.ts_utils")

local tex = {}
tex.in_mathzone = function()
    return ts_utils.in_mathzone()
end
tex.in_text = function()
        return not tex.in_mathzone()
end

return {
  -- Environments
  s({ 
      trig = "begin", 
      name = "begin{} / end{}",
      snippetType = "autosnippet",
      condition = conds.line_begin
  },
    fmt("\\begin{{{}}}\n{}\n\\end{{{}}}", { i(1), i(0), rep(1) })
  ),

  s({ 
      trig = "abstract", 
      name = "abstract environment", 
      desc = "An environment for abstracts", 
  },
    fmt("\\begin{{abstract}}\n{}\n\\end{{abstract}}", { i(0) })
  ),

  s({ trig = "figure", name = "Figure environment" },
    fmt([[
\begin{{figure}}[{opts}]
  \centering
  \includegraphics[width={width}\linewidth]{{{filename}}}
  \caption{{{caption}}}
  \label{{fig:{shortname}}}
\end{{figure}}

{}
]], {
      opts = i(1, "htpb"),
      width = i(2, "0.8"),
      filename = i(3, "image.ext"),
      caption = f(function(args)
        return (args[1][1]:match("([^/%.]+)") or ""):gsub("^%l", string.upper)
      end, { 3 }),
      shortname = f(function(args)
        return args[1][1]:match("([^/%.]+)") or ""
      end, { 3 }),
      i(0)
    })
  ),

  s({ 
        trig = "enum", name = "Enumerate"
    },
    fmt("\\begin{{enumerate}}\n  \\item {}\n\\end{{enumerate}}", { i(0) })
  ),

  s({ 
        trig = "item", name = "Itemize" 
    },
    fmt("\\begin{{itemize}}\n  \\item {}\n\\end{{itemize}}", { i(0) })
  ),

  s({ 
        trig = "desc",
        name = "Description" 
    },
    fmt("\\begin{{description}}\n  \\item[{}] {}\n\\end{{description}}", { i(1), i(0) })
  ),

  s({ 
        trig = "it", 
        name = "Item" 
    },
    fmt("\\item {}", { i(0) })
  ),

  s({ 
        trig = "dit", 
        name = "Described item" 
    }, 
    fmt("\\item[{}] {}", { i(1), i(0) })
  ),

  -- Text Styling
  s({ trig = "bf", name = "Bold text"  }, fmt("\\textbf{{{}}}{}", { i(1), i(0) })),
  s({ trig = "ita", name = "Italic text" }, fmt("\\textit{{{}}}{}", { i(1), i(0) })),
  s({ trig = "und", name = "Underline text" }, fmt("\\underline{{{}}}{}", { i(1), i(0) })),

  -- Line/Page Breaks
  s({ trig = "nl", name = "New line" }, t({ "\\\\", "" })),
  s({ trig = "np", name = "New page" }, t({ "\\newpage", "" })),

  -- References
  s({ trig = "ref", name = "Reference" }, fmt("\\ref{{{}}}{}", { i(1, "label"), i(0) })),

  -- Citations
  s({ trig = "cite", name = "Citation" },
    fmt("\\cite{{{}}}{}", { i(1, "reference"), i(0) })
  ),

  s({ trig = "citeA", name = "Inline citation" },
    fmt("\\citeA{{{}}}{}", { i(1, "reference"), i(0) })
  ),

  s({ trig = "citeauthor", name = "Author citation" },
    fmt("\\citeauthor{{{}}}{}", { i(1, "reference"), i(0) })
  ),

  s({ trig = "citeyear", name = "Year citation" },
    fmt("\\citeyear{{{}}}{}", { i(1, "reference"), i(0) })
  ),

  s({ trig = "citeNP", name = "No-parentheses citation" },
    fmt("\\citeNP{{{}}}{}", { i(1, "reference"), i(0) })
  ),

  -- Math zones
  s({
        trig = "lm", 
        name = "Inline math",
        snippetType = "autosnippet",
        condition = tex.in_text
    },
    fmt("${}$", { i(1) })
  ),

  s({ 
        trig = "dm", 
        name = "Display math",
        snippetType = "autosnippet",
        condition = tex.in_text
    },
    fmt("\\[\n{}\n\\]", { i(1) })
  ),

  -- Equation Environment
  s({ trig = "eq", name = "Equation" },
    fmt([[
\begin{{equation}}
\label{{eq:{}}}
  {}
\end{{equation}}
{}]], { i(1, "label"), i(2, "equation"), i(0) })
  ),

  s({ trig = "eqnn", name = "Equation*" },
    fmt([[
\begin{{equation*}}
\label{{eq:{}}}
  {}
\end{{equation*}}
{}]], { i(1, "label"), i(2, "equation"), i(0) })
  ),

  -- Align Environment
  s({ trig = "al", name = "Align" },
    fmt("\\begin{{align}}\n  {}\n\\end{{align}}", { i(0) })
  ),

  s({ trig = "alnn", name = "Align*" },
    fmt("\\begin{{align*}}\n  {}\n\\end{{align*}}", { i(0) })
  ),
   s(
        {
            trig="(\\w+)ITA",
            name='Italics postfix', 
            desc='Italics postfix', 
            trigEngine="ecma",
            snippetType = "autosnippet",
            condition = tex.in_text
        },
        fmt("\\textit{{{}}} {}",{ f(function (_, snip) return snip.captures[1] end), i(0) })
    ),

   s(
        {
            trig="(\\w+)BF",
            name='Bold postfix', 
            desc='Bold postfix', 
            trigEngine="ecma",
            snippetType = "autosnippet",
            condition = tex.in_text
        },
        fmt("\\textbf{{{}}} {}",{ f(function (_, snip) return snip.captures[1] end), i(0) })
    ),
}

