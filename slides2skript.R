#!/usr/bin/env Rscript
file <- commandArgs(trailingOnly = TRUE)[1]

library(stringr)

txt <- readLines("~/teaching/linalg-lmu/material/latex-templates/test.tex")

to_remove <- c(
  "\\begin\\{frame\\}",
  "\\end{frame}",
  "\\onslide",
  "\\pause"
)
str_remove(txt, to_remove[4])

grepl(".*begin.*frame.*", txt)


"\\setbeamertemplate",
