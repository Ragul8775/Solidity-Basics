//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Address_Book{
     mapping (address => address[]) private contacts;
     mapping (address=>mapping (address=> string)) private aliases;

     function getContact()public view returns(address[] memory){
        return contacts[msg.sender];
     }
     function addContact(address contactAddress, string memory aliasName)public{
        contacts[msg.sender].push(contactAddress);
        aliases[msg.sender][contactAddress]=aliasName;
     }
     function getAlias(address contactAddress)public view returns(string memory){
        return aliases[msg.sender][contactAddress];
     }
     function removeContact(address contactAddress) public {
        uint Length = contacts[msg.sender].length;
        for (uint i=0;i<Length;i++){
            if(contactAddress == contacts[msg.sender][i]){
                if(contacts[msg.sender].length>1 && i<Length-1){
                      contacts[msg.sender][i]=contacts[msg.sender][Length-1];
                }
                contacts[msg.sender].pop();

                delete aliases[msg.sender][contactAddress];
                break;
            }
        }

     }
} 