// Number is even 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OddEven{
    function isEven(uint num) public pure returns(bool){
        return num % 2 == 0;
    }
}

// find odd or even using if Condition 
contract OddEvenIfCondition {
    function check(uint num) public pure returns(string memory) {
        if (num % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }
}