# LaTeX Beamer Material Theme

## Setup

`sudo apt-get install texlive-latex-extra latexmk`

## Include as git submodule

Go to your working directory and clone the `beamer-material-theme` repository into the folder `theme` with

```bash
git submodule add git@github.com:peterpf/beamer-material-theme.git theme
```

Then do following:

- Copy the `example.tex` file from the `theme` folder to the same level as this folder:

    ```bash
    .
    ├── theme
    |   ├── src/
    |   ├── dist/
    |   ├── example.tex
    ├── example.tex
    ├── ...
    ```

- Use the `example.tex` file as a starting point for our presentation.
