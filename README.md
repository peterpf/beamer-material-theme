# LaTeX Beamer Material Theme

<p align="center">
  <a href="demo/demo-lightblue.pdf">
    <img src="demo/demo-lightblue-0.png?raw=true">
  </a>
  <a href="demo/demo-lightblue.pdf">
    <img src="demo/demo-lightblue-1.png?raw=true">
  </a>
  <a href="demo/demo-lightblue.pdf">
    <img src="https://github.com/peterpf/beamer-material-theme/blob/develop/demo/demo-lightblue-2.png?raw=true">
  </a>
</p>

## Setup

`LuaTex` is required to compile to compile this presentation.

This will install a full latex distribution.

```bash
sudo apt-get install texlive-luatex latexmk
```

## Include as git submodule

Go to your working directory and clone the `beamer-material-theme` repository into the folder `theme` with

```bash
git submodule add git@github.com:peterpf/beamer-material-theme.git theme
```

Then do following:

- Copy the `example.tex` file from the `theme` folder to the same level as your root folder:

    ```bash
    .
    ├── theme
    |   ├── src/
    |   ├── example.tex
    ├── example.tex
    ├── ...
    ```

- Open the copied file and look for the line that includes the theme:

  ```latex
  \usepackage{src/beamerthemematerial} % replace this
  \usepackage{src/beamerthemematerial} % with this
  ```

- Use the `example.tex` file as a starting point for your presentation.

## Theme Configuration

Colors can be adapted via the `src/config.lua`.
If the complementary colors are not set, they will be calculated based on their respective main colors.

## Important Notes

- Packages that should not be included
  - `graphicx` or `graphics` as they are already included in beamer
  - `transparency`, `svg` as it messes with the tikz package's `fill opacity` (shadows won't be displayed correctly)
