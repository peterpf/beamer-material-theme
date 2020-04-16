# LaTeX Beamer Material Theme

<p align="center">
  <a href="demo/lightblue.pdf">
    <img src="demo/lightblue-01.png?raw=true">
  </a>
  <a href="demo/lightblue.pdf">
    <img src="demo/lightblue-02.png?raw=true">
  </a>
  <a href="demo/darkpurple.pdf">
    <img src="demo/darkpurple-02.png?raw=true">
  </a>
  <a href="demo/lightblue.pdf">
    <img src="https://github.com/peterpf/beamer-material-theme/blob/develop/demo/lightblue-03.png?raw=true">
  </a>
</p>

## Setup

`LuaTex` and the `roboto` font are required to compile the presentation.

As an alternative, use the included `docker` container to produce a pdf file.
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

- Copy [example.tex](example.tex) from `src` folder to `theme` folder:

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

Colors can be adapted via the [config.lua](src/config.lua).
Undefined complementary colors will be calculated based on their respective main colors.
Predefined themes are already there, choose the one you want by changing the return value of [config.lua](src/config.lua), or create your own:

```lua
return lightBlue
-- or
return darkPurple
```

## Important Notes

- Packages that should not be included
  - `graphicx` or `graphics` as they are already included in beamer
  - `transparency`, `svg` as it messes with the tikz package's `fill opacity` (shadows won't be displayed correctly)

## Shoutouts

- [docker-luatex](https://github.com/brokenpylons/docker-lualatex)
- [docker-texlive](https://github.com/thomasWeise/docker-texlive)
- [Lua Colors Library](https://github.com/yuri/lua-colors)
