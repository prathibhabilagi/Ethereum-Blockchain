pragma solidity ^0.5.17;

contract simpleMappingExample {

    mapping (uint => string) public names;
    
    constructor() public {
        names[1] = "Tae";
        names[2] = 'V';
        names[3] = "RM";
    }

//Adding a book using Mapping and structs
    
    mapping (uint => Book) public books;
    
    struct Book {
        string title;
        string author;
    }
    
    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }
    
    
 //Adding Books Using nested mapping
    
    mapping (address => mapping(uint => Book)) public myMapping;
    
    function addMyNestedBook(uint _id, string memory _title, string memory _author) public{
        myMapping[msg.sender][_id] = Book (_title, _author);
    }
}
