// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Immutable {
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    uint256 public x;

    //immutable 可以节省gas
    //不是immutable 的状态变量消耗 52565 gas
    //是immutable 的状态变量消耗  50109 gas
    function foo() external {
        require(msg.sender == owner, "only owner");
        x += 1;
    }
}
