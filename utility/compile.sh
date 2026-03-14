#!/bin/zsh
# Compile the LaTeX source files into a PDF document.
# Run at the root of the repository.
#
# Requirements: platex, bibtex, dvipdfmx must be available in PATH.
#   Recommended distribution: TeX Live (https://www.tug.org/texlive/)
#   macOS (Homebrew): brew install --cask mactex
#   Linux (apt):      sudo apt install texlive-full
#
# BibTeX is run automatically for every chapter .aux file found under
# build/chapters/, so new chapters are picked up without editing this script.

# Clean up previous build artifacts
rm -rf ../build
mkdir -p ../build/chapters

cd src
platex -interaction=nonstopmode -output-directory=../build main.tex
mkdir -p ../build/chapters

# Run BibTeX for each chapter that produced an .aux file
cd ../build
for aux in chapters/*.aux(N); do
    BSTINPUTS=../src: BIBINPUTS=../src: bibtex "${aux%.aux}"
done
cd ../src

platex -interaction=nonstopmode -output-directory=../build main.tex
platex -interaction=nonstopmode -output-directory=../build main.tex
dvipdfmx -o ../build/main.pdf ../build/main.dvi