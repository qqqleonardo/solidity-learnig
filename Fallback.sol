// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Fallback {
    event Log(string func, address owner, uint256 value, bytes data);
    //当用户调用一个不存在的函数时会触发
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}
