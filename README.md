# Quick Start

## contract

1. ```anvil``を実行
1. 表示されたPrivate Keysから先頭で{root}/contract/.envと{root}/vue/.env.localを更新する
1. ```forge build```を実行
1. ```forge test -vv```を実行
1. ```forge script script/Deployment.s.sol --rpc-url http://127.0.0.1:8545 --broadcast```でデプロイする
1. ```deployed address: ***```で表示されるアドレスをコントラクトアドレスにする

## vue

1. ```npm install```を実行
1. コントラクトアドレスを{root}/vue/.env.localに設定する
1. ```npm run serve```を実行

## metamask

1. 表示されたPrivate Keysから2番目の秘密鍵でmetamaskのimported accountを作成する（「ウォレットを追加」で「アカウントのインポート」）
2. incrementボタンをクリックしてcontract accountに接続する
3. ネットワークをanvil, アカウントをimported accountにする
