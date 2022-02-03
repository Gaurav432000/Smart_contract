// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

contract marketplace {
    bool isseller;
    address[] sellers;
    
    struct item 
    {
        string name;
        uint id;
        uint cost;
        uint time;
    }

    uint itemno;
    constructor() public 
    {
        sellers.push(msg.sender);
        itemno =1;
    }

    function addsellers(address _s) public 
    {
        sellers.push(_s);
    }

    mapping(uint => item) selling;
    mapping(address => uint[]) itemsbought;
    uint[] itemb;
    
    function checkseller() public 
    {
         for(uint i=0; i<sellers.length; i++)
        {
            if(msg.sender == sellers[i])
            {
                isseller =true;
            }
        }
    }
    function listitem(string memory _name,uint _id, uint _cost) public 
    {
            require(isseller == true , "only seller can list items");
            selling[itemno].name = _name;
            selling[itemno].id = _id;
            selling[itemno].cost = _cost;
            selling[itemno].time = block.timestamp;
            itemno++;
    }

    function buyitem(uint _id) public payable 
    {
        for(uint i=1; i<itemno; i++)
        {
            if(selling[i].id == _id )
            {
                require(msg.value == selling[i].cost);
                itemsbought[msg.sender].push(selling[i].id);
            }
        }
    }
    function myorders(uint i) view public returns(uint[] memory )
    { 
        return itemb[i];
    }
}