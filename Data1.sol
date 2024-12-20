// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract ValueTypes{
     bool public b = true;
     uint public u = 123;//uint 是uint256的缩写，无符号，范围是0- 2^256-1
                         //还有uint8 同上,范围是0- 2^8-1

     int public i = -123;//有符号 范围是 -2^256 - 2^256-1
    //获取int最大最小值的内置函数
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    
    // address public addr = 0x5B38dksahdg012389dah9;

    // bytes32 public b32 = 0x5B38dksahdg012389d6k43j2l4x23;
}
