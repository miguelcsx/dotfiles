#!/bin/bash

# Check if the user has provided the required argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <folder_number>"
  exit 1
fi

# Assign the argument to a variable
FOLDER_NUM=$1

# Commands
commands=(
  # "m . /formatNix"
  "m . /common/test/complexipy"
  "m . /formatPython/default"
  "m . /formatYaml"
  # "m . /lintBash"
  "m . /lintGitCommitMsg"
  # "m . /lintGitMailMap"
  # "m . /lintNix"
  # "m . /lintPython/dirOfModules/skims/benchmark"
  # "m . /lintPython/dirOfModules/skims/cli"
  # "m . /lintPython/dirOfModules/skims/config"
  # "m . /lintPython/dirOfModules/skims/core"
  # "m . /lintPython/dirOfModules/skims/ctx"
  # "m . /lintPython/dirOfModules/skims/custom_exceptions"
  # "m . /lintPython/dirOfModules/skims/custom_parsers"
  # "m . /lintPython/dirOfModules/skims/http_headers"
  # "m . /lintPython/dirOfModules/skims/lib_apk"
  # "m . /lintPython/dirOfModules/skims/lib_cspm"
  # "m . /lintPython/dirOfModules/skims/lib_dast"
  "m . /lintPython/dirOfModules/skims/lib_sast"
  # "m . /lintPython/dirOfModules/skims/lib_sca"
  # "m . /lintPython/dirOfModules/skims/model"
  # "m . /lintPython/dirOfModules/skims/packages_parsers"
  # "m . /lintPython/dirOfModules/skims/s3"
  # "m . /lintPython/dirOfModules/skims/sbom"
  # "m . /lintPython/dirOfModules/skims/schedulers"
  # "m . /lintPython/dirOfModules/skims/semver_match_tools"
  # "m . /lintPython/dirOfModules/skims/serialization"
  # "m . /lintPython/dirOfModules/skims/state"
  "m . /lintPython/dirOfModules/skims/symbolic_eval"
  # "m . /lintPython/dirOfModules/skims/syntax_cfg"
  # "m . /lintPython/dirOfModules/skims/syntax_graph"
  # "m . /lintPython/dirOfModules/skims/test_helpers"
  # "m . /lintPython/dirOfModules/skims/utils"
  # "m . /lintPython/dirOfModules/skims/vulnerabilities"
  # "m . /lintPython/dirOfModules/skims/zone"
  "m . /lintPython/imports/skims"
  "m . /lintPython/module/skimsTest"
  # "m . /lintTerraform/skims"
  # "m . /skims/machine/sca"
  "m . /testPython/skims@$FOLDER_NUM"
  "m . /testPython/skims@unittesting"

)

# Run commands in parallel and log failures
parallel --halt soon,fail=1 --joblog .auxiliar/makes/parallel.log ::: "${commands[@]}"

# Check if any command failed
if [ $? -ne 0 ]; then
  echo "Some commands failed:"
  awk 'NR > 1 && $7 != 0 {for (i=10; i<=NF; i++) printf "%s ", $i; printf "failed with exit code %s\n", $7}' .auxiliar/makes/parallel.log
else
  echo "All commands ran successfully"
fi
