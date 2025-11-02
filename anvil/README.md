# web3_practice_contract
東大ブロックチェーン講座練習用コントラクト

https://drive.google.com/file/d/1AegFGk6dzqmP32SOJG8soE_8Wx6fsWTb/view
https://github.com/foundry-rs/foundry

Foundryプロジェクト初期化
```
$ forge init --force --vscode

### ソースをビルドする

$ forge build

### コントラクトをテストする

$ forge test -vv
```

###　依存関係を確かめる

$ forge dependency-check
$ forge tree


ローカルにプロジェクトをデプロイする
```
$ anvil

# またはニーモニックを指定する
# $ anvil -m "test test test test test test test test test test test junk"


### anvilが起動する

# https://github.com/blockchaininnovation/practice_contract/blob/c57f8364bde3b8def1bfaf0e94a0b6381a49c3e6/script/Deployment.s.solをコピー
$ forge script script/Deployment.s.sol --rpc-url http://127.0.0.1:8545 --broadcast

### == Logs ==
###  deployed address: 0x***

### このようなログが出てこれがコントラクトアドレスになる。.envでこのアドレスを置き換える。


# https://github.com/blockchaininnovation/practice_contract/blob/c57f8364bde3b8def1bfaf0e94a0b6381a49c3e6/script/Counter.s.solをコピー
$ forge script script/Counter.s.sol --rpc-url http://127.0.0.1:8545 --broadcast

### == Logs ==
###  Current number: 6
### 上のように出れば成功

cast call {デプロイした後のコントラクトアドレス} "number()" --rpc-url http://localhost:8545

```

## ERC-721

https://wizard.openzeppelin.com/#erc721  
まずはこれで定義して雛形を作る。

https://docs.openzeppelin.com/contracts/5.x

```
$ forge install openzeppelin/openzeppelin-contracts

$ anvil

$ forge script script/DeployMyToken.s.sol:DeployMyToken --rpc-url http://localhost:8545 --broadcast

# NFTを発行する
$ cast send {コントラクトアドレス} "safeMint(address)" {EOA、anvilを実行したしたときの2つ目のアドレスなど} --private-key {デプロイスクリプトで指定した秘密鍵} --rpc-url http://localhost:8545

# 何個のNFTを指定したアドレスが所有しているか確認する
$ cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "balanceOf(address)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 --rpc-url http://localhost:8545

$ cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "tokenOfOwnerByIndex(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 0 --rpc-url http://localhost:8545

```
