#!/bin/bash

# Installs Dell EMC VEP4600 diagnostics package dependencies.
apt install ipmitool coreboot-utils -y

# Downloads diagnostics package.
curl -O https://raw.githubusercontent.com/quartzsystems/dellemc-edge3400-fan-control/refs/heads/main/dn-diags-vep4600.deb

# Installs the diagnostics package.
dpkg -i dn-diags-vep4600.deb

# Downloads and installs the systemd service.
curl -o /etc/systemd/system/fan-control.service https://raw.githubusercontent.com/quartzsystems/dellemc-edge3400-fan-control/refs/heads/main/fan-control.service
# Downloads the script into /root/.
curl -o /root/fan-control.sh https://raw.githubusercontent.com/quartzsystems/dellemc-edge3400-fan-control/refs/heads/main/fan-control.sh

# Reloads and enables new systemd service.
systemctl daemon-reload
systemctl enable fan-control.service