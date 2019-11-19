#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# Get all packages for core, mobile and web
(cd core && pub get)
(cd web && pub get)
(cd mobile && flutter packages get)