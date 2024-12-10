#!/bin/bash
set -e

echo "Restarting application server..."
sudo systemctl restart nginx
