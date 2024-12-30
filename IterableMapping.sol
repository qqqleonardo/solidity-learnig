// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IterableMapping {
    //状态变量
    mapping(address => uint256) public balances;
    mapping(address => bool) public inserted;
    address[] keys;

    function set(address _key, uint256 _value) external {
        balances[_key] = _value;
        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function first() external view returns (uint256) {
        return balances[keys[0]];
    }

    function last() external view returns (uint256) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint256 _i) external view returns (uint256) {
        return balances[keys[_i]];
    }
}
