// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArrayReplaceLast {
    uint256[] public arr;

    //[1,2,3,4] -- remove(1) -> [1,3,4]
    //[1,4,3]-- remove(2) -> [1,4]
    function remove(uint256 _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
        //虽然更加简单高效，但是会乱序
    }

    function test() external {
        arr = [1, 2, 3, 4];
        remove(1); //[1,4,3]

        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2); //[1,4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}
