// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariables {
    uint256 public myUint = 123; //状态变量 是会存储在区块链上的变量

    function foo() external {
         //方法内部 局部变量 只在函数执行时生效
        uint256 notStateVarile = 456;
    }
}