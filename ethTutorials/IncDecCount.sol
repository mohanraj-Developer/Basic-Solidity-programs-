// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Count{
    int public count;
    function getCount() public view returns(int){
        return count;
    }

    /** // 1. increase the number:
    function inc() public {
        count += 1;
    }
    // decrease the number:
    function dec() public{
        count -= 1;
    }**/

    /** // 2. inc and dec using loop function:
    function incLoop(uint times) public{
        for (uint i = 0; i < times; i++){
            count += 1;
        }
    }
    function decLoop(uint times) public {
        for (uint i = 0; i < times; i++){
            count -= 1;
        }
    }**/

    // 3. inc and dec using While Function:
    function incWhile(uint time) public{
        uint i = 0;
        while (i<time){
            count +=1; i++;
        }
    }
    function decWhile(uint time) public{
        uint i = 0;
        while (i<time){
            count -=1; i++;
        }
    }

}