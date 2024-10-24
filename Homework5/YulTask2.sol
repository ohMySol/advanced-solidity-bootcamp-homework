// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between  assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        //uint256 intermidearyVal;
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            mstore(mload(0x40), result)
        }

        assembly {
            return(0x80, 32)
        }
    }
}