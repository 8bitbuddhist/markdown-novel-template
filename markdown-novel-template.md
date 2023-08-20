---
date-created: '2023-08-15 12:08'
date-modified: '2023-08-20 10:08'
---
# Markdown Novel Template

%% Begin Waypoint %%
- **[[content]]**
- **drafts**
	- **[[main]]**
- **[[notes]]**

%% End Waypoint %%

This folder provides a blank novel template for writing in the [Markdown](https://daringfireball.net/projects/markdown/) markup language. This also provides a script for compiling the complete work into Markdown, EPUB, Microsoft Word, and PDF formats.

Note: The script is designed primarily for Linux and macOS. Windows is untested.

## Adding your content

The main contents of your novel should be stored in the `content/` folder as Markdown (`.md`) files. Each file corresponds to a single section or chapter of your final book.

When compiling the novel, all Markdown files are sorted in alphabetical order and merged, with page breaks added automatically at the end of each file.

The `notes` folder is for any content that you don't want to include in the final draft. Use this folder to store research, storyboards, images, etc.

**Note:** You don't need a Title Page or Table of Contents. These are automatically generated for you!

### Recommended file structure

You can name the files in this folder however you want, but this template uses the following naming convention:

- `AXX_` for front Matter (Foreward, Preface, etc.):
  - A01_Copyright.md
  - A02_Preface.md
  - …
- `CXX_` for chapters:
  - C01.md
  - C02.md
  - …
- `EXX_` for back Matter (Appendices, Epilogues, etc.):
  - E01_Appendix.md
  - E02_Epilogue.md
  - …

## Compiling your novel

`compile.sh` is a helper script that compiles and formats your novel into the following formats:

- A single combined Markdown (`.md`) file.
- EPUB
- DOCX
- PDF (A4 sized)
- PDF (B6 sized)

### Requirements

To use the script, you'll need to install the following software (this list is for Arch Linux):

- `find`
- `pandoc`
- `pandoc-crossref`
- `texlive-core`
- `texlive-fontsrecommended`
- `texlive-latexrecommended`

### Setting your own metadata (title, author, etc.)

The `metadata.yml` file contains fields for setting the book's `title`, `subtitle`, `author`, and publication `date`. The compile script uses this data to generate a title page. You can customize these fields as needed.

### Changing the cover image

Set your own cover image by replacing `cover.png`.

### Compiling

Run `compile.sh` to compile your novel:

```bash
./compile.sh
```

This creates a subfolder in `drafts` named after the current git branch. For example, if your branch is called `main`, then your drafts will be created in `drafts/main/`. I recommend creating a new branch for each draft, but how you manage this is up to you.

Happy writing!
