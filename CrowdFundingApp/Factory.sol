// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Factory{
    struct Campaign{
        address payable campaignOwner;
        address payable beneficiary;
        string title;
        uint deadline;
        uint amountToRaise;
        uint raisedAmount;
        bool closed;
    }
Campaign[] public campaignList;
mapping (string => Campaign) public titleToCampaign;
// string [] public titleOfCampaigns;

function createCampaign(
    address payable beneficiary,
    string memory title,
    uint deadline,
    uint amountToRaise
  ) public {
     // Check if a campaign with the same title already exists
    require(bytes(titleToCampaign[title].title).length == 0, "Guy you no fit create name nii");

    // Ensure beneficiary address is not zero address
    require(beneficiary != address(0), "Which kind address be this");
    
    // Ensure title is not empty
    require(bytes(title).length > 0, "Your campaign no get name");

    // Ensure amount to raise is greater than zero
    require(amountToRaise > 0, "Bruhh can you not do that?");


    // This Section of code would be suitable if a campaign would be Updated in the near future 
    // Campaign memory newCampaign = titleToCampaign[title];
    // newCampaign.campaignOwner = payable(msg.sender);
    // newCampaign.beneficiary  = beneficiary;
    // newCampaign.title   = title;
    // newCampaign.deadline    = deadline;
    // newCampaign.amountToRaise= amountToRaise;
    // newCampaign.raisedAmount = 0;
    // newCampaign.closed    = false;
    // campaignList.push (newCampaign);

    Campaign memory newCampaign = Campaign({
        campaignOwner: payable(msg.sender),
        beneficiary :   beneficiary,
        title       :  title,
        deadline     :deadline ,
        amountToRaise:amountToRaise,
        raisedAmount    :0,
        closed            :false
    });

titleToCampaign[title] = newCampaign;
campaignList.push(newCampaign);

}



function getCampaigns(string memory title) public view returns(
    address payable beneficiary,
    uint raisedAmount,
    uint deadline
) {
    return (
        titleToCampaign[title].beneficiary,
        titleToCampaign[title].raisedAmount,
        titleToCampaign[title].deadline
    ); 
}


function getAllCampaigns() public view returns (string[] memory) {
    string[] memory titles = new string[](campaignList.length);
    
    for (uint i = 0; i < campaignList.length; i++) {
        titles[i] = campaignList[i].title;
    }
    
    return titles;
}


}