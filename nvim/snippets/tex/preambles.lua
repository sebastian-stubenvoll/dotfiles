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
        trig = "preamble",
        name = "preamble",
        condition = conds.line_begin + tex.in_text
    },
        fmta([[
%%! TeX program = lualatex

\documentclass[12pt]{article}

<>\usepackage{apacite}
<>\bibliographystyle{apacite}

\usepackage[T1]{fontenc}	
\usepackage[bottom,hang]{footmisc}
\usepackage{polyglossia}
\setmainlanguage{german}
\usepackage{xltxtra}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{dsfont}
\usepackage{url}
\usepackage{graphicx}
\usepackage[bf,hang,nooneline,justification=centering]{caption}
\usepackage{booktabs}
\usepackage{multicol}
\usepackage{setspace}
\usepackage{tabto}
\usepackage{tabularx}
\usepackage[a4paper, left=2cm, top=2cm, bottom=2cm, right=3.5cm]{geometry}
\usepackage{pdfpages}
\usepackage{siunitx}
\onehalfspacing
\usepackage{import}
\usepackage{transparent}
\usepackage{xcolor}

\newcommand{\incfig}[2][1]{
    \def\svgwidth{#1\columnwidth}
    \import{./figures/}{#2.pdf_tex}
}

%%Uncomment for title page
<>\setcounter{secnumdepth}{0}


\begin{document}

<>\pagenumbering{gobble}

<>\includepdf[pages=-]{<>.pdf}

\tableofcontents

\newpage
<>\pagenumbering{arabic} \setcounter{page}{<>}

<>

\newpage
<>\bibliography{<>}}
\end{document}
    ]], {i(1, "%"), rep(1), i(2, "%"), rep(2), rep(2), i(3), i(4, "%"), i(5), i(0), rep(1), i(6, "bibfile") })
    ),
}
