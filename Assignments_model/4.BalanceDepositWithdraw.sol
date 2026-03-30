// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccBalance{
    address Owner;
    constructor(){
        Owner = msg.sender;
        
    }
    modifier onlyOwner{
        require(msg.sender == Owner);
        _;
    }
    mapping (address => uint) balance;
        
    // Deposit function
    function Deposit() public payable  {
        require(msg.value >0);
        balance[msg.sender] += msg.value;
    }
    // withdraw function:
    function withdraw(uint amount) public onlyOwner{
        require(balance[msg.sender] >= amount," Insufficient amount");
        balance[msg.sender] -= amount;
        (bool success,) = payable (msg.sender).call{value:amount}("");
        require(success, " Tanscation failed");
    }
    // Check Balance
    function CheckBalance() public view returns(uint){
        return address(this).balance;
    }    
}