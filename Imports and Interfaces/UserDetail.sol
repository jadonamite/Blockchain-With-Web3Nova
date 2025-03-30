// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Banking} from "./Banking.sol";

contract UserDetail is Banking{
string name;

function addName(string memory _name )public{
    name = _name;
}
function storefavouriteNumber(uint _favouriteNumber) public override {favouriteNumber = _favouriteNumber * 10;}

}