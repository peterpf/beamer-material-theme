# LaTeX Beamer Material Theme

<p align="center">
<object data="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-lightblue.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-lightblue.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-lightblue.pdf">Download PDF</a>.</p>
    </embed>
</object>
</p>

<p align="center">
<object data="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-purple.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-purple.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="https://raw.githubusercontent.com/peterpf/beamer-material-theme/assets/demo-purple.pdf">Download PDF</a>.</p>
    </embed>
</object>
</p>

## Setup

```bash
sudo apt-get install texlive-latex-extra latexmk
```

This will install a full latex distribution. Additionally, `python3`, `pip3` and `rake` are required to build the theme

```bash
sudo apt-get install python3-pip rake
```

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

## Generating a theme

The theme can be tuned via the `config.json` file (make a copy of `config.json.template` and rename it to `config.json`).
If the complementary colors are not set, they will be calculated based on their respective colors.
To generate the theme for the given config, do:

```bash
rake setup // This will create the config.json file
rake python_setup // only required once to install required python libraries
rake default // The build task
```

This copies the files in `src` into a `dist` folder and configures the theme accordingly.

## Important Notes

- Packages that should not be included
  - `graphicx` or `graphics` as they are already included in beamer
  - `transparency`, `svg` as it messes with the tikz package's `fill opacity` (shadows won't be displayed correctly)
