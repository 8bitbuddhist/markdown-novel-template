# Markdown Novel Template

This folder provides a blank novel template for writing in the [Markdown](https://daringfireball.net/projects/markdown/) markup language. This also provides a script for compiling the complete work into Markdown, EPUB, Microsoft Word, and PDF formats.

## File Structure

The contents of your novel are stored in the `content` folder. Each file corresponds to a single chapter/section of the book. This folder uses the following file naming convention:

- `AXX_` files are for front Matter (Foreward, Preface, etc.):
  - A01_Copyright.md
  - A02_Preface.md
  - etc.
- `CXX_` files are for chapters:
  - C01.md
  - C02.md
  - etc.
- `EXX_` files are for back Matter (Appendices, Epilogues):
  - E01_Appendix.md
  - E02_Epilogue.md
  - etc.

The `notes` folder is for any content that you don't want included in the final draft. Use this folder to store research, storyboards, images, etc. You can structure this folder however you want.

**Note:** You don’t need a Title Page or Table of Contents. These are automatically generated for you!

## Compiling the Novel

The `compile.sh` script is a helper script meant to compile and format your novel into common file formats (EPUB, DOCX, and PDF).

### Requirements

You’ll need to install the following software:

- `gawk`
- `pandoc`
- `pandoc-crossref`
- `texlive-core`

### Setting metadata

The compile script pulls metadata from `metadata.yml` when generating the ebook. Make sure to change the `title`, `subtitle`, `author`, and `date` fields to meet your requirements.

### Changing the cover image

Replace `cover.png` with your cover image.

### Compiling

Run the `compile.sh` file to compile your novel. This creates a subfolder in `drafts` named after the current git branch. For example, if your branch is called `main`, then your drafts will be created in `drafts/main/`. I recommend creating a new branch for each draft, but how you manage this is up to you.

Happy writing!
