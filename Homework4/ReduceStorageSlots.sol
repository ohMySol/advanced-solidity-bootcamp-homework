// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* 
    Task: By re ordering the variables, can you reduce the number of storage slots needed ?
*/


// Original contract
/* contract ReduceStorageSlots {
    struct payments {
        bool valid; - 1 byte
        uint256 amount; - 32 bytes
        address sender; - 20 bytes
        uint8 paymentType; - 1 bute
        uint256 finalAmount; - 32 bytes
        address receiver; - 20 bytes
        uint256 initialAmount; - 32 bytes
        bool checked; = 1 byte
    }
    uint8 index; - 1 byte
    uint256 public number; - 32 bytes
    bool flag1; - 1 byte
    address admin; - 20 bytes
    mapping (address=>uint256) balances;
    bool flag2; - 1 byte
    address admin2; - 20 bytes
    bool flag3; - 1 byte
    payments[8] topPayments;


    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
} */

// Optimised vetsion of the storage.
/* In this folder you can also found ReduceStorageSlots.svg uml diagram 
   with the optimized storage slots representation. So I was able to reduce slots from
   initial 5-60, to 4-43. 
*/
contract ReduceStorageSlots {
    struct payments {
        bool valid; 
        bool checked;
        uint8 paymentType; 
        address sender; 
        address receiver;
        uint256 amount; 
        uint256 finalAmount; 
        uint256 initialAmount;
    }
    
    uint8 index;
    bool flag1;
    bool flag2;
    bool flag3;
    address admin;
    uint256 public number;
    address admin2;
    mapping (address=>uint256) balances;
    payments[8] topPayments;

    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}