// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            let molVal := mol
            mstore(mload(0x40), molVal)
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point
            return(0x80, 32)
        }
    }
}