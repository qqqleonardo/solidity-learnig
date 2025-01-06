// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract B {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) external payable {
        num = 2 *_num;
        sender = msg.sender;
        value = msg.value;
    }
}


contract A {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract,uint256 _num) external payable {
       (bool success,) = _contract.delegatecall(abi.encodeWithSelector(B.setVars.selector, _num));
       require(success, "delegatecall failed");
    }
}
