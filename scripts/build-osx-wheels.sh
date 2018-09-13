#!/bin/bash -eux

set -e
pyenv install --list
echo "YOOO 1"
ls -l
echo "YOOO 1.5"
cd mypy
echo "YOOO 2"
PYTHONPATH=../mypyc MYPYC_OPT_LEVEL=0 python3 setup.py --use-mypyc bdist_wheel
echo "YOOO 3"
mv dist ../wheelhouse
