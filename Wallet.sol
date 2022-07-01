//SPDX-License-Identifier: MIT
import "./Allowance.sol";
import "./Ownable.sol";
contract SharedWallet is Allowance{
    event Received(address indexed _from, uint _amount);
    event Sent(address indexed _to, uint _amount);

    function receiveMoney() public payable{
        emit Received(msg.sender, msg.value);

    }
    
    receive() external payable{
        receiveMoney();
    }

    function withdrawMoney(address payable _adr, uint _amount) public ownerOrAllowanced(_amount) {
        require(_amount <= address(this).balance, "Insufficient Fund!");
        if(!isOwner()){
            updateAllowance(msg.sender, _amount, _adr);
        }
        _adr.transfer(_amount);
        emit Sent(_adr, _amount);
    }
}
