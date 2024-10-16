// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/*
 1. Add 0x07 to 0x08
 2. store the result at the next free memory location.
3. (optional) write this again in opcodes
*/
contract Deploy1{

   function add() external pure returns (uint256 res) {
    assembly {
        let memFree := mload(0x40)
        mstore(memFree, add(0x07, 0x08))
        res := mload(memFree)
    }
   } 
}