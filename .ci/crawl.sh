#!/bin/sh

devp2p discv4 crawl -timeout "$ETH_DNS_DISCV4_CRAWLTIME" all.json

git add all.json	

ETH_DNS_DISCV4_KEY_PUBLICINFO="$(cat $ETH_DNS_DISCV4_KEYPASS_PATH | ethkey inspect $ETH_DNS_DISCV4_KEY_PATH | grep -E '(Addr|Pub)')"
git -c user.name="meows" -c user.email='b5c6@protonmail.com' commit --author 'crawler <>' -m "ci update (all.json) $GITHUB_RUN_ID:$GITHUB_RUN_NUMBER
        
Crawltime: $ETH_DNS_DISCV4_CRAWLTIME

$ETH_DNS_DISCV4_KEY_PUBLICINFO"