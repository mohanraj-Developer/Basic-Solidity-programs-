// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CallerAddress{
    address public LastCaller;
    function Caller() public {
        LastCaller = msg.sender;
    }
    function getCaller() public view returns(address){
        return msg.sender;
    }
}