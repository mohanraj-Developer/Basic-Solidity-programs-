// mapping with Store Balance

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceMapping{
    mapping (address => uint) public balance;
    function addBalance(address _user, uint _amount) public {
        balance[_user] += _amount;
    }
    function getBalance(address _user) public view returns(uint){
        return balance[_user];
    }
}

contract Balance{
    mapping (address => uint) public balance;
    function deposit(uint amount) public{
        balance[msg.sender] += amount;
    }
    function checkBalance() public view returns (uint){
        return balance[msg.sender];
    }
}

// mapping Student marks
contract StudentsMarks{
    mapping (address => uint) public marks;
    function setMark(uint _mark) public{
        marks[msg.sender] = _mark;
    }
    function getMark() public view returns(uint){
        return marks[msg.sender];
    }
}