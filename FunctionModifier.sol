// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionModifier {
    bool public paused;
    uint256 public count;

    function setPaused(bool _paused) external {
        paused = _paused;
    }

    //装饰器 用于抽取公共方法
    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    modifier cap(uint256 _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    modifier sandwitch() {
        //code here
        count += 1;
        _;
        count *= 2;
    }

    function incr() external whenNotPaused {
        count += 1;
    }

    function decr() external whenNotPaused {
        count -= 1;
    }

    function incrBy(uint256 _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    function foo() external sandwitch {
        count += 1;
    }
}
