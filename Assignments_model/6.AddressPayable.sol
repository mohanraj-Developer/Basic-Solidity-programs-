// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressPay{
    receive() external payable { }
    
    function deposit() public payable{}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function sentEther(address payable receiver, uint amount) public{
        require(address(this).balance >= amount," Insufficent Amount");
        (bool success,) = receiver.call{value:amount}('');
        require(success,"transfer  fail");

    } 
}