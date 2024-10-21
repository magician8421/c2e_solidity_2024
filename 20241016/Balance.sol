// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Balance{

    uint x;
    mapping(address=>bool) isCheck;
    function balanceOf() external returns(uint256){
        x++;
        return address(this).balance;
    }

    function dec() external {
        x--;
    }
    receive() external payable { 
        for(uint i=0;;i++){
           
        }

    }
    fallback() external payable { }
}