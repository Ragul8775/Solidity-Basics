//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    enum Statuses {Vacant, Occupied}
    Statuses public currentStatus;

    event Occupy(address _ocupant, uint _value);

    address payable public owner;

    constructor(){
        owner = payable (msg.sender);
        currentStatus= Statuses.Vacant;
    }
    modifier costs(uint _amount){
        require(msg.value>= _amount,"Not enough Ether Provided");
        _;
    }
    modifier OnlyWhileVacant(){
        require(currentStatus == Statuses.Vacant,"Currently Occupied");
        _;
    }
     function book() public payable  OnlyWhileVacant costs(2 ether){
        currentStatus= Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
     }
}