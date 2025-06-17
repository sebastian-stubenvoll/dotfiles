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


local generate_fraction = function (_, snip)
    local stripped = snip.captures[1]
    local depth = 0
    local j = #stripped
    while true do
        local c = stripped:sub(j, j)
        if c == "(" then
            depth = depth + 1
        elseif c == ")" then
            depth = depth - 1
        end
        if depth == 0 then
            break
        end
        j = j - 1
    end
    return sn(nil,
        fmt("{}\\frac{{{}}}{{{}}}",
        { t(stripped:sub(1, j-1)), t(stripped:sub(j+1, -2)), i(1)}))
end

return {
    -- some of these need to be regex snippets instead of postfix ones :/
    -- (theres a 80% chance this is because i refused to properly read the docs on lua patterns)
    -- TODO?
    s(
        {
            trig = tex.exp_trigger("BAR"),
            name = "overline",
            desc = "Adds an overline above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\overline{{{}}}", { f(function(args, snip) return snip.captures[1] end )})
    ),

    s(
        {
            trig = tex.exp_trigger("HAT"),
            name = "hat",
            desc = "Adds the  ̂ hat above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\hat{{{}}}", { f(function(args, snip) return snip.captures[1] end )})
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
            trig = tex.exp_trigger("d(\\d*)dot"),
            name = "time derivative dots",
            desc = "Puts N dots above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\{}ot{{{}}}", 
            { f(function(args, snip)
                local repeats = tonumber(snip.captures[#snip.captures])
                if repeats then
                    return string.rep("d", repeats) 
                else
                    return "d"
                end
            end ),
            f(function(args, snip) return snip.captures[1] end ) }
        )
    ),

    s(
        {
            trig = tex.exp_trigger("(\\.,|,\\.)"),
            name = "vector postfix",
            desc = "Puts a vector arrow above the previous object [math only]",
            trigEngine = "ecma",
            snippetType = "autosnippet",
            condition = tex.in_mathzone,

        },
        fmt("\\vec{{{}}}", { f(function(args, snip) return snip.captures[1] end ) })
    ),

   s(
        { 
            trig=tex.exp_trigger("\\/\\/"), 
            name='fraction', 
            desc='auto fraction 1', 
            trigEngine="ecma",
            snippetType = "autosnippet",
            condition = tex.in_math
        },
        fmt("\\frac{{{}}}{{{}}}{}",{ f(function (_, snip) return snip.captures[1] end), i(1), i(0) })
    ),

    s(
        { 
            trig='(^.*\\))\\/\\/',
            name='fraction',
            desc='auto fraction 2',
            trigEngine="ecma",
            snippetType = "autosnippet",
            condition = tex.in_math
        },
        { d(1, generate_fraction) }
    ),

   s(
        { 
            trig=tex.exp_trigger("\\/\\/"), 
            name='fraction', 
            desc='auto fraction 1', 
            trigEngine="ecma",
            snippetType = "autosnippet",
            condition = tex.in_math
        },
        fmt("\\frac{{{}}}{{{}}}{}",{ f(function (_, snip) return snip.captures[1] end), i(1), i(0) })
    ),
}
