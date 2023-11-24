# Shared Wallet on Ethereum
## Overview
This project provides a simple implementation of a shared wallet on the Ethereum blockchain. The shared wallet allows for a designated owner to manage allowances for other addresses, enabling them to withdraw funds up to the allocated allowance. The smart contract is written in Solidity and utilizes the Ganache development blockchain for testing purposes.

## Smart Contracts
1. Allowance.sol
This contract manages allowances granted by the owner to specific addresses. It includes the following functionalities:

***giveAllowance(address _to, uint _amount)***: Allows the owner to give an allowance to a specific address.
***updateAllowance(address _to, uint _amount, address _from)***: Internal function to update the allowance when funds are withdrawn.
***modifier ownerOrAllowanced(uint _amount)***: Modifier to ensure that the caller is the owner or has a sufficient allowance.
2. Ownable.sol
This contract provides basic ownership functionality:

***isOwner()***: Checks if the caller is the owner.
***modifier OwnerAccess()***: Modifier to restrict access to the owner.
3. SharedWallet.sol
This is the main contract that inherits from Allowance. It adds functionalities for receiving and withdrawing funds:

***receiveMoney()***: Allows the contract to receive funds.
***withdrawMoney(address payable _adr, uint _amount)***: Allows the owner or addresses with sufficient allowance to withdraw funds.
Events
The smart contracts emit events to track important transactions:

***ChangedAllowance(address indexed _from, address indexed _to, uint _previousamount, uint _updatedamount)***: Emits when an allowance is updated.
***Received(address indexed _from, uint _amount)***: Emits when the contract receives funds.
***Sent(address indexed _to, uint _amount)***: Emits when funds are sent out from the contract.
