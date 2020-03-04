#!/bin/bash

set -e

proto_groups=(all les)

for network in "$@"; do

    echo "Filter: $network"
   
    mkdir -p "all.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"
    devp2p nodeset filter all.json -eth-network "$network" >"all.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}/nodes.json"

    mkdir -p "les.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"
    devp2p nodeset filter all.json -les-server -eth-network "$network" >"les.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}/nodes.json"

    
    echo "Sign: $network"

    for p in "${proto_groups[@]}"; do
        echo -n "Sign: ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"

        # Ensure that we actually have a nodeset to sign.
        [ ! -d ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN} ] || [ ! -f ${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}/nodes.json ] && { echo " | DNE, skipping"; continue; }

        echo
        cat "${ETH_DNS_DISCV4_KEYPASS_PATH}" | devp2p dns sign "${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}" "${ETH_DNS_DISCV4_KEY_PATH}" && echo "OK"

        git add "${p}.${network}.${ETH_DNS_DISCV4_PARENT_DOMAIN}"
    done

    ETH_DNS_DISCV4_KEY_PUBLICINFO="$(cat $ETH_DNS_DISCV4_KEYPASS_PATH | ethkey inspect $ETH_DNS_DISCV4_KEY_PATH | grep -E '(Addr|Pub)')"
    git -c user.name="meows" -c user.email='b5c6@protonmail.com' commit --author "crawler <>" -m "ci update ($network) $GITHUB_RUN_ID:$GITHUB_RUN_NUMBER
        
Crawltime: $ETH_DNS_DISCV4_CRAWLTIME

$ETH_DNS_DISCV4_KEY_PUBLICINFO"
    
done