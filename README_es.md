# discv4-dns-lists

<!-- hy-mt2-i18n:start -->
[English](./README.md) | [中文](./README_zh-CN.md) | [日本語](./README_ja.md) | **Español**
<!-- hy-mt2-i18n:end -->


Este repositorio contiene listas de nodos [EIP-1459][EIP-1459] generadas por la herramienta devp2p de go-ethereum. Estas listas se publican bajo el nombre DNS ethdisco.net.

Los nodos que aparecen en las listas se identifican mediante el rastreo del DHT de descubrimiento de nodos de Ethereum. Todo el resultado del rastreo está disponible en el archivo `all.json`. Creamos listas para redes blockchain específicas filtrando `all.json` según el valor de la entrada ENR ["eth"] [eth-entry] proporcionado por cada nodo.

Si desea que su nodo aparezca en la lista, basta con ejecutar su cliente y asegurarse de que sea accesible a través del sistema de descubrimiento. El rastreador lo detectará automáticamente y lo clasificará en la lista correspondiente.

[EIP-1459]: https://eips.ethereum.org/EIPS/eip-1459
[eth-entry]: https://github.com/ethereum/devp2p/blob/master/enr-entries/eth.md
