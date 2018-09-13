#!/bin/bash -eux

set -e
cd mypy
PYTHONPATH=../mypyc MYPYC_OPT_LEVEL=0 python3 setup.py --use-mypyc bdist_wheel
mv dist ../wheelhouse
