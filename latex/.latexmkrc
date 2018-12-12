$dvi_previewer = 'start xdvi -watchfile 1.5';
$ps_previewer  = 'start gv --watch';
$pdf_previewer = 'start evince';

$pdf_mode = 1;              #tex -> pdf
#$pdf_mode = 2;              #tex -> ps -> pdf
#$postscript_mode = 1;       #tex -> ps

@default_files = ('main.tex');

$out_dir = 'build';                     #outdir
$clean_ext = "bbl spl synctex.gz";      #other extension to rm
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape -synctex=1 -halt-on-error';
