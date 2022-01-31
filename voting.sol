// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

contract voting{
    address[] public moderators;
    uint id;
    uint[] u;
    bool allowed;
    modifier onlyowner() {
        require(msg.sender == moderators[0] );
        _;
    }
        
    constructor() public {
        moderators.push(msg.sender);
        id = 1;
    }
    struct partcipant {
        address a;
        uint votes;
        bool added;
    }
    uint x;
    mapping(uint => partcipant) vid;
    function addmoderators(address _m) public payable onlyowner() {
        moderators.push(_m);
    }
    
    function addpartcipant(address _a) public returns(bool) 
    {
        for(uint i=0; i<moderators.length; i++)
        {
            if(msg.sender == moderators[i])
            {
            require(vid[id].added == false);
            u.push(id);
            vid[id].a = _a;
            vid[id].votes = 0;
            vid[id].added = true;
            id++;
            return true;
            }
        }
        
    }
    function vote(uint votingid) public returns(address){
        uint add = u[votingid];
        vid[add].votes++;
        return vid[add].a;
    }
    function winnerd() public view returns(uint)
    {   uint winner;
        uint v = 0;
        for (uint i = 0; i < u.length; i++) 
        {
            if (vid[u[i]].votes > v)
             {
                v = vid[u[i]].votes;
                winner = i;
            }
        }
        return winner;
    }
}