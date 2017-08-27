@echo off

set original_dir=%CD%/emscripten

echo.
echo *********************************************
echo * COMPILING BOSS WITH EMSCRIPTEN            *
echo *********************************************
echo.

./emscripten/make -j 8