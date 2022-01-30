// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

contract voting{
    uint public winner;
    uint id;
    uint[] u;
    constructor() public {
        id = 1;
    }
    struct partcipant {
        address a;
        uint votes;
        bool added;
    }
    mapping(uint => partcipant) vid;
    

    function addpartcipant(address _a) public returns(bool) {
        require(vid[id].added == false);
        u.push(id);
        vid[id].a = _a;
        vid[id].votes = 0;
        vid[id].added = true;
        id++;
        return true;
    }
    function vote(uint votingid) public returns(address){
        uint add = u[votingid];
        vid[add].votes++;
        return vid[add].a;
    }
    function winnerd() public
    {
        uint v = 0;
        for (uint i = 0; i < u.length; i++) 
        {
            if (vid[u[i]].votes > v)
             {
                v = vid[u[i]].votes;
                winner = i;
            }
        }
    }
}