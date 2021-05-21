import sys  # isort: skipe

sys.path.insert(
    0, '/data/songlin/repos/tensorflow/bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/org_tensorflow'
)
import tensorflow as tf  # isort: skipe
import os

print(os.getpid())
print(tf.__file__)

# set breakpoint
a = tf.add([1, 2, 3], [-1, -2, -3])
print(a)
