//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Mapping{
    mapping(uint => string) public names;
    mapping (uint=>Book) public books;
    mapping (address=>mapping (uint =>Book)) public myBooks;
    struct Book {
        string Title;
        string Author;
    }

    constructor()  {
        names[1]="Adam";
        names[2]="Bruce";
        names[3]="Carl";
        names[4]="Kiran";
    }

    function addBook(uint _id, string memory _title, string memory _author) public{
        books[_id]=Book(_title,_author);
    }
    function addMyBooks(uint _id, string memory _title, string memory _author) public{
        myBooks[msg.sender][_id] = Book(_title, _author);
    }

}