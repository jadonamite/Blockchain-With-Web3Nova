// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract calculator {
    uint256 public result;

    function add(uint256 _a, uint256 _b) public returns (uint256) {
        result = _a + _b;
        return result;
    }

    function sub(uint256 _a, uint256 _b) public returns (uint256) {
        result = _a - _b;
        return result;
    }

    function mul(uint256 _a, uint256 _b) public returns (uint256) {
        result = _a * _b;
        return result;
    }

    function div(uint256 _a, uint256 _b) public returns (uint256) {
        result = _a / _b;
        return result;
    }




}