// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "https://github.com/NomicFoundation/hardhat/blob/main/packages/hardhat-core/console.sol";
contract FixBytes{

    bytes1 a=0x12;
    bytes2 b=0x1234;
    bytes2 bb=0x0012;
    bytes3 c;

    function show() external {
        console.logBytes1(a[0]);
        console.logUint(b.length);
        console.logUint(bb.length);
        for(uint i=0;i<b.length;i++){
            console.logBytes1(bb[i]);
        }
    }

}

contract DynamicBytes{

    bytes a;
    //bytes b=0x1234;
    bytes c=hex'123456';

    //dynamic array ---->push pop

    function show() external {
        console.logUint(c.length);
        c.push(0x12);
        console.logUint(c.length);
        console.logBytes(a);
        c.pop();
        console.logUint(c.length);
        bytes memory d;
        delete c[0];

    }
}