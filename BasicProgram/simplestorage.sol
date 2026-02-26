
// Simple Storage - using "Uint"

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint public number;
    function setNumber( uint _num) public{
        number = _num;
    }
    function getNumber() public view returns (uint) {
        return number;
    }
}