#!/bin/bash
# This is a command line script that uses the pdfimages package to extract images from pdf

for s in *.pdf ; do
	base=$(basename $s .pdf) # remove suffix .pdf and get basename
	echo "$base"
	rm -r "$base"
	mkdir "$base"
	dir="$base""/"
	pdfimages -j "$s" "$dir" # extract images from pdf using pdfimages
	for t in "$dir"* ; do
		echo "$t"
		base2=$(basename $t .jpg) # remove suffix .jpg and get basename
		mv "$t" "$dir""$base""$base2"".jpg" # rename image files
	done
done
