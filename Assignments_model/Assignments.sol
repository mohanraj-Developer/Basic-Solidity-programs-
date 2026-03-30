// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Event + Struct + Mapping
contract EventEmit{
    struct user{ uint id; string name;}
    mapping (uint => user) u1;

    event UserDetails(uint id, string name);
    function addUser(uint _id, string memory _name) public{
        u1[_id] = user(_id, _name);
        emit UserDetails(_id, _name);
    }
    function getDetails(uint _id) public view returns(uint, string memory){
        user memory s = u1[_id];
        return (s.id, s.name);
    } 
}

//  If-Else + Struct + Mapping
contract StudentMarks{
    struct student{ uint id; string name; uint mark;}
    mapping (uint => student) S1;
    function getMarks(uint _id, string memory _name, uint _mark) public {
        S1[_id] = student(_id, _name, _mark);
    }
    function Result(uint _id) public view returns (string memory){
       if (S1[_id].mark>=50){
            if(S1[_id].mark>=50 && S1[_id].mark<=90){
                return "Pass";
            }
            else{
                return "Distinction";
            }
       }
       else{
        return "Fail";
       }
    }
}

//Struct + Mapping (CRUD)
contract CRUD{
    struct employee{ uint id; string name; uint salary;}
    mapping (uint => employee) emp1;
    function addDetails(uint _id, string memory _name, uint _salary) public {
        emp1[_id] = employee(_id, _name, _salary);
    }
    function update(uint _id, string memory _name, uint _salary) public{
        require(emp1[_id].id != 0,'Invalid ID');
        emp1[_id] = employee(_id,_name, _salary);
    } 
    function getDetails(uint _id) public view returns(uint, string memory, uint){
        employee memory s = emp1[_id];
        return (s.id, s.name, s.salary);
    }
}
//Mapping with Address
contract mappingBal{
    address Owner;
    constructor() {
        Owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == Owner,'Only Owner Allowed');
        _;
    }
    mapping (address => uint) public balance;
    function deposit() public  payable {
        require(msg.value !=0);
        balance[msg.sender] += msg.value;
    }
    function withDraw(uint amount) public onlyOwner{
        require(balance[msg.sender] > 0, "Invalid amount");
        balance[msg.sender] -= amount;
        (bool success,) = payable (msg.sender).call{value:amount}("");
        require(success,"Transcation Failed");
    }
    function checkBal() public view returns (uint){
        return address(this).balance;
    }
}

//Address Concept
contract AddressCon{
    address public lastCaller;
    function caller() public{
        lastCaller = msg.sender;
    }
    function getCaller() public view returns(address){
        return msg.sender;
    }
}

// Address payable
contract AddressPay{
    receive() external payable { }
    function deposit() public payable {}
    function balance() public view returns (uint){
        return address(this).balance;
    }
    function sentEth(address payable r1, uint amount) public{
        require(address(this).balance >= amount,"Insufficent amount");
        (bool success,) = r1.call{value:amount} ("");
        require(success);
    }
}