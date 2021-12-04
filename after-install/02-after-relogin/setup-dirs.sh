#!/usr/bin/env bash

mkdir -p "$HOME"/.local/share/{themes,icons,fonts}
ln -sf "$HOME"/.local/share/themes "$HOME"/.themes
ln -sf "$HOME"/.local/share/icons "$HOME"/.icons
ln -sf "$HOME"/.local/share/fonts "$HOME"/.fonts
