// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";
contract EthSend{
   uint x;
    address payable balance;
    constructor(address payable  to) payable {
        balance=to;
    }

    function transfer() external {
        balance.transfer(200);
    }
   function send() external {

        bool r= balance.send(200);
        x++;
       require(r);

    }

    receive() external payable { }
}