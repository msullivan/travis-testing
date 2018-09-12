#!/bin/bash -eux

# Unpack a modern clang version
(cd / && curl https://github.com/msullivan/travis-testing/releases/download/llvm/llvm-centos-5.tar.gz | tar xf -)

cd /io/

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    #  if [ $(echo "${PYBIN}" | grep -o '[[:digit:]][[:digit:]]' | head -n 1) -ge 35 ]; then
    if [ $(echo "${PYBIN}" | grep -o '[[:digit:]][[:digit:]]' | head -n 1) -ge 37 ]; then
      # only builds on Python 3.5 and newer
      PYTHONPATH=/mypyc CC=/opt/llvm/bin/clang MYPYC_OPT_LEVEL=0 "${PYBIN}/python3" setup.py --use-mypyc bdist_wheel
  fi
done

# Bundle external shared libraries into the wheels
for whl in dist/*.whl; do
    auditwheel repair "$whl" -w /io/wheelhouse/
done
