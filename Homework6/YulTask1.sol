// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Task1 {
    /**
     * Create a Solidity contract with one function 
     * The solidity function should return the amount of ETH that was passed to it,
     *  and the function body should be written in assembly
     */
    function amountEthPassed() external payable returns(uint256 amountPassed) {
        assembly {
            amountPassed := callvalue()
        }
    }

    // Task3
    // Below is a pure Yul function and I need to explain what is it doing.
    function allowanceStorageOffset(account, spender) -> offset {
        offset := accountToStorageOffset(account) // 1. Calculate a base storage offset for the given account
        mstore(0, offset) // 2. Store an offset  in the slot 0
        mstore(0x20, spender) // 3. Store spender in memory position 0x20(32 bytes after memory position 0).
        offset := keccak256(0, 0x40) // 4. Calc keccack256 hash from the data stored in memory from position 0 to 0x40(64 bytes in total).
        // A hashed data consists of the concatenation of 'offset' and 'spender'.
        // The resulting hash value represents the storage slot where the allowance is stored.

        // Conclusion: this function is stored to calculate the storage location(offset) for both the account that owns the ERC20 and the allowed account(spender). 
        // The maximum amount that is allowed to be spent is stored at this offset.
    }
}