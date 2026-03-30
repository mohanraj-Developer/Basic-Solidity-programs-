// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract capstonePro{
    address owner;
    constructor (){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,'Only Owner is allowed');
        _;
    }
    enum OrderStatus{Pending, Approved, Rejected}
    struct User{ uint id; string name; address wallet; OrderStatus status;}
    mapping (address => User) user;         // mapping with struct
    mapping (address => bool) exists;       // to prevent dupicates

    // Event 
    event userAdd (address user, uint id, string name);
    event userUpdate (address user, string name);
    event changeStatus (address user, OrderStatus status);
    event sentEther (address user, uint amount);

    // add user function:
    function addUser(uint _id, string memory _name) public {
        if (exists[msg.sender] == true ){
            revert("user already exits");
        }
        else{
            user[msg.sender] = User({id : _id, name : _name, wallet : msg.sender, status : OrderStatus.Pending});
            exists[msg.sender] = true;
            emit userAdd(msg.sender, _id, _name);
        }
    }

    // update user
    function updateUser(string memory _name) public {
        require(exists[msg.sender], "user not found");
        user[msg.sender].name = _name;
        emit userUpdate(msg.sender, _name);
    }

    // approve or reject user
    function updateStatus(address _user, bool _approve) public onlyOwner{
        require(exists[msg.sender],'User not found');
        if (_approve == true){
            user[_user].status = OrderStatus.Approved;
        }
        else{
            user[_user].status = OrderStatus.Rejected;
        }
        emit changeStatus(_user, user[_user].status);
    }

    /* //sent ether
    receive() external payable { }
    function deposit() public payable {}
    function sentEther(address payable _user, uint amount) public onlyOwner{
        require(address(this).balance>amount,'insufficent balance');
        if (user[_user].status == OrderStatus.Approved){
            (bool success,) = _user.call{value:amount}("");
            require(success,"transcation Failed");

            emit sentEther(_user, amount);
        }
        else{
            revert("user not approved");
        }
    } */
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}