//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract MyContract{
    //State Variable
    uint myUnit=1;
    


    //Local Variable
    function getValue() public pure returns (uint){
        uint value = 10;
        return value;
    }
}