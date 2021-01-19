pragma solidity ^0.5.17;

contract MappingStructExample {
    
    struct Payment {
        uint amount;
        uint timestamp;
    }
    
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }
    
    mapping(address => Balance) public balanceRecived;
    
    //Get Balance of given adress
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    // send money from the origin adress and display num of payments done/sent
    function sendMoney() public payable{
        balanceRecived[msg.sender].totalBalance += msg.value;
        
        //struct 
        Payment memory payment = Payment(msg.value, now);
        
        balanceRecived[msg.sender].payments[balanceRecived[msg.sender].numPayments] = payment;
        balanceRecived[msg.sender].numPayments++;
    }
    
    //withdraw money using specific amount
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceRecived[msg.sender].totalBalance >=  _amount, "Not enough Funds");
        balanceRecived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
    
    //withdraw all the money
    function withdrawAllMoney(address payable _to) public payable {
        uint balanceToSend = balanceRecived[msg.sender].totalBalance;
        balanceRecived[msg.sender].totalBalance = 0;
        _to.transfer(balanceToSend);
    }
}
