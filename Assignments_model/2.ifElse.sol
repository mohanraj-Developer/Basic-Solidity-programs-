// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentDetails{
    struct Student { uint id; string name; uint mark;}
    mapping (uint => Student) student;
    
    function addStudent (uint _id, string memory _name, uint _mark) public {
        student[_id] = Student(_id,_name,_mark);
    }
    function Result(uint _id) public view returns(string memory){
        if (student[_id].mark >= 50){
            if (student[_id].mark >=50 && student[_id].mark<=90){
                return "pass";
            }
            else {
                return "Distinction";
            }
        }
        else{
            return "Fail";
        }
    }
}