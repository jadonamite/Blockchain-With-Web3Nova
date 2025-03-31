// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract CrowdfundingFactory {

    struct Campaign{
        address payable campaignOwner;
        address payable beneficiary;
        string title;
        uint deadline;
        uint amountToRaise;
        uint raisedAmount;
        bool closed;
    }
Campaign[] listOfCampaigns;
uint public numOfCamps = 0;
mapping (string => Campaign)campaignTitles;

 function createNewCampaign(address payable _beneficiary, string memory _title, uint256 _deadline, uint amountToRaise)external {
          CrowdfundingCampaign newCampaign = new CrowdfundingCampaign(
            msg.sender,
            campaignName,
            campaignDescription,
            goal,
            deadline
        );

 }
}