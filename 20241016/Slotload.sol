// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";
contract LoadStorage{

    uint256 a;

    address b;
    bool c;


    function load(uint256 i) external view returns(string memory v) {
       
        assembly{
             v := sload(i)
           
        }
        if(b==address(0)){
        
        }
  
     

    }
}