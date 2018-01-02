#! /bin/bash -eu

cd "$(dirname "$0")"

# if doxygen is missing, cmakefile silently ignores documentation
command -v doxygen >/dev/null || { echo "doxygen not found"; exit 1; }

rm -rf build
mkdir build
cd build

export CMAKE_FLAGS="-DTINYSPLINE_DOUBLE_PRECISION=YES"

fig --file ../package.fig -- cmake ..
fig --file ../package.fig -- cmake --build .
