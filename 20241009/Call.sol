// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";

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
       console.logBytes(data);
    }


    function setN(uint256 _number) external {
      (bool _r,bytes memory data)= to.call(abi.encodeWithSignature("setN(uint256)",_number));
       require(_r,"execute fail");
       console.logBytes(data);
    }

    function delegateSetN(uint256 _number) external {
      (bool _r,bytes memory data)= to.delegatecall(abi.encodeWithSignature("setN(uint256)",_number));
       require(_r,"execute fail");
       console.logBytes(data);
    }
     function staticSetN() view external {
      (bool _r,bytes memory data)= to.staticcall(abi.encodeWithSignature("number()"));
       require(_r,"execute fail");
       console.logBytes(data);
    }
}