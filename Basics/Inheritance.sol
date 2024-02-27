//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract isOwnable{
    address owner;
    modifier onlyOwner(){
        require(msg.sender == owner,"Must be Owner");
        _;
    }
}

contract SecretVault {
    string secret;
    constructor(string memory _secret) {
        secret = _secret;
    }
    function getSecret() public view returns (string memory){
        return secret;
    }
}
contract Inheritance is isOwnable{
    //Inheritance
    //Factories
    //Interactions
    address secretVault;
    constructor(string memory _secret){
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }
    function getSecret() public view returns(string memory){
        return SecretVault(secretVault).getSecret();
    }
}