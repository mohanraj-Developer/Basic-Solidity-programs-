// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserDetails{
    struct User {uint id; string name;}
    mapping (uint => User) public user;

    event UserAdd(uint id, string name);
    function addUser(uint _id, string memory _name) public {
        user[_id] = User(_id,_name);
        emit UserAdd(_id,_name);
    }
    function getUser(uint _id) public view returns (uint,string memory){ 
        User memory s = user[_id];
        return (s.id,s.name);
    }
}