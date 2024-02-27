//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract HotalRoom{
    enum Statuses{ Vacant, Occupied };

    Statuses currentStatus;
    event Occupy(address _occupant, uint _value);

    address payable public owner;
    constructor() {
         owner = msg.sender;
         currentStatus = Statuses.Vacant;
    }
    modifier checkStatus {
         require(currentStatus == Statuses.Vacant,"Currently Occupied");
         _;
    }
    modifier costs(uint _amount){
       require(msg.value >= _amount,"Not Enough Ether Provided");
       _;
    }

    function book() checkStatus costs(2 ether) payable public {
        //Check Price
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);

        emit Occupy(msg.sender, msg.value);
    }
        
        

}