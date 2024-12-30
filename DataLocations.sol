// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example(uint256[] calldata y, string calldata s)
        external
        returns (uint256[] memory)
    {
        myStructs[msg.sender] = MyStruct(123, "bar");
        MyStruct storage myStruct = myStructs[msg.sender]; //storage 会将修改后的值保存到状态变量中而不只是函数内部
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender]; //memory 修改后的值只存在于函数内部
        myStruct.foo = 456;

        //总结：如果只读的话就用memory,要修改的话用storage

        _internal(y);

        // return readOnly;
        uint256[] memory memoryArr = new uint256[](3);
        memoryArr[0] = 234;
        return memoryArr;
    }

    function _internal(uint256[] calldata y) private {
        uint256 x = y[0];
    }
}
