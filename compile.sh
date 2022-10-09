#!/bin/sh
DRAFT_NUM=1
DRAFT_FILE="Draft ${DRAFT_NUM}"

# Create the draft directory if it doesn't already exist
mkdir -p drafts/draft\ $DRAFT_NUM

# Add page breaks to the end of each Markdown file
gawk 'FNR==1{print ""}1; ENDFILE{print "\\newpage"}' *.md > drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.md

# Compile to docx and PDF
pandoc -t docx drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.docx --metadata-file metadata.yml &&\
pandoc drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.pdf --metadata-file metadata.yml --toc --toc-depth=1 -V geometry:margin=1in
	
# Compile to epub by compiling to latex first
pandoc -t latex drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.tex &&\
pandoc -t epub drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.tex -o drafts/draft\ $DRAFT_NUM/$DRAFT_FILE.epub --metadata-file metadata.yml --toc --toc-depth=1 --epub-cover-image=Notes/cover.png
