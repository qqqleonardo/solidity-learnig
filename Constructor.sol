// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constructor {
    address public owner;
    uint256 public x;

    //构造器函数只会在部署合约的时候调用一次
    constructor(uint256 _x) {
        owner = msg.sender;
        x = _x;
    }
}
