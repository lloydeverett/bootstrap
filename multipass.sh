#!/bin/bash

INSTANCE=primary

set -euo pipefail

multipass stop "$INSTANCE"
multipass set "local.$INSTANCE.disk=32G"
multipass set "local.$INSTANCE.cpus=10"
multipass set "local.$INSTANCE.memory=6G"
multipass start "$INSTANCE"
