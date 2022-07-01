//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import "./Ownable.sol"; 

contract Allowance is Ownable{
    mapping(address => uint) public allowance;

    event ChangedAllowance(address indexed _from, address indexed _to, uint _previousamount, uint _updatedamount);

    function giveAllowance(address _to, uint _amount) public OwnerAccess() {
        allowance[_to] = allowance[_to] + (_amount);
        emit ChangedAllowance(msg.sender, _to, allowance[_to] - (_amount), allowance[_to]);
    }

    function updateAllowance(address _to, uint _amount, address _from) internal {
        allowance[_to] = allowance[_to] - (_amount) ;
        emit ChangedAllowance(msg.sender, _from, allowance[_to] + (_amount), allowance[_to]);
    }

    modifier ownerOrAllowanced(uint _amount){
        require( isOwner() || allowance[msg.sender] >= _amount, "You're unauthorized!");
        _;
    }
}
