// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;
contract banking{
    mapping(address => uint) accountBalance;
    mapping(address => bool) public userexists;

    modifier accountExists{
        require(userexists[msg.sender] == true, "user do not exist");
        _;
    } 

    function createAcc() public {
        require(userexists[msg.sender] == false, "user already exist");
        userexists[msg.sender] = true;
    }
    function deposit() public payable accountExists {
        require(msg.value > 0, "value of deposit can not be zero");    
    }
    function withdraw() public payable accountExists {
        require(msg.value>0);
        require(msg.value<address(this).balance);
        msg.sender.transfer(msg.value);
    }
    function transferether(address payable receiveraddress,uint amount) public payable accountExists {
        receiveraddress.transfer(amount);
    }
    function userBalance() public view returns(uint) {
        return address(this).balance;   
    }
    /// In place accountExists function i have created an modifier for same purpose
    /// i have made mapping userexists public instead of seprate function
}