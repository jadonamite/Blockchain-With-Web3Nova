// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BankContract{
Icalculator public calculator =I_Calculator(address(12));

function add(uint a, uint b) external returns (uint) { return calculator.add(a,b);}
}