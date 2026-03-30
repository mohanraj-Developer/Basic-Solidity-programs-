// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PremiumMember{
    address owner;
    constructor (){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,' only Owner allowed');
        _;
    }
    struct Member{ uint id; string name; address payable wallet; bool isActive;}
    mapping (uint => Member) member;
    mapping (address => bool) exists;
    uint public membercount;

    event memberAdd(uint id, string name, address wallet);
    event paymentReceived (address from, uint amount);
    event statusUpdate( uint id, bool status);

    function addMember( uint _id, string memory _name) public{
        require(!exists[msg.sender],'not exits');
        membercount ++;
        member[membercount] = Member({id : _id, name : _name, wallet : payable(msg.sender), isActive: true});
        emit memberAdd(membercount,_name, msg.sender);
    }
    function payFee(uint _id) public payable {
        require(member[_id].isActive,'Inactive member');
        if(msg.value >=1 ether){
            member[_id].wallet.transfer(msg.value);
            emit paymentReceived(msg.sender, msg.value);
        }
        else{
            revert("minimum 1 eth required");
        }
    }
    function uodateStatus(uint _id, bool _status) public onlyOwner{
        member[_id].isActive = _status;
        emit statusUpdate(_id, _status);
    }
}

/* 
function addMember(uint _id, string memory _name) public {
    require(!exists[msg.sender], "Member already exists");

    membercount++;

    member[membercount] = Member({
        id: _id,
        name: _name,
        wallet: payable(msg.sender),
        isActive: true
    });

    exists[msg.sender] = true;

    emit memberAdd(membercount, _name, msg.sender);
}

function payFee(uint _id) public payable {
    require(_id > 0 && _id <= membercount, "Invalid member ID");
    require(member[_id].isActive, "Inactive member");
    require(member[_id].wallet == msg.sender, "Not your membership");
    require(msg.value >= 1 ether, "Minimum 1 ETH required");

    emit paymentReceived(msg.sender, msg.value);
}

function updateStatus(uint _id, bool _status) public onlyOwner {
    require(_id > 0 && _id <= membercount, "Invalid ID");

    member[_id].isActive = _status;
    emit statusUpdate(_id, _status);
} */