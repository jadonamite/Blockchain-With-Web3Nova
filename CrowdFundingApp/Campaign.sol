// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import {Factory} from "CrowdFundingApp/Factory.sol";

contract Campaign is Factory {

    struct Contributor{
        string campaignToVote;
        address contributorAddress;
        uint contributions;
      }
      
      address[] public contributors; // Addresses of the contributers
      Contributor[] public allContributors;
      mapping (uint => address) contributorId;
      mapping(address => Contributor)  contributorsList;
      mapping(address => uint) addressToAmount;
      uint contributorCount = contributors.length;



        

      //   require(!contributingInProcess[contributerAddress]);
      //   contributingInProcess[contributerAddress] = true;
      //   contributors.push(contributerAddress);
      //   contributorId[contribution] = contributersList[contributerAddress].name;

      function contribute(string memory title,uint contribution)public payable {
        require(contribution >= 10000 gwei, "No stingy contributions Here");
        Campaign memory newCampaign = titleToCampaign[title];  
        newCampaign.raisedAmount += contribution;
        campaignList.push (newCampaign);
         addressToAmount[msg.sender] = contribution;
        contributorsList[msg.sender].campaignToVote = title;
        allContributors.push(Contributor(title, msg.sender, contribution));
      
      }
    function getCampaign() public view returns (uint){
        return campaignCount;
      }
     mapping(string => Campaign)  public titleToCampaign; // Title to Campaign address map
 
          
       uint private campaignCount;
        
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



