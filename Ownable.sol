//SPDX-License-Identifier: MIT

pragma solidity 0.6.1;

contract Ownable{

    address public _owner;

    constructor () public {
        _owner = msg.sender;
    }

    function isOwner() public view returns(bool) {
        return(msg.sender == _owner);
    }

    modifier OwnerAccess(){
        require(isOwner(), "Caller is not the owner!");
        _;
    }
}
