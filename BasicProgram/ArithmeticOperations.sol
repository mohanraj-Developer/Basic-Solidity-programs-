// Arithmetic operations

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArithmeticOperation{
    function Add( uint a, uint b) public pure returns (uint){
        return a+b;
    }

    function Subtract(uint a, uint b) public pure returns (uint){
        return a-b;
    }
    function Multiply(uint a, uint b) public pure returns (uint){
        return a*b;
    }
    function Divide(uint a, uint b) public pure returns (uint){
        require(b!=0,"can't divide by Zero");
        return a/b;
    }
}