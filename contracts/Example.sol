pragma solidity 0.8.11;

contract Example {

    address payable public owner;
    uint public lastExecuted;

    constructor() payable {
        owner = payable(msg.sender);
    }


    function payOwner(uint256 _amount) external payable {
        (bool sent, ) = owner.call{value: _amount}("");
        require(msg.value == amount);
        lastExecuted = block.number;
    }


    function getLastExecuted() external view returns(uint) {
        return lastExecuted;
    }

}
