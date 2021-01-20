pragma solidity ^0.5.17;

contract TimestampExample {

  mapping(uint => Person) public people;
    uint public peopleCount = 0;
    uint openingTime = 1611032631;
    
    address owner;
    
    modifier onlyWhileOpen() {
        require(block.timestamp >=openingTime);
        _;
    }
    
    struct Person{
        uint _id;
        string name;
        uint age;
    }
    
    function addPerson(string memory _name, uint _age) public onlyWhileOpen{
     
       incrementCount();
       people[peopleCount]= Person(peopleCount, _name, _age);
        
    }
    
     function incrementCount() internal{
        peopleCount +=1;
    }
} 
