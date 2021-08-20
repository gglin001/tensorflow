#!/bin/bash

# beloe code will rerun `bazel build` and generate
# bazel-tensorflow/compile_command.json
# use it for intellisense

set -e

bazel build \
  --config=noaws \
  --config=nogcp \
  --config=nohdfs \
  --config=nonccl \
  --config=xla \
  --define=enable_mkl=false \
  --strip="never" \
  --spawn_strategy=local \
  --experimental_action_listener=//third_party/tools/generate_compile_commands:extract_json \
  //tensorflow/examples/label_image:label_image

# //tensorflow/examples/adding_an_op:attr_examples
# //tensorflow/core/platform/testdata:test_echo

pushd $(bazel info execution_root) >/dev/null
echo "[" >compile_commands.json
find . -name '*.compile_command.json' -exec bash -c 'cat {} && echo ,' \; >>compile_commands.json
echo "]" >>compile_commands.json
popd >/dev/null
