#!/usr/bin/env perl

# LaTeX
$latex = 'platex %O -src-specials -shell-escape -interaction=nonstopmode -synctex=1 -kanji=utf8 %S';
$max_repeat = 4;

$pdflatex = 'pdflatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$lualatex = 'lualatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';
$xelatex = 'xelatex %O -synctex=1 -interaction=nonstopmode -file-line-error %S';

# BibTeX
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';
$bibtex = 'pbibtex %O %B -kanji=utf8';

# index
$makeindex = 'mendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf.exe %O %S %D';

# $pdf_mode = 0; PDF を作成しません。
# $pdf_mode = 1; $pdflatex を利用して PDF を作成します。
# $pdf_mode = 2; $ps2pdf を利用して .ps ファイルから PDF を作成します。
# $pdf_mode = 3; $dvipdf を利用して .dvi ファイルから PDF を作成します。
# $pdf_mode = 4; $lualatex を利用して .dvi ファイルから PDF を作成します。
# $pdf_mode = 5; xdvipdfmx を利用して .xdv ファイルから PDF を作成します。
$pdf_mode = 4;

$max_repeat = 5;

$pvc_view_file_via_temporary = 0;
$pdf_previewer = "";

$local_latexmkrc_path = './.latexmkrc.local';
require $local_latexmkrc_path if -e $local_latexmkrc_path;
