// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Token {
           // BP20 Token
    string public name = "Pair Token";
    string public symbol = "OJO";
    uint8 public decimals = 18;

    
    uint256 public totalSupply = 10000 * 10 ** uint256(decimals); // 10,000 OJO tokens with 18 decimal places

    
    mapping(address => uint256) public balances; // Records the token balance of every address

    // Records how much a spender is allowed to spend
    // Example:
    // allowance[owner][spender] = amount
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // Runs once when the contract is deployed.
    // The entire initial supply is assigned to the deployer.
    constructor() {
        balances[msg.sender] = totalSupply;

        emit Transfer(address(0), msg.sender, totalSupply);
    }

    
    function balanceOf(address owner) public view returns (uint256) { // Returns the token balance of an address.
        return balances[owner];
    }

   
    function transfer( // Transfers tokens from the caller to another address.
        address to,
        uint256 value
    ) public returns (bool) {
        require(to != address(0), "Invalid recipient");
        require(
            balances[msg.sender] >= value,
            "Insufficient balance"
        );

        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);

        return true;
    }

    // Allows another address to spend tokens on behalf of the caller.
    function approve(
        address spender,
        uint256 value
    ) public returns (bool) {
        require(spender != address(0), "Invalid spender");

        allowance[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);

        return true;
    }

    // Transfers tokens from one address using an approved allowance.
    //
    // Example:
    // Alice approves Bob to spend 100 OJO.
    // Bob calls transferFrom(Alice, Charlie, 50).
    // Alice loses 50.
    // Charlie receives 50.
    // Bob's remaining allowance becomes 50.
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(from != address(0), "Invalid sender");
        require(to != address(0), "Invalid recipient");

        require(
            balances[from] >= value,
            "Insufficient balance"
        );

        require(
            allowance[from][msg.sender] >= value,
            "Insufficient allowance"
        );

        balances[from] -= value;
        balances[to] += value;

        allowance[from][msg.sender] -= value;

        emit Transfer(from, to, value);

        return true;
    }
}
