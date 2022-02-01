// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

contract marketplace {

    address[] public sellers;
    modifier onlyowner() 
    {
        require(msg.sender == sellers[0] );
        _;
    }

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

    function addsellers(address _s) public onlyowner() 
    {
        sellers.push(_s);
    }

    mapping(uint => item) selling;
    mapping(address => uint[]) itemsbought;
    uint[] itemb;
    
    function listitem(string memory _name,uint _id, uint _cost) public 
    {
        for(uint i=0; i<sellers.length; i++)
        {
            if(msg.sender == sellers[i])
            {
            selling[itemno].name = _name;
            selling[itemno].id = _id;
            selling[itemno].cost = _cost;
            selling[itemno].time = block.timestamp;
            itemno++;
            }
        }
    }

    function buyitem(uint _id) public payable 
    {
        address payable a;
        for(uint i=0; i<itemno; i++)
        {
            if(selling[i].id == _id )
            {
                require(msg.value == selling[i].cost);
                a = payable(sellers[i]);
                a.transfer(msg.value);
                itemsbought[msg.sender].push(selling[i].id);
            }
        }
    }
    function myorders() view public
    { 
        for(uint i=0; i<itemsbought[msg.sender].length; i++)
        {
        itemb[i];
        }
    }
}