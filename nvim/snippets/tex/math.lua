local tex = {}
tex.in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
    return not tex.in_mathzone()
end
tex.exp_trigger = function(trig) 
    return "((\\d+)|(\\d*)(\\\\)?([A-Za-z]+)((\\^|_)(\\{\\d+\\}|\\d))*)" .. trig
end


return {
    s(
        {
            trig = tex.exp_trigger("SQ"),
            name = "Square",
            desc = "Adds a ^2 superscript above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("{}^2", { f(function(args, snip) return snip.captures[1] end )})
    ),

    s(
        {
            trig = tex.exp_trigger("CB"),
            name = "Cube",
            desc = "Adds a ^3 superscript above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("{}^3", { f(function(args, snip) return snip.captures[1] end )})
    ),

    s(
        {
            trig = tex.exp_trigger("SU"),
            name = "Superscript",
            desc = "Adds superscript above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("{}^{{{}}}", { f(function(args, snip) return snip.captures[1] end ), i(1)})
    ),

    s(
        {
            trig = tex.exp_trigger("_"),
            name = "auto-subscript",
            desc = "Automatically adds sub-script brackest after underscores [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("{}_{{{}}} {}", { f(function(args, snip) return snip.captures[1] end ), i(1), i(0)})
    ),

    s(
        {
            trig = "frac",
            name = "Fraction",
            desc = "Fraction snippet [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\frac{{{}}}{{{}}} {}", { i(1), i(2), i(0)})
    ),

    s(
        {
            trig = "root",
            name = "Root",
            desc = "Root symbol  [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\sqrt[{}]{{{}}} {}", { i(1), i(2), i(0)})
    ),

    s(
        {
            trig = "int",
            name = "Integral",
            desc = "Integral symbol  [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\int_{{{}}}^{{{}}} {}", { i(1), i(2), i(0)})
    ),

    s(
        {
            trig = "sum",
            name = "Sum",
            desc = "Summation symbol  [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\sum_{{{}}}^{{{}}} {}", { i(1), i(2), i(0)})
    ),

    s(
        {
            trig = "prod",
            name = "Product",
            desc = "Product symbol  [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\prod{{{}}}^{{{}}} {}", { i(1), i(2), i(0)})
    ),

    s(
        {
            trig = "lim",
            name = "Limit",
            desc = "Limit symbol  [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\lim_{{{}}} {}", { i(1), i(0)})
    ),

    s(
        {
            trig = "pmx",
            name = "Parenthesis matrix",
            desc = "Parenthesis matrix [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\begin{{pmatrix}}\n{}\n\\end{{pmatrix}} {}", { i(1), i(0)})
    ),

    s(
        {
            trig = "bmx",
            name = "Bracket matrix",
            desc = "Bracket matrix [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\begin{{bmatrix}}\n{}\n\\end{{bmatrix}} {}", { i(1), i(0)})
    ),

    s(
        {
            trig = "cmx",
            name = "Curly-bracket matrix",
            desc = "Curly-bracket matrix [math only]",
            condition = tex.in_mathzone,

        },
        fmt("\\begin{{cmatrix}}\n{}\n\\end{{cmatrix}} {}", { i(1), i(0)})
    ),

    s(
        {
            trig = "__",
            name = "Curly-bracket matrix",
            desc = "Curly-bracket matrix [math only]",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\\\\n {}", {i(0)})
    ),
}
