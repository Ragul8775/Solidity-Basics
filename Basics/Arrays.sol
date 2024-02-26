//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Array{
    uint[] public myArray =[1,2,3,4,5];
    string[] public stringArray = ["apple","banana","cocomelon","DragonFruit"];
    string[] public values;
    uint256[] [] public array2D =[[1,2,3],[4,5,6]] ;

    function addValue(string memory _value)public {
        values.push(_value);
    }
    function valueCount() public view returns(uint){
        return values.length;
    }

}