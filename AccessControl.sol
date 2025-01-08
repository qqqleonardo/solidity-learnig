// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract AccessControl {
    //role =>account=>bool
    mapping(bytes32 => mapping(address => bool)) public roles;

    bytes32 private  constant ADMIN = keccak256("ADMIN");//0xdf8b4c520ffe197c5343c6f5aec59570151ef9a492f2c624fd45ddde6135ec42
    bytes32 private constant USER = keccak256("USER");//0x2db9fd3d099848027c2383d0a083396f6c41510d7acfd92adc99b6cffcf31e96

    event GrantRole(bytes32 indexed role, address indexed account);
    event RevokeRole(bytes32 indexed role, address indexed account);

    //构造器初始化就给合约指定了ADMIN角色
    constructor() {
        _grantRoles(ADMIN, msg.sender);
    }

    //装饰器 需要指定某个角色

    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorized");
        _;
    }

    function _grantRoles(bytes32 _role, address _adrress) internal {
        roles[_role][_adrress] = true;
    }

    //通过装饰器指定ADMIN角色可以调用
    function grantRoles(bytes32 _role, address _adrress)
        external
        onlyRole(ADMIN)
    {
        _grantRoles(_role, _adrress);
        emit GrantRole(_role, _adrress);
    }

    function revokeRoles(bytes32 _role, address _adrress)
        external
        onlyRole(ADMIN)
    {
       roles[_role][_adrress] = false;
        emit RevokeRole(_role, _adrress);
    }
}
