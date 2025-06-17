local tex = {}
tex.in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
    return not tex.in_mathzone()
end
tex.exp_trigger = function(trig)
    return "(?<!\\\\)" .. trig
end


return {
    s(
        {
            trig = tex.exp_trigger("\\&a"),
            name = "Alpha",
            desc = "Greek alpha symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\alpha", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&b"),
            name = "Beta",
            desc = "Greek beta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\beta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&c"),
            name = "Gamma",
            desc = "Greek gamma symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\gamma", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&C"),
            name = "Uppercase gamma",
            desc = "Uppercase greek gamma symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Gamma", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&d"),
            name = "Delta",
            desc = "Greek delta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\delta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&D"),
            name = "Uppercase delta",
            desc = "Uppercase greek delta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Delta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&e"),
            name = "Epsilon",
            desc = "The commonly used epsilon symbol ε",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\vepsilon", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&&e"),
            name = "Epsilon",
            desc = "Greek epsilon symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\epsilon", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&z"),
            name = "Zeta",
            desc = "Greek zeta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\zeta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&h"),
            name = "Eta",
            desc = "Greek eta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\eta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&&t"),
            name = "Theta",
            desc = "Greek theta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\theta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&t"),
            name = "Theta",
            desc = "The common greek zeta symbol ϑ",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\vtheta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&T"),
            name = "Uppercase Theta",
            desc = "Uppercase greek theta symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Theta", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&i"),
            name = "Iota",
            desc = "Greek iota symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\iota", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&k"),
            name = "Kappa",
            desc = "Greek kappa symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\kappa", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&l"),
            name = "Lambda",
            desc = "Greek lambda symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\lambda", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&L"),
            name = "Uppercase lambda",
            desc = "Uppercase greek lambda symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Lambda", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&m"),
            name = "Mu",
            desc = "Greek mu symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\mu", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&n"),
            name = "Nu",
            desc = "Greek nu symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\nu", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&§"),
            name = "Xi",
            desc = "Greek xi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\xi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&p"),
            name = "Pi",
            desc = "Greek pi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\pi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&P"),
            name = "Uppercase Pi",
            desc = "Uppercase greek pi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Pi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&&r"),
            name = "Rho",
            desc = "Greek rho symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\rho", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&r"),
            name = "Rho",
            desc = "The common greek rho symbol ϱ",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\vrho", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&s"),
            name = "Sigma",
            desc = "Greek sigma symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\sigma", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&S"),
            name = "Uppercase sigma",
            desc = "Uppercase greek sigma symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Sigma", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&\\+"),
            name = "Tau",
            desc = "Greek tau symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\tau", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&f"),
            name = "Phi",
            desc = "The common greek phi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\vphi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&&f"),
            name = "Phi",
            desc = "Greek phi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\phi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&x"),
            name = "Chi",
            desc = "Greek chi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\chi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&y"),
            name = "Psi",
            desc = "Greek psi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\psi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&Y"),
            name = "Uppercase Psi",
            desc = "Uppercase greek psi symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Psi", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&o"),
            name = "Omega",
            desc = "Greek omega symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\omega", {} )
    ),

    s(
        {
            trig = tex.exp_trigger("\\&O"),
            name = "Uppercase Omega",
            desc = "Uppercase greek omega symbol",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\Omega", {} )
    ),

    s(
        {
            trig = "inf",
            name = "Infinity",
            desc = "Infinity symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\infty", {} )
    ),

    s(
        {
            trig = "del",
            name = "Nabla",
            desc = "Nabla symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\nabla", {} )
    ),
    s(
        {
            trig = "letter",
            name = "Blackboard Letter",
            desc = "Mathbb for domain letters",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\mathbb{{{}}}", { i(1) })
    ),

    s(
        {
            trig = "inf",
            name = "Infinity",
            desc = "Infinity symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\infty", {})
    ),


    s(
        {
            trig = "forall",
            name = "Forall",
            desc = "Forall symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\forall", {})
    ),

    s(
        {
            trig = "exist",
            name = "Exists",
            desc = "Exists symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\exists", {})
    ),

    s(
        {
            trig = "nexist",
            name = "Not Exists",
            desc = "Nexists symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\nexists", {})
    ),

    s(
        {
            trig = "part",
            name = "Partial",
            desc = "Partial symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\partial", {})
    ),

    s(
        {
            trig = "neg",
            name = "Negation",
            desc = "Neg symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\neg", {})
    ),

    s(
        {
            trig = "(?<!c)dot",
            name = "Dot",
            desc = "Multiplication dot",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
            regTrig = true,
            trigEngine = "ecma",
        },
        fmt("\\cdot", {})
    ),

    s(
        {
            trig = "emptyset",
            name = "Empty Set",
            desc = "Empty set symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\emptyset", {})
    ),

    s(
        {
            trig = "tms",
            name = "Times",
            desc = "Times symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\times", {})
    ),

    s(
        {
            trig = "cap",
            name = "Cap",
            desc = "Cap symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\cap", {})
    ),

    s(
        {
            trig = "cup",
            name = "Cup",
            desc = "Cup symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\cup", {})
    ),

    s(
        {
            trig = "neq",
            name = "Not Equal",
            desc = "Not equal symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\neq", {})
    ),


    s(
        {
            trig = "nequal",
            name = "Not Equal",
            desc = "Not equal symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\neq", {})
    ),

    s(
        {
            trig = "leq",
            name = "Less Equal",
            desc = "Less or equal symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\leq", {})
    ),

    s(
        {
            trig = "geq",
            name = "Greater Equal",
            desc = "Greater or equal symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\geq", {})
    ),

    s(
        {
            trig = "lin",
            name = "In",
            desc = "In symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\in", {})
    ),

    s(
        {
            trig = "lnotin",
            name = "Not In",
            desc = "Not in symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\notin", {})
    ),

    s(
        {
            trig = "subset",
            name = "Subset",
            desc = "Subset symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\subset", {})
    ),

    s(
        {
            trig = "simeq",
            name = "Similar Equal",
            desc = "Similar equal symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\simeq", {})
    ),

    s(
        {
            trig = "approx",
            name = "Approx",
            desc = "Approx symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\approx", {})
    ),

    s(
        {
            trig = "lor",
            name = "Logical Or",
            desc = "Logical or",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\lor", {})
    ),

    s(
        {
            trig = "land",
            name = "Logical And",
            desc = "Logical and",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\land", {})
    ),

    s(
        {
            trig = "equiv",
            name = "Equiv",
            desc = "Equiv symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\equiv", {})
    ),

    s(
        {
            trig = "box",
            name = "Box",
            desc = "Box symbol",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\Box", {})
    ),

    s(
        {
            trig = "=>",
            name = "Implies",
            desc = "Implies",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\implies", {})
    ),

    s(
        {
            trig = "<=",
            name = "Implied By",
            desc = "Implied by",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\impliedby", {})
    ),

    s(
        {
            trig = "lar",
            name = "Left Arrow",
            desc = "Left arrow",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\leftarrow", {})
    ),

    s(
        {
            trig = "rar",
            name = "Right Arrow",
            desc = "Right arrow",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\rightarrow", {})
    ),

    s(
        {
            trig = "lra",
            name = "Left Right Arrow",
            desc = "Left right arrow",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\leftrightarrow", {})
    ),

    s(
        {
            trig = "unit",
            name = "Unit",
            desc = "Left right arrow",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\unit{{{}}}", { i(1) })
    ),

    s(
        {
            trig = "cos",
            name = "Cos",
            desc = "Cosine",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\cos", {})
    ),

    s(
        {
            trig = "sin",
            name = "Sin",
            desc = "Sine",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\sin", {})
    ),

    s(
        {
            trig = "tan",
            name = "Tan",
            desc = "Tangent",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\tan", {})
    ),

    s(
        {
            trig = "BRA",
            name = "Bra",
            desc = "Bra",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\langle", {})
    ),

    s(
        {
            trig = "KET",
            name = "Ket",
            desc = "Ket",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
            regTrig = true,
            trigEngine = "ecma",
        },
        fmt("\\rangle", {})
    ),

    s(
        {
            trig = "PAR",
            name = "Left Parenthesis",
            desc = "Left parthensis",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\lparen", {})
    ),

    s(
        {
            trig = "RAP",
            name = "Right Parenthesis",
            desc = "Right parthensis",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,
        },
        fmt("\\rparen", {})
    ),

}
