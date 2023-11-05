// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CPAWeb3 is ReentrancyGuard, Ownable {
    // Define the structure of the campaign
    struct Campaign {
        address publisher;
        address advertiser;
        uint256 duration;
        uint256 publisherRewardPercentage;
        uint256 leadsAmountPlan;
        uint256 conversionPlan;
    }

    // Events
    event CampaignCreated(uint256 campaignId, address indexed advertiser, uint256 depositAmount);
    event ProfitCalculated(uint256 campaignId, uint256 profit);
    event PublisherPaid(uint256 campaignId, address indexed publisher, uint256 payoutAmount);

    // State variables
    mapping(uint256 => Campaign) public campaigns;
    uint256 public campaignCount;
    mapping(uint256 => uint256) public deposits;

    // Constructor
    constructor() {}

    // Function to create a new campaign
    function createCampaign(
        address _publisher,
        address _advertiser,
        uint256 _duration,
        uint256 _publisherRewardPercentage,
        uint256 _leadsAmountPlan,
        uint256 _conversionPlan
    ) public onlyOwner payable {
        uint256 campaignId = campaignCount++;
        Campaign memory newCampaign = Campaign({
            publisher: _publisher,
            advertiser: _advertiser,
            duration: _duration,
            publisherRewardPercentage: _publisherRewardPercentage,
            leadsAmountPlan: _leadsAmountPlan,
            conversionPlan: _conversionPlan
        });
        campaigns[campaignId] = newCampaign;
        deposits[campaignId] = msg.value; // Assuming the intent is to track the deposit
        emit CampaignCreated(campaignId, _advertiser, msg.value);
    }


    // Function to deposit funds for a campaign
    function depositFunds(uint256 campaignId) public payable {
        require(campaigns[campaignId].advertiser == msg.sender, "Only advertiser can deposit");
        deposits[campaignId] += msg.value;
    }

    // Function to calculate profit for a campaign
    function calculateProfit(uint256 campaignId) public {
        // Logic to interact with Dune Analytics will be implemented here
        // For the purpose of this example, we'll emit an event
        emit ProfitCalculated(campaignId, 0); // Placeholder for actual profit calculation
    }

    // Function to pay out the publisher
    function payoutPublisher(uint256 campaignId) public nonReentrant {
        Campaign memory campaign = campaigns[campaignId];
        uint256 payoutAmount = deposits[campaignId] * campaign.publisherRewardPercentage / 100;
        require(address(this).balance >= payoutAmount, "Insufficient funds for payout");
        payable(campaign.publisher).transfer(payoutAmount);
        emit PublisherPaid(campaignId, campaign.publisher, payoutAmount);
    }

    // Function to withdraw funds (for Advertiser)
    function withdrawFunds(uint256 campaignId) public {
        require(campaigns[campaignId].advertiser == msg.sender, "Only advertiser can withdraw");
        uint256 remainingBalance = deposits[campaignId];
        deposits[campaignId] = 0;
        payable(msg.sender).transfer(remainingBalance);
    }
}