// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IERC20 {
    function totalSupply() external view returns (uint256); //ERC20的总供应量

    function balanceOf(address account) external view returns (uint256); //查询某一个地址他的余额

    function transfer(address receipient, uint256 amount)
        external
        returns (bool); //token转给某一个接收方地址

    function allowance(address owner, address spender)
        external
        view
        returns (uint256); //允许一个消费者来花费你的token

    function approve(address spender, uint256 amount) external returns (bool); //允许spender花费你的多少钱

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool); //在有allowance的情况下把sender的token转给接收方
}

contract ERC20 is IERC20 {
    uint256 public totalSupply; //总供应数量
    mapping(address => uint256) public balanceOf; //账户余额
    mapping(address => mapping(address => uint256)) public allowance;
    string public name = "Test";
    string public symbol = "Test";
    uint8 public decimals = 18;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    function transfer(address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);

        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
