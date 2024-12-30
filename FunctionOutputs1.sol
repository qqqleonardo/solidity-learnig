// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionOutputs {
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    function named() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint256 x, bool b) {
        // return (1, true);
        x = 1;
        b = true;
    }

    function destructingAssignments() public pure {
        (uint256 u, bool b) = returnMany();
        (, bool _b) = returnMany();//可以省略第一个参数赋值
    }
}
