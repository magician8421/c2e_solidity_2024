//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";


contract CallMsg{

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 100
// 0x7eecd3b6
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//EOA->CallMsg
    function msgFrom() external  payable returns(address,bytes32) {
            console.logAddress(msg.sender);
            console.logUint(msg.value);
            console.logBytes(msg.data);
            console.logAddress(tx.origin);
    }

}

// 0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c
// 0
// 0x7eecd3b6
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// EOA->CallContact->CallMsg
contract CallContract{

    CallMsg call;
    constructor(CallMsg _call){
        call=_call;
    }

    function callContract() external payable {
        call.msgFrom();
    }

}

//0xb4a88c4086055b8f546911BaaED28b7CEE134EF9
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 100
// 0x7eecd3b6
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// EOA->CallDelegate->CallMsg
contract CallDelegate{
    CallMsg call;
    constructor(CallMsg _call){
        call=_call;
    }

    function delegateCall() external payable{
     (bool _r,bytes memory data)=  address(call).delegatecall(abi.encodeWithSignature("msgFrom()"));
      require(_r,"execute fail");
      console.logBytes(data);
    }

}