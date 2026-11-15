" plug: typst.vim

" edit figure in Inkscape
function EditFig()
	" expands filename under cursor
	let figure_fname = expand('<cfile>')
	exec "silent !typst-figure " .. figure_fname
	sp
	exec "term inkscape-shortcut-single"
	quit
endfunc

nnoremap <silent><leader>ff :call EditFig()<cr>

" imports latest screenshot (from clipboard) into a figure
function ScreenshotFig()
	call system("mkdir -p " . expand("<cfile>:h") . ";"
		\ . "TEMP=$(mktemp --suffix=.png)" . ";"
		\ . 'xclip -selection clipboard -t image/png -o > "$TEMP"' . ";"
		\ . 'ffmpeg -y -i $TEMP "'.expand("<cfile>").'";'
	\ )
endfunc
      " \ . 'rm "$TEMP"' . ";"

nnoremap <silent><leader>fs :call ScreenshotFig()<cr>
