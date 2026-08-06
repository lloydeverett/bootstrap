#!/bin/bash

set -euo pipefail

sudo snap install microk8s --classic

sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

sudo microk8s status --wait-ready
sudo microk8s kubectl get nodes

echo Please log back in to ensure your user has kubectl access
