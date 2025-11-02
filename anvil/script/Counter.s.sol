// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        // .env ファイルから秘密鍵を読み込む
        // uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // 環境変数からコントラクトアドレスを文字列として取得し、アドレス型に変換
        string memory contractAddress = vm.envString("CONTRACT_ADDRESS");
        address counterAddress = vm.parseAddress(contractAddress);

        // コントラクトインスタンスを取得
        Counter counter = Counter(counterAddress);
        
        // トランザクションのブロードキャストを開始
        // vm.startBroadcast(deployerPrivateKey);

        // setNumber 関数を呼び出して値を設定
        counter.setNumber(0);

        // increment 関数を呼び出して値をインクリメントとデクリメント
        counter.increment();
        counter.decrement();

        // トランザクションのブロードキャストを終了
        // vm.stopBroadcast();

        // 現在の number の値を取得
        uint256 currentNumber = counter.number();
        console.log("Current number:", currentNumber);
    }
}