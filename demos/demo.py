import os
import sys

print(os.getpid())

# tensorflow_path = (
#     '/Users/allen/gglin001/tensorflow/bazel-bin/tensorflow/tools/pip_package/build_pip_package.runfiles/org_tensorflow'
# )
# sys.path.insert(0, tensorflow_path)
import tensorflow as tf

print(tf.__file__)

# # for Pylance intellisense, if run file, remove this line
# import org_tensorflow.tensorflow as tf

# set breakpoint
a = tf.add([1, 2, 3], [-1, -2, -3])
print(a)
