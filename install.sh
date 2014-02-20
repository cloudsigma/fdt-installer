#!/bin/bash

# Installation script for Fast Data Transfer (FDT)
# from http://monalisa.cern.ch/FDT/

FDT='/usr/bin/fdt.jar'

# Make sure we're running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

echo -e "Installing Java (OpenJDK)..."
yum install -y -q java-1.7.0-openjdk > /dev/null

echo -e "Fetching Fast Data Transfer (FDT)..."
curl -sl -o $FDT http://monalisa.cern.ch/FDT/lib/fdt.jar

echo -e "Starting FDT..."
java -jar $FDT > /var/log/fdt.log 2>&1 &

echo -e "\nTo start FDT again, please run:\n  $ java -jar $FDT > /var/log/fdt.log 2>&1\n\nTo kill FDT, run:\n  $ pkill -f fdt.jar\n"
echo -e "Make sure to adjust your firewall accordingly."
