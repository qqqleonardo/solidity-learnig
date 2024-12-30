// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function example() external {
        Car memory toyota = Car("toyota", 1990, msg.sender); //直接按照属性顺序赋值
        Car memory lambo = Car({
            year: 1980,
            model: "lamborghini",
            owner: msg.sender
        }); //键值对 方式赋值

        Car memory tesla; //对象赋值方式
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        cars.push(Car("Ferrari", 2020, msg.sender));

        //读取状态变量
        Car memory _car = cars[0];
        _car.model;
        _car.year;
        _car.owner;

        //修改状态变量 storage会将修改完的值保存在区块链上 memory则只存在于内存中
        Car storage __car = cars[0];
        __car.year = 1999;
        delete __car.owner; //address(0)

        delete cars[1];
    }
}
