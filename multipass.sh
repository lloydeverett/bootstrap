#!/bin/bash

INSTANCE=primary

set -euo pipefail

echo "-- launch instance --"
echo multipass launch lts --name "$INSTANCE" --memory 6G --disk 32G --cpus 10

echo "-- modify instance --"
echo multipass stop "$INSTANCE"
echo multipass set "local.$INSTANCE.disk=32G"
echo multipass set "local.$INSTANCE.cpus=10"
echo multipass set "local.$INSTANCE.memory=6G"
echo multipass start "$INSTANCE"
