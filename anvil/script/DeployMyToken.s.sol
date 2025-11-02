// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract DeployMyToken is Script {
    function run() public {
        // .envから秘密鍵を読み込む
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // トランザクションのブロードキャストを開始
        vm.startBroadcast(deployerPrivateKey);

        // 秘密鍵からオーナーのアドレスを導出し、コンストラクタに渡す
        address initialOwner = vm.addr(deployerPrivateKey);
        MyToken myToken = new MyToken(initialOwner);

        vm.stopBroadcast();
        console.log("Deployer private key (hex):", vm.toString(bytes32(deployerPrivateKey)));
        console.log("Onwner address:", initialOwner);
        console.log("MyToken deployed to:", address(myToken));
    }
}
