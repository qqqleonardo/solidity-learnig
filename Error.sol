// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint256 _i) public pure {
        //revert 一般用于嵌套if-else语句
        if (_i > 1) {
            //code
            if (_i > 2) {
                //more code
                if (_i > 10) {
                    revert("i > 10");
                }
            }
        }
    }

    uint256 public num = 123;

    function testAssert() public view {
        assert(num == 123);
    }

    function foo(uint256 _i) public {
        //accidenteally update num
        //假如 _i输入13 require会抛出错误，那么状态变量num回到原值123
        num += 1;
        require(_i < 10);
    }

    error MyError(address caller, uint256 i); //自定义错误

    function testCustomError(uint256 _i) public view {
        // require(_i <= 10, "very long error msg long long long !!!");
        if (_i > 10) {
            revert MyError(msg.sender, _i); //自定义错误需要配合revert使用
        }
    }
}
