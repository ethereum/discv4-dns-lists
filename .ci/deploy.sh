#!/bin/bash

set -e

proto_groups=(all les)

for network in "$@"; do

    echo "Deploy: $network"

    for p in "${proto_groups[@]}"; do
        echo -n "Deploy: ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"

        # Ensure that we actually have a nodeset to deploy to DNS.
        [[ ! -d ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN} ]] || [[ ! -f ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}/nodes.json ]] && { echo " | DNE, skipping"; continue; }

        echo
        devp2p dns to-cloudflare --zoneid "$ETH_DNS_CLOUDFLARE_ZONEID" "${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"
    done
done
