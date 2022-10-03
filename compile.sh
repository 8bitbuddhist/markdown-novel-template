#!/bin/zsh
DRAFT_NUM=1
DRAFT_FILE="Draft_${DRAFT_NUM}"

mkdir drafts/draft_$DRAFT_NUM
gawk 'FNR==1{print ""}1; ENDFILE{print "\\newpage"}' *.md > drafts/draft_$DRAFT_NUM/$DRAFT_FILE.md
pandoc -t docx drafts/draft_$DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft_$DRAFT_NUM/$DRAFT_FILE.docx --metadata-file metadata.yml
pandoc -t epub drafts/draft_$DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft_$DRAFT_NUM/$DRAFT_FILE.epub --metadata-file metadata.yml
pandoc drafts/draft_$DRAFT_NUM/$DRAFT_FILE.md -o drafts/draft_$DRAFT_NUM/$DRAFT_FILE.pdf --metadata-file metadata.yml
