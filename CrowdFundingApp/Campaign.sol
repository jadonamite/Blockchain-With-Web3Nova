// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {Factory} from "CrowdFundingApp/Factory.sol";

contract Campaign is Factory {

    struct Contributor{
        string name;
        address contributorAddress;
        uint contributions;
      }
      
      address[] public contributors; // Addresses of the contributers
      Contributor[] public allContributors;
      mapping (uint => address) contributorId;
      mapping(address => Contributor)  contributorsList;
      mapping(address => uint) addressToAmount;


      // function contribute(uint contribution)public payable{
      //   require(contribution >= 1 ether);
      //   uint contributorCount = contributors.length;
      //   require(contributorCount < 5,"Already 5 Contributers");
      //   address contributerAddress = msg.sender;
      //   require(!contributingInProcess[contributerAddress]);
      //   contributingInProcess[contributerAddress] = true;
      //   contributors.push(contributerAddress);
      //   contributorId[contribution] = contributersList[contributerAddress].name;
      //   allContributors.push(Contributor(contributersList[contributerAddress].name,msg.sender, contribution));
      //   contributorsCount
      // }

      function contribute(string memory title,uint contribution)public payable {
        Campaign memory newCampaign = titleToCampaign[title];  
    // newCampaign.raisedAmount = 0;
    // campaignList.push (newCampaign);
      }
      function getBalance(string memory title ) public view returns (uint){
        return titleToCampaign[title].raisedAmount;
      }

       function getGoal(string memory title ) public view returns (uint){
        return titleToCampaign[title].amountToRaise;
      }
      function getDeadline(string memory title ) public view returns (uint){
        return titleToCampaign[title].deadline;
      }

      
    }



