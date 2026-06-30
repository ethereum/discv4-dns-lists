#!/bin/sh

set -e

# Check programs we depend on.
command -v devp2p >/dev/null 2>&1 && echo "OK: devp2p command in PATH" || { echo "Please install devp2p"; exit 1; }
command -v ethkey >/dev/null 2>&1 && echo "OK: ethkey command in PATH" || { echo "Please install ethkey"; exit 1; }

# Check that we have key and keypass file.
if [ ! -f $ETH_DNS_DISCV4_KEY_PATH ] || [ ! -f $ETH_DNS_DISCV4_KEYPASS_PATH ]; then
    echo "
No key found at key file path or no password file found at ${ETH_DNS_DISCV4_KEYPASS_PATH}. 
Use 'ethkey generate ${ETH_DNS_DISCV4_KEY_PATH}'
Save the password in plaintext in ${ETH_DNS_DISCV4_KEYPASS_PATH}
"
    exit 1
else
    echo "OK: Key and password file exist."
fi

# Check that we have deploy variables set.
if [ -z $CLOUDFLARE_API_TOKEN ]; then
    echo "Missing CLOUDFLARE_API_TOKEN env var"
    exit 1
else
    echo "OK: environment variable CLOUDFLARE_API_TOKEN is not empty."
fi

# I'm not sure why I couldn't get devp2p to work without using the --zoneid flag; kept getting 403 bad perms.
# Using the flag seems to fix it, and this var gets set as the value for that flag.
# It's associated with the specific domain name that Cloudflare is managing and that we want to deploy to.
if [ -z $ETH_DNS_CLOUDFLARE_ZONEID ]; then
    echo "Missing ETH_DNS_CLOUDFLARE_ZONEID env var"
    exit 1
else
    echo "OK: environment variable ETH_DNS_CLOUDFLARE_ZONEID is not empty."
fi

