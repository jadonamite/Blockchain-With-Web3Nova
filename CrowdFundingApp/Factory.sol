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
string [] public titleToCampaign;

function addCampaign(
    address payable beneficiary,
    string memory title,
    uint deadline,
    uint amountToRaise
  ) public {

     // Check if a campaign with the same title already exists
    require(bytes(titleToCampaign[title].title).length == 0, "Campaign with this title already exists");
    
    // Ensure beneficiary address is not zero address
    require(beneficiary != address(0), "Which kind address be this");
    
    // Ensure title is not empty
    require(bytes(title).length > 0, "Your campaign no get name");
    
    // Ensure deadline is in the future
    // require(deadline > block.timestamp, "Sheee you are wise now");
    
    // Ensure amount to raise is greater than zero
    require(amountToRaise > 0, "Bruhh can you not do that?");


    // Creating a new campaign and adding it to an array

    Campaign memory newCampaign = titleToCampaign[title];
    newCampaign.campaignOwner = payable(msg.sender);
    newCampaign.beneficiary  = beneficiary;
    newCampaign.title   = title;
    newCampaign.deadline    = deadline;
    newCampaign.amountToRaise= amountToRaise;
    newCampaign.raisedAmount = 0;
    newCampaign.closed    = false;
    campaignList.push (newCampaign);
    // titleToCampaign[title] = newCampaign;
}

// function getCampaigns(string memory title)public view returns(
//     address payable beneficiary,
//     uint raisedAmount,
//     uint deadline
//     ){
//     return (
//       titleToCampaign[title].beneficiary ,
//         titleToCampaign[title].raisedAmount,
//           titleToCampaign[title].deadline,
//     )

// }
function getAllCampaigns() public pure returns(string[] memory  ){
    return _campaignList;
   return c

}


}