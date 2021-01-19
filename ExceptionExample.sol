pragma solidity ^0.5.17;

contract ExceptionExample {
    
    mapping(address => uint) public balanceRecived;
    
    function receiveMoney() public payable {
        assert (balanceRecived[msg.sender] + msg.value >= balanceRecived[msg.sender]);
        balanceRecived[msg.sender] += msg.value;
    }
    
    function withdrawmoney(address payable _to, uint _amount) public {
        require(_amount <= balanceRecived[msg.sender], "Not enough funds");
        assert(balanceRecived[msg.sender] >= balanceRecived[msg.sender] - _amount);
        balanceRecived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
