# LaTeX Beamer Material Theme

## Setup

- `sudo apt-get install texlive-latex-extra latexmk`

## Include as git submodule

Go to your working directory and clone the `beamer-material-theme` repository into the folder `beamer-material-theme`.
Then do following:

* Open `beamerthemematerial.sty` and replace
  ```
  \usepackage{material_colors}

  \useinnertheme{material}
  \useoutertheme{material}
  \usecolortheme{material}
  ```
  with
  ```
  \usepackage{beamer-material-theme/material_colors}

  \usepackage{beamer-material-theme/beamerinnerthemematerial}
  \usepackage{beamer-material-theme/beamerouterthemematerial}
  \usepackage{beamer-material-theme/beamercolorthemematerial}
  ```
