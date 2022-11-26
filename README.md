# LaTeX Beamer Material Theme

A beamer theme inspired by Google's material design with adjustable colors and side-by-side layout.

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

## Installation

Prerequisite:
`LuaTex` and the `roboto` font are required to compile the presentation.

Download the repository into your working directory and rename it to `theme`.
Continue with the following steps:

- Copy [example.tex](example.tex) from `theme/src` folder to the same levels as the `theme` folder. Do the same for the `theme/images` folder. Your working directory should look like this:

    ```bash
    .
    ├── images/
    ├── theme/
    |   ├── src/
    |   ├── example.tex
    ├── example.tex
    ├── ...
    ```

- Open the `example.tex` file and adapt:

  - References to the theme:

  ```latex
  \usepackage{src/beamerthemematerial} % replace this
  \usepackage{theme/src/beamerthemematerial} % with this
  ```

  - Refences to the `images` folder:

    ```latex
    \includegraphics[width=0.8\textwidth]{theme/images/tensorflow.pdf}
    ```

- Open [theme/src/beamerthemematerial.sty](src/beamerthemematerial.sty) and adapt the paths for the styles:

  ```latex
  \usepackage{theme/src/material_colors}
  \usepackage{theme/src/beamerinnerthemematerial}
  \usepackage{theme/src/beamerouterthemematerial}
  \usepackage{theme/src/beamercolorthemematerial}

  \directlua {
    local settings = require("theme/src/settings")
    local Utils = require("theme/src/Utils")
  }
  ```

- Open [theme/src/settings.lua](src/settings.lua) and adapt the references:

  ```lua
  local Utils = require("theme/src/Utils")
  local config = require("theme/src/config")
  ```

- Open [theme/src/Utils.lua](src/Utils.lua) and adapt the references:

  ```lua
  local ColorUtils = require("theme/lib/colors")
  ```

Use the `example.tex` file as a starting point for your presentation (you can rename it to whatever you'd like).

## Include as git submodule

Go to your working directory and clone the `beamer-material-theme` repository into the folder `theme` with

```bash
git submodule add git@github.com:peterpf/beamer-material-theme.git theme
```

Follow the steps described in the *Installation* section.

## Theme Configuration

Colors can be adapted via the [config.lua](src/config.lua).
Undefined complementary colors will be calculated based on their respective main colors.
Predefined themes are already there, choose the one you want by changing the return value of [config.lua](src/config.lua), or create your own:

```lua
return lightBlue
-- or
return darkPurple
```

## Working with Visual Studio Code

It is possible to automatically build the beamer presentation with Visual Studio Code (VSCode).
The following extensions are necessary:

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities)

Configure the extensions by opening  `Command Palete -> User Settings (JSON)` and add or update the following lines:

```json
"latex-workshop.latex.tools": [
  {
    "name": "xelatexmk",
    "command": "latexmk",
    "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-xelatex",
      "-outdir=%OUTDIR%",
      "%DOC%"
    ],
    "env": {}
  },
]

"latex-workshop.latex.recipes": [
  {
    "name": "latexmk (xelatex)",
    "tools": [
      "xelatexmk"
    ]
  },
]
```

After saving the `User Settings (JSON)` file you should be able to see a meny entry in the LaTeX Workshop tool:

![Viewing the build recipes of the LaTeX Workshop extension](/images/latex-workshop-extension-view.png)

## Compiling the presentation with docker

If you don't want to install dependencies and rather use `docker` to produce a PDF file from your LaTeX file, follow the instructions below.

Execute following commands in the directory of the cloned repository:

```bash
docker build . -t latex-beamer
docker run -v $PWD:/data/ latex-beamer example.tex
```

Replace `example.tex` with your presentation's tex file.
Execute the docker command mentioned above in the project root folder.

## Important Notes

- Packages that should not be included
  - `graphicx` or `graphics` as they are already included in beamer
  - `transparency`, `svg` as it messes with the tikz package's `fill opacity` (shadows won't be displayed correctly)

## Shoutouts

- [docker-luatex](https://github.com/brokenpylons/docker-lualatex)
- [docker-texlive](https://github.com/thomasWeise/docker-texlive)
- [Lua Colors Library](https://github.com/yuri/lua-colors)
