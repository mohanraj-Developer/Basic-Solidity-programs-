// Simple counter 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract counter{
    uint public count;
    function setcount(uint value) public{
        count = value;
    }
    function increment() public{
        count +=1;
    }
    function decrement() public{
        require(count>0,"counter: cannot decrement value below zero");
        count -=1;
    }
}