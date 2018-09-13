function pre_build {
    pip install -r mypy/test-requirements.txt
    export MYPY_USE_MYPYC=1
    export MYPYC_OPT_LEVEL=0
    export PYTHONPATH="$PWD/mypyc:$PYTHONPATH"
    if [ -n "$IS_OSX" ]; then
	# Unpack a modern clang version
	(cd / && curl -L https://github.com/msullivan/travis-testing/releases/download/llvm/llvm-centos-5.tar.gz | tar xzf -)
	export CC=/opt/llvm/bin/clang
    fi

}

function run_tests {
    true
}
