// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract GasLeft{


    uint256 value;

    Reciver private   r  ;

    constructor(Reciver _r){
        r=_r;
    }

    function getValue() external   returns(uint256){
       uint256 gasBegin=gasleft();
       console.logUint(gasBegin);
       value++;
       uint256 gasEnd=gasleft();
       console.logUint(gasEnd);
       console.logUint(gasBegin-gasEnd);
       console.logUint(tx.gasprice);
       console.logUint((gasBegin-gasEnd)*tx.gasprice);
       console.logUint(block.basefee);
       console.logUint( block.gaslimit);

       return  value;
    }

    function sendEther() external  payable {
        
       payable(address(r)).transfer(2);
    // (bool result,) = address(r).call{value:msg.value,gas:2300}("");
    // require(result);

    }

    function invoke() external payable  {

        r.bizMethod{gas:8000}();

    }
    function showBalance() external view  returns(uint256){
        return address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266).balance;
    }
}

contract Reciver{

     uint value;

    function invoke2() external payable{

        require(msg.value>1 ether,"trasaction fail");
        value++;
    }

//99999999999992175684
//99999999999992132750
    function showBalance() external view  returns(uint256){
        return address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4).balance;
    }
    receive() external payable { 
        console.logUint(gasleft());
    }

    function bizMethod() external{
        
       (bool r,) = address(0).call{gas:5000}("");
       require(r);

    }
}