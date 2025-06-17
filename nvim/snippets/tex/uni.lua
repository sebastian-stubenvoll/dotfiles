local tex = {}
tex.in_mathzone = function()
        return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
        return not tex.in_mathzone()
end

return {
  -- Environments
    s({ 
        trig = "sitz",
        name = "Uni Sitzung",
        condition = conds.line_begin + tex.in_text
    },
        fmta([[
\begin{flushright}
    \fbox{
        <>. Sitzung
    }
\end{flushright}

\begin{table}[htpb]
    \centering
    \label{tab:Inhalt}
    \begin{tabular}{c}
    Inhalt \\ \hline
    <>
    \end{tabular}
\end{table}
<>
    ]], {i(1), i(2), i(0) })
    ),

    s({ 
        trig = "beisp",
        name = "Beispiel",
        condition = conds.line_begin + tex.in_text
    },
        fmta([[

\textbf{Beispiel: <>} \\
\fbox{
\noindent
    \begin{minipage}{0.967\linewidth}
		<>
    \end{minipage}
}
<>
    ]], {i(1), i(2), i(0) })
    ),
}
