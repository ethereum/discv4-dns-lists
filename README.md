# discv4-dns-lists

This repository contains [EIP-1459][EIP-1459] node lists for the Ethereum discovery
network. These lists are published to the ethdisco.net DNS name.

We build the lists by crawling the Ethereum node discovery DHT. We create lists for
specific blockchain networks by filtering the crawl output according to the
["eth" ENR entry value][eth-entry] provided by each node.

If you want your node in the list, simply run your client and make sure it is reachable
through discovery. The crawler will pick it up and sort it into the right list
automatically.

[EIP-1459]: https://eips.ethereum.org/EIPS/eip-1459
[eth-entry]: https://github.com/ethereum/devp2p/blob/master/enr-entries/eth.md
