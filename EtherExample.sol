pragma solidity ^0.5.17;

contract EtherExample {
    
    mapping(address => uint) public balance;
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function() external payable {
        buyToken();
    }
    
    function buyToken() public payable{
        //buy a token
        balance[msg.sender] +=1;
        
        //send ether to the wallet
        wallet.transfer(msg.value);
    }
}
