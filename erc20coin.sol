//  Insight Decentralized Consensus Challenge
pragma solidity ^0.4.19

contract ERC20coin{
    string public constant name = "ERC20coin";
    string public constant symbol = "CN";
    uint8 public constant decimals = 18;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(ddress indexed from, address indexed to, uint tokens);
    

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;


    uint256 totalSupply_;
    
using SafeMath for uint256;

constructor(uint 256 total)public{
    totalSupply_ = total;
    balances[msg.sender] = _totalSupply;

}

function totalSupply() public view returns (uint256) {
    return totalSupply_;
}

function balanceOf(address tokenOwner) public view returns (uint256){
    return balances[tokenOwner]
}

function transfer(address reciever, uint numTokens) public returns(bool){
    require(numTokens<=balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(numTokens);
    balances[reciever] = balances[reciever].add(numTokens);
    emit Transfer(msg.sender, reciever, numTokens);
    return True
    
}

function approve(address delegate, uint numTokens) public returns(bool){
    allowed[msg.sender][delegate] = numTokens;
    emit Approval(msg.sender, delegate, numTokens);
    return true;
}

function allowance(address owner, address delegate) public view returns(uint){
    return allowed[owner][delegate]
}

function transferFrom(address owner, address buyer, uint numTokens) public returns (bool){
    require(numTokens <= balances[owner]);
    require(numTokens <= allowed[owner][msg.sender]);
    balances[owner] = balances[owner].sub(numTokens);
    allowed[owner][msg.sender] = allowed[from][msg.sender] - numTokens;
    balances[buyer] = balances[buyer].add(numTokens);
    emit Transfer(owner, buyer, numTokens)
    return true;
}

library SafeMath{
    function sub(uint256 a, uint256 b)internal pure returns (uint256){
        assert(b <=a);
        return a - b;

    }

    function add(uint256 a, uint256 b)internal pure returns(uint256){
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}
}


