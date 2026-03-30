// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployeeDetails{
    struct Employee{ uint id; string name; uint salary;}
    mapping (uint => Employee) emp;

    // add employee details in struct 
    function addEmp(uint _id, string memory _name, uint _salary) public{
        require(_id !=0, 'Invalid ID');
        emp[_id] = Employee(_id,_name, _salary);
    }

    // update of Employee details:
    function UpdateEmp(uint _id, string memory _name, uint _salary) public{
        require(emp[_id].id != 0," Employee ID not Found");
        emp[_id] = Employee(_id,_name, _salary);
    }

    //Get Function:
    function getEmp(uint _id) public view returns (uint, string memory, uint){
        Employee memory e = emp[_id];
        return (e.id,e.name, e.salary);
    }
}