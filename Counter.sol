// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
    uint256 public count;

    function inc() external {
        count += 1;
    }

    function decr() external {
        count -= 1;
    }
}
