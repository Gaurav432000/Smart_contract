// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract marketplace {
    bool isseller;
    address[] public sellers;
    
    struct item 
    {
        string name;
        uint id;
        uint cost;
        uint time;
    }

    uint itemno;
    constructor(){
        sellers.push(msg.sender);
        itemno =1;
    }

    function addsellers(address _s) public 
    {
        require(checkseller(), "You are not seller");
        sellers.push(_s);
    }

    mapping(uint => item) public selling;
    mapping(address => uint[]) itemsbought;

    uint[] public itemId;
    
    function checkseller() public view returns(bool)
    {
         for(uint i=0; i<sellers.length; i++)
        {
            if(msg.sender == sellers[i])
            {
                return true;
            }
        }
        return false;
    }

    function checkitem(uint _id) public view returns(bool){

     for(uint i=0; i<itemId.length; i++)
        {  if(_id == itemId[i])
            {
                return true;
            }
        }
        return false;
    }

    function listitem(string memory _name,uint _id, uint _cost) public 
    {
            require(checkseller(), "only seller can list items");
            selling[_id].name = _name;
            selling[_id].id = _id;
            selling[_id].cost = _cost;
            selling[_id].time = block.timestamp;
            itemId.push(_id);
            itemno++;

    }

    function buyitem(uint _id) public payable 
    {
        require(checkitem(_id), "Item is not listed");
        require(msg.value == selling[_id].cost);
        itemsbought[msg.sender].push(selling[_id].id);
  
    }

    function myorders() view public returns(uint[] memory)
    { 
        return itemsbought[msg.sender];
    }
}
