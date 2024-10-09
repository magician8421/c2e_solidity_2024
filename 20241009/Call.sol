// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Called{
     uint256 public number;
    function inc() external {
        ++number;
    }

    function setN(uint256 _number) external {
        number=_number;
    }

}

contract Caller{
    uint256 public number;
    address to;
    constructor(address _to){
        to=_to;
    }

    
    function inc() external {
       (bool _r,bytes memory data)= to.call(abi.encodeWithSignature("inc()"));
       require(_r,"execute fail");
    }


    function setN(uint256 _number) external {
      (bool _r,bytes memory data)= to.call(abi.encodeWithSignature("setN(uint256)",_number));
       require(_r,"execute fail");
    }

    function delegateSetN(uint256 _number) external {
      (bool _r,bytes memory data)= to.delegatecall(abi.encodeWithSignature("setN(uint256)",_number));
       require(_r,"execute fail");
    }
   
}