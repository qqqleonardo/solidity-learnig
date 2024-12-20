// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {
    //view 会读取区块链上的数据 而pure不会读取任何数据
    uint256 public number;

    function viewFunc() external view returns (uint256) {
        return number;
    }

    function pureFunc() external pure returns (uint256) {
        return 1;
    }

    function addToNumber(uint256 x) external view returns (uint256) {
        return x + number;
    }

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }
}
