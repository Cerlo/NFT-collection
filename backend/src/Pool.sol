//SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "@openzeppelin/contracts/access/Ownable.sol";

error CollectIsFunished();
error GoalAlreadyRached();
error FailtedToSendEther();
error NoContribution();
error NotEnoughFunds();

contract Pool is Ownable {
    uint256 public end;
    uint256 public goal;
    uint256 public totalCollected;

    mapping(address => uint256) public contributions;
    

    event Contribute(address indexed contributor, uint256 amount);
    constructor(uint256 _duration, uint256 _goal) Ownable(msg.sender){
        end = block.timestamp + _duration;
        goal = _goal;
    }

    function contribute() external payable{
        if(block.timestamp >= end){
            revert CollectIsFunished();
        }
        if(msg.value ==0){
            revert NotEnoughFunds();
        }
        
    }

}