// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken public myToken;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = makeAddr("owner");
        user1 = makeAddr("user1");
        user2 = makeAddr("user2");
        myToken = new MyToken(owner);
    }

    function testGetTokensOfOwner() public {
        vm.startPrank(owner);
        myToken.safeMint(user1); // tokenId 0
        myToken.safeMint(user1); // tokenId 1
        myToken.safeMint(user2); // tokenId 2
        vm.stopPrank();

        uint256[] memory user1Tokens = myToken.getTokensOfOwner(user1);
        assertEq(user1Tokens.length, 2, "User1 should have 2 tokens");
        assertEq(user1Tokens[0], 0, "User1's first token should be 0");
        assertEq(user1Tokens[1], 1, "User1's second token should be 1");

        uint256[] memory user2Tokens = myToken.getTokensOfOwner(user2);
        assertEq(user2Tokens.length, 1, "User2 should have 1 token");
        assertEq(user2Tokens[0], 2, "User2's first token should be 2");

        uint256[] memory ownerTokens = myToken.getTokensOfOwner(owner);
        assertEq(ownerTokens.length, 0, "Owner should have 0 tokens");
    }
}
