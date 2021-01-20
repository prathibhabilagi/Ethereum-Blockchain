pragma solidity ^0.5.17;

contract FunctionExample {
    
    mapping(address => uint) public balanceRecived;
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function convertWeiToEther(uint _amountInWie) public pure returns(uint){
        return _amountInWie / 1 ether;
    }
    
    function destroySmartContract() public {
        require (msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }
    
    function receiveMoney() public payable {
        //10+10 ether = 20 ether ===> 10 if we add 10 throw expection
        assert(balanceRecived[msg.sender] + msg.value >= balanceRecived[msg.sender]); //amt is added to curntbalance 
        
        balanceRecived[msg.sender] += msg.value; //balance of curnt acc adrs -> ether sent 
    }
    
    function withdrawMoney(address payable _to, uint _amount) public payable{
        require(balanceRecived[msg.sender] >= _amount, "Not enough funds");
        assert(balanceRecived[msg.sender] + msg.value >= balanceRecived[msg.sender] - _amount);
        balanceRecived[msg.sender] -= _amount; //deduct the amt in curnt balance
       _to.transfer(_amount); //tranfer amt mentioned to given acc address
    }
   
   function() external payable{
       reciveMoney();
       
   }
}
