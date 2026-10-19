#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install Cachy kernel
dnf5 -y copr enable bieszczaders/kernel-cachyos
sudo dnf copr enable bieszczaders/kernel-cachyos-addons

dnf5 -y install kernel-cachyos kernel-cachyos-devel-matched scx-scheds scx-tools

# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable bieszczaders/kernel-cachyos
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons