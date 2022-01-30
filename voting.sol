// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.8.0;

contract voting{
    struct partcipant {
        address a;
        uint votes;
        bool added;
    }    
    mapping(address => partcipant) vid;
    address[] a;

    function addpartcipant(address _a) public returns(bool) {
        a.push(_a);
        vid[_a].votes = 0;
        vid[_a].added = true;
        return vid[_a].added;
    }
    function vote(uint votingid) public returns(address){
        address add = a[votingid];
        vid[add].votes++;
        return add;
    }
}