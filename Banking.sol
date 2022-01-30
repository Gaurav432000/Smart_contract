// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;
contract banking{
    struct user {
        uint accountBalance;
        bool userexists;
    }
    mapping(address => user) account;

    modifier accountExists{
        require(account[msg.sender].userexists == true, "user do not exist");
        _;
    } 

    function createAcc() public {
        require(account[msg.sender].userexists == false, "user already exist");
        account[msg.sender].userexists = true;
    }
    function deposit() public payable accountExists {
        require(msg.value > 0, "value of deposit can not be zero");
        account[msg.sender].accountBalance += msg.value;    
    }
    function withdraw(uint value) public payable accountExists {
        require(value>0);
        msg.sender.transfer(value);
        account[msg.sender].accountBalance -= value;
    }
    function transferether(address payable receiveraddress,uint amount) public payable accountExists {
        receiveraddress.transfer(amount);
    }
    function userBalance() public view returns(uint) {
        return account[msg.sender].accountBalance;   
    }
    /// In place accountExists function i have created an modifier for same purpose
    /// i have made mapping userexists public instead of seprate function
}