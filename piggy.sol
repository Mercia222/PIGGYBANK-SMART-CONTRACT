// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{
    event deposit(uint amount); 
    event withdraw(uint amount); 

   address public owner = msg.sender; //declare msg.sender as the owner of the contract

   receive() external payable{
       emit deposit(msg.value); //emit event deposit with the value that is deposited 
   }

   function fWithdraw() external{//create a function that will help to withdraw, to capture the owner
       require(msg.sender == owner, "You are not the owner!");//require to make sure that the one withdrawing is the owner
       emit withdraw(address(this).balance); //emit event withdraw, how much is the person able to withdraw
       selfdestruct(payable(msg.sender)); 
   }

}

