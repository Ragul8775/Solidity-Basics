//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Conditional_loops {
    //If(some Condition)
    //do(do some condition)
    //else(do some other condition)
    address public owner;
    uint[] public numbers =[1,2,3,4,5,6,7,8,9,10,12,14,16,18];
    constructor(){
        owner= msg.sender;
    }
    address const = 0x4180A586726e6e5beEf0Dd2fC7BF14C9F8Cf7A68;
    function countEvenNumber() public view returns(uint){
        uint count =0;

        for(uint i=0; i<numbers.length; i++){
            if(isEvenNumber(numbers[i])){
                 count ++;
            }

        }
            return count;

    }


    function isEvenNumber(uint _number) public pure returns(bool){
        if(_number%2==0){
            return true;
        }else{
            return false;
        }
    }
    function isOwner() public view returns(bool){
        return (const == owner);
    }
    
}