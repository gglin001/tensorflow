# prepare for building
./configure

# quick test debug
bazel build --copt="-O0" -c dbg //tensorflow/c/kernels:tensor_shape_utils_test

# bazel build \
#     --config=noaws \
#     --config=nogcp \
#     --config=nohdfs \
#     --config=nonccl \
#     --config=monolithic \
#     --config=xla \
#     --copt="-O0" --copt="-g" --strip=never \
#     //tensorflow/c/kernels:tensor_shape_utils_test

# build tf in debug without compile_commands.json
# if raise Undefined symbol see
# https://github.com/tensorflow/tensorflow/issues/39521

bazel build \
    --config=noaws \
    --config=nogcp \
    --config=nohdfs \
    --config=nonccl \
    --config=xla \
    --copt="-O0" -c dbg \
    //tensorflow/tools/pip_package:build_pip_package

# ./bazel-bin/tensorflow/tools/pip_package/build_pip_package ./tf_wheel
# direct import tensorflow in below dir, detial in `demos/demo.py`
bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/org_tensorflow

# bazel fetch //tensorflow/tools/pip_package:build_pip_package
