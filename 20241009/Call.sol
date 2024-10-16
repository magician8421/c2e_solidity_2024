// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";

contract Called{
     uint256 public number;
    function inc() external {
        ++number;
    }

    function setN(uint256 _number) external payable{
       console.logBytes(msg.data);
        number=_number;
    }

     function testLowLevelCall() pure external {
        console.logBytes(abi.encodeWithSignature("setN(uint256)",100));
    }

    fallback() external payable { }

    receive() external payable { }

}

contract Caller{
    uint256 public number;
    address to;
    constructor(address _to){
        to=_to;
    }

    
    function inc() external {
       (bool _r,bytes memory data)= to.call(abi.encodeWithSignature("inc()"))   ;
       require(_r,"execute fail");
       console.logBytes(data);
    }


    function setN(uint256 _number) external payable returns(uint256) {
      (bool _r,bytes memory data)= to.call(abi.encodeWithSignature("setN(uint256)",_number));
       console.logBytes(data);
       require(_r,"execute fail");
       return msg.value;

    }

    function delegateSetN(uint256 _number) external {
      (bool _r,bytes memory data)= to.delegatecall(abi.encodeWithSignature("testLowLevelCall()"));
       require(_r,"execute fail");
       console.logBytes(data);
    }

    function staticSetN() view external {
      (bool _r,bytes memory data)= to.staticcall(abi.encodeWithSignature("testLowLevelCall()"));
       require(_r,"execute fail");
       console.logBytes(data);
    }

    function testLowLevelCall() pure external {
        console.logBytes(abi.encodeWithSignature("inc()"));
    }
}