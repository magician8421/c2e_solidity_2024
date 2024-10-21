// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";
contract Array{

   address[] owner=new address[](10);
   address[] owner2;
   address[10] owner3;
    uint256[] public arr2 = [1, 2, 3];

   function show() external{

      console.logUint(owner.length);
      delete owner[9];
      console.logUint(owner2.length);
      owner2.push(address(0));
      console.logUint(owner2.length);
      arr2.push(2);
            console.logUint(arr2.length);
   }

}