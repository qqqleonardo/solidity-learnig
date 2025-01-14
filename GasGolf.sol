// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//一些节省gas的方法                    58391 gas
//use calldata 使用calldata           56401 gas
//load state variable to memory  加载状态变量到内存  56160 gas
//short circuit 短路                   55808 gas
//loop increments 循环增量              54573 gas
//cache array length 缓存数组长度  deprecated
//load array elements to memory 加载数组元素到内存  54379 gas
contract GasGolf {
    uint256 public total;

    function sumIfEvenAndLessThan99(uint256[] calldata nums) external {
        uint256 _total = total;
        for (uint256 i; i < nums.length; ++i) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }
}
