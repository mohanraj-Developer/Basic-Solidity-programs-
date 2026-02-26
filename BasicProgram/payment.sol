/**Real-Time Example: Simple Wallet Contract
Imagine:
A user can deposit money
Check current balance
Calculate bonus without changing blockchain
Calculate interest using pure**/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }
    //1. Modifier for owner only:
    modifier OwnerOnly(){
        require(msg.sender == owner,"Not the contract owner");
        _;
    }

    // 2. Payable Function: ("Allows user to send ETH to contract")
    function deposit() public payable{
        balance += msg.value;
    }

    // 3. View Function: ("Reads blockchain data but does not modify")
    function getBalance() public view returns (uint256){
        return balance;
    }

    // 4. Pure Function: ("Does not read or modify blockchain state")
    function interest(uint _amount, uint _rate) public pure returns(uint256){
        return (_amount * _rate) / 100;
    }

    // 5. OWNER-ONLY WITHDRAW FUNCTION (Using require via modifier)
    function withDraw() public OwnerOnly{
        uint256 amount  = balance;
        require(amount > 0, "No balance to withdraw");
        balance = 0; // Reset before transfer (security practice)
        (bool success, ) = payable(owner).call{value: amount}("");
        require(success, "Transfer failed");
    }

    // 4. 
    function checkOwner() public view returns (bool){
        return msg.sender == owner;
    }
}