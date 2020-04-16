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

`LuaTex` and the `roboto` font are required to compile the presentation.

As an alternative, use this `docker` container to produce a pdf file.
Execute following commands in the directory of the cloned repository:

```bash
docker build . -t latex-beamer
docker run -v $PWD:/data/ latex-beamer example.tex
```

Replace `example.tex` with the main tex file.

## Include as git submodule

Go to your working directory and clone the `beamer-material-theme` repository into the folder `theme` with

```bash
git submodule add git@github.com:peterpf/beamer-material-theme.git theme
```

Then do following:

- Open [src/beamerthemematerial.sty](src/beamerthemematerial.sty) and adapt the paths for the styles:

  ```latex
  \usepackage{theme/src/material_colors}
  \usepackage{theme/src/beamerinnerthemematerial}
  \usepackage{theme/src/beamerouterthemematerial}
  \usepackage{theme/src/beamercolorthemematerial}
  ```

- Copy `example.tex` from `src` folder to `theme` folder:

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

- Use the copied file as a starting point for your presentation.
- Execute the docker command mentioned above in the project root folder.

## Theme Configuration

Colors can be adapted via the `src/config.lua`.
If the complementary colors are not set, they will be calculated based on their respective main colors.

## Important Notes

- Packages that should not be included
  - `graphicx` or `graphics` as they are already included in beamer
  - `transparency`, `svg` as it messes with the tikz package's `fill opacity` (shadows won't be displayed correctly)

## Shoutouts

- [docker-luatex](https://github.com/brokenpylons/docker-lualatex)
- [docker-texlive](https://github.com/thomasWeise/docker-texlive)
- [Lua Colors Library](https://github.com/yuri/lua-colors)
