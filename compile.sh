#!/bin/sh
# Get the draft name from Git
DRAFT=$(git rev-parse --abbrev-ref HEAD) &&\
DRAFT_FILE="drafts/${DRAFT}/${DRAFT}" &&\

# Create the draft directory if it doesn't already exist
mkdir -p drafts/${DRAFT} &&\

# Add page breaks to the end of each Markdown file
gawk 'FNR==1{print ""}1; ENDFILE{print "\\newpage"}' *.md > $DRAFT_FILE.md &&\

# Generate the output files:
#		Markdown -> DOCX
#		Markdown -> EPUB
#		Markdown -> PDF (A4 size)
#		Markdown -> PDF (standard book size)
pandoc -t docx $DRAFT_FILE.md -o $DRAFT_FILE.docx --metadata-file metadata.yml
pandoc -t epub $DRAFT_FILE.md -o $DRAFT_FILE.epub --metadata-file metadata.yml
pandoc $DRAFT_FILE.md -o ${DRAFT_FILE}_full.pdf --metadata-file metadata.yml -V geometry:"paper=letterpaper,layout=letterpaper"
pandoc $DRAFT_FILE.md -o ${DRAFT_FILE}_book.pdf --metadata-file metadata.yml -V geometry:"paper=b5paper,layout=b5paper"

echo "Done! Your new draft is in ${PWD}/drafts/${DRAFT}/"