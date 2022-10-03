# Markdown Novel Template

This folder provides a blank novel template for writing in the [Markdown](https://daringfireball.net/projects/markdown/) markup language. This also provides a script for compiling the complete work into Markdown, EPUB, Microsoft Word, and PDF formats.



## File Naming

This project uses this file naming convention:

- Front Matter (Foreward, Preface, etc.) pages start with `A*`:
  - A1_Copyright.md
  - A2_Dedication.md
  - A3_Forward.md
  - etc.
- Chapters start with `Chapter_*`:
  - Chapter_01.md
  - Chapter_02.md
  - etc.
- Back Matter (Appendices, Epilogues) pages start with `EA*`
  - EA1_Appendix.md
  - EA2_Epilogue.md
  - etc.
- Author’s notes (research, storyboards, etc.) are stored in the `Notes` folder. You can structure this folder however you wish. None of its contents will be compiled into your final novel.

You don’t need a Title Page or Table of Contents. These are automatically generated for you!

## Compiling the Novel

To compile your novel into a complete ebook, use the `compile.sh` script. 

### Requirements

You’ll need to install the following software first: `gawk` `pandoc` `pandoc-crossref` `texlive-core`.



### Setting metadata

The compile script pulls metadata from `metadata.yml` when generating the ebook. In this file, make sure to change the `title`, `subtitle`, `author`, and `date` fields to suit your needs.



### Compiling

Run the `compile.sh` file to compile the novel into a single complete Markdown file, a Word document, an EPUB file, and a PDF, named `Draft <draft num>.ext`. These are saved under the `drafts` folder using the draft number identified by `DRAFT_NUM`.



Happy writing!