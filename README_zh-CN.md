# discv4-dns-lists

<!-- hy-mt2-i18n:start -->
[English](./README.md) | **中文** | [日本語](./README_ja.md) | [Español](./README_es.md)
<!-- hy-mt2-i18n:end -->


该仓库包含由 go-ethereum devp2p 工具生成的 [EIP-1459][EIP-1459] 节点列表。这些列表会发布在 ethdisco.net 的 DNS 名称下。

列表中的节点是通过爬取以太坊节点发现 DHT 找到的。爬取的全部结果都保存在 `all.json` 文件中。我们会根据每个节点提供的 ["eth" ENR 条目值][eth-entry]，对 `all.json` 进行过滤，从而为特定的区块链网络生成列表。

如果您希望自己的节点出现在列表中，只需运行您的客户端，并确保它能够通过节点发现功能被访问到。爬虫会自动检测到它并将其归类到相应的列表中。

[EIP-1459]: https://eips.ethereum.org/EIPS/eip-1459
[eth-entry]: https://github.com/ethereum/devp2p/blob/master/enr-entries/eth.md
