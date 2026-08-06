#!/bin/bash

set -euo pipefail

sudo snap install microk8s --classic

sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube

newgrp microk8s

microk8s status --wait-ready
microk8s kubectl get nodes
microk8s enable dns storage
