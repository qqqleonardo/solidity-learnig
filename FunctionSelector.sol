// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}

contract Receiver {
    event Log(bytes data);

    function transfer(address _to, uint256 _amount) external {
        emit Log(msg.data);
    }
}
