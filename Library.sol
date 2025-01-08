// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Math {
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint256 _x, uint256 _y) external pure returns (uint256) {
        return Math.max(_x, _y);
    }
}

library ArrLib {
    function find(uint256[] storage arr, uint256 x)
        internal
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not find");
    }
}

contract TestArray {
    using ArrLib for uint256[]; //申明ArrLib用于增强uint256[]
    uint256[] public arr = [3, 2, 1];

    function testFind() external view returns (uint256 i) {
        // ArrLib.find(arr,2);
        return arr.find(2);
    }
}
