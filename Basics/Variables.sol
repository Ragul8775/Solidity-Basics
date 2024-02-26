//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Variables{
    uint public Myuint = 1;
    uint256 public myUint256 = 1;
    int public myInt = -10;
    int256 public myInt256 = 10;

    string public myString = "Hello World"; 
    bytes32 public myByte32 = "Hello World"; //return the bytes value
    address public myAddress = 0x4180A586726e6e5beEf0Dd2fC7BF14C9F8Cf7A68;
    
    //custom DataTypes
    struct MyStruct {
        string myStringStruct ;
        uint256 myUintStruct;
    }
    MyStruct public myStruct = MyStruct("Hello Struct",24);
    
}