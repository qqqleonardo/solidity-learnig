// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Caller {
    function setX(TestContract _test, uint256 _x) external {
        _test.setX(_x);
    }

    function getX(TestContract _test) external view returns (uint256) {
        uint256 x = _test.getX();
        return x;
    }

    function setXandSendEther(TestContract _test, uint256 _x) external payable {
        _test.setXandSendEther{value: msg.value}(_x);
    }

    function getXandValue(TestContract _test)
        external
        view
        returns (uint256 x, uint256 value)
    {
        (x, value) = _test.getXandValue();
    }
}

contract TestContract {
    uint256 public x;
    uint256 public value = 123;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function getX() public view returns (uint256) {
        return x;
    }

    function setXandSendEther(uint256 _x)
        public
        payable
        returns (uint256, uint256)
    {
        x = _x;
        value = msg.value;
        return (x, value);
    }

    function getXandValue() public view returns (uint256, uint256) {
        return (x, value);
    }
}
