// simple Event 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Event{
    event Deposit(address user, uint amount);
    function deposit() public payable{
        emit Deposit(msg.sender, msg.value);
    }
}

// Owner Restiction 

contract Owner{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "Not thw Owner");
        _;
    }
    function changeOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }
}