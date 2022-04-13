#!/usr/bin/env Rscript
file <- commandArgs(trailingOnly = TRUE)[1]

library(stringr)

txt <- readLines(file)

remove_words <- c(
  "\\onslide",
  "\\pause",
  "\\cmark"
)

remove_lines <- c(
  "\\begin{frame}",
  "\\end{frame}",
  "\\frametitle",
  "\\setbeamertemplate",
  "\\begin{block}",
  "\\end{block}",
  "%--"
)

for (pattern in remove_words) {
  txt <- str_remove(txt, fixed(pattern))
}

for (pattern in remove_lines) {
  txt <- txt[!str_detect(txt, fixed(pattern))]
}

writeLines(txt, str_c(str_remove(file, fixed(".tex")), "-stripped.tex"))
