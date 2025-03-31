// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {Factory} from "CrowdFundingApp/Factory.sol";

contract Campaign{

    struct Contributor{
        string name;
        address contributorAddress;
        uint contributions;
      }
      
      address[] public contributors; // Addresses of the contributers
      Contributor[] public allContributors;
      mapping (address => uint) addressToContributions;
      mapping(address => Contributor)  contributorsList;

      
    }



