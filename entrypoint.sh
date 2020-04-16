#!/bin/sh
TARGET_TEX_FILE=$1
TARGET_FILENAME=${TARGET_TEX_FILE%".tex"}
latexmk \
    -e "\$max_repeat=2" \
    -lualatex \
    -synctex=1 \
    -interaction=nonstopmode \
    -file-line-error \
    ${TARGET_TEX_FILE}

# Save output pdf and then clean
mv "${TARGET_FILENAME}.pdf" "${TARGET_FILENAME}.original.pdf"
latexmk -c
mv "${TARGET_FILENAME}.original.pdf" "${TARGET_FILENAME}.pdf"