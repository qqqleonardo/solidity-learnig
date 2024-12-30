// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    //非定长数组
    uint256[] nums = [1, 2, 3];
    //定长数组
    uint256[3] fixednums = [4, 5, 6];

    function examples() external {
        //nums添加元素 4
        nums.push(4); // [1,2,3,4]
        //获取num的第二个元素
        uint256 x = nums[1];
        //修改num的第二个元素为777
        nums[1] = 777; //[1,777,3,4]
        //删除nums第二个元素
        delete nums[1]; //注意 [1,0,3,4]
        //弹出nums最后一个元素
        nums.pop(); //[1,0,3]
        //获取nums的长度
        uint256 len = nums.length; //输出应该为3

        //create an array in memory
        uint256[] memory a = new uint256[](5);//内存中的数组不能是动态的，所以push和pop方法不可用
        a[1] = 123;
    }


    // 返回值memory修饰 表示返回值会先存到内存中再返回 -----并不建议返回数组
    function returnArray()external view returns (uint[] memory){
        return nums;
    }
} 
