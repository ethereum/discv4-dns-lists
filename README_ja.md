# discv4-dns-lists

<!-- hy-mt2-i18n:start -->
[English](./README.md) | [中文](./README_zh-CN.md) | **日本語** | [Español](./README_es.md)
<!-- hy-mt2-i18n:end -->


このリポジトリには、go-ethereumのdevp2pツールを使って作成された[EIP-1459][EIP-1459]ノードリストが含まれています。これらのリストはethdisco.netのDNS名で公開されています。

リストに記載されているノードは、Ethereumノード検出用のDHTをクローリングすることで見つけ出されます。クローリングの全結果は`all.json`ファイルに保存されています。各ノードが提供する["eth" ENRエントリ値][eth-entry]に基づいて`all.json`をフィルタリングすることで、特定のブロックチェーンネットワーク向けのリストを作成しています。

自分のノードをリストに加えたい場合は、クライアントを実行し、検出機能を通じてアクセス可能であることを確認してください。クローラーがそれを自動的に検出し、適切なリストに分類します。

[EIP-1459]: https://eips.ethereum.org/EIPS/eip-1459
[eth-entry]: https://github.com/ethereum/devp2p/blob/master/enr-entries/eth.md
