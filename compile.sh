#!/bin/sh
# Get the draft name from Git
DRAFT=$(git rev-parse --abbrev-ref HEAD)
DRAFT_FILE="drafts/${DRAFT}/${DRAFT}"

echo "Compiling new draft \"${DRAFT}\"..."

# Create the draft directory if it doesn't already exist
mkdir -p drafts/${DRAFT}

# Initialize new main file
echo > $DRAFT_FILE.md

# Grab content files and add a page break to the end of each one.
find ./content/*.md -print0 | sort -z | while read -d $'\0' file
do
	echo >> $DRAFT_FILE.md
	cat "$file" >> $DRAFT_FILE.md
	echo "\\newpage" >> $DRAFT_FILE.md
done

# Generate the output files:
#		Markdown -> DOCX
#		Markdown -> EPUB
#		Markdown -> PDF (A4 size)
#		Markdown -> PDF (B6/Standard book size)
pandoc -t docx $DRAFT_FILE.md -o $DRAFT_FILE.docx --metadata-file metadata.yml
pandoc -t epub $DRAFT_FILE.md -o $DRAFT_FILE.epub --metadata-file metadata.yml
pandoc $DRAFT_FILE.md -o ${DRAFT_FILE}-a4.pdf --metadata-file metadata.yml -V geometry:"a4paper" -V fontsize:"12pt"
pandoc $DRAFT_FILE.md -o ${DRAFT_FILE}-b6.pdf --metadata-file metadata.yml -V geometry:"b6paper" -V fontsize:"10pt"

echo "Done! Your new draft is in ${PWD}/drafts/${DRAFT}/"
