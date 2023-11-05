// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CPAWeb3 {
    // Hardcoded campaign terms
    uint256 public constant DURATION = 30 days;
    uint256 public constant PLANNED_LEADS_PER_DAY = 240;
    uint256 public constant PLANNED_VOLUME_PER_LEAD = 300; // In USDT
    uint256 public constant ADVERTISER_FEE_PERCENT = 30; // 0.3%
    uint256 public constant PUBLISHER_REWARD_FEE_FROM_ADVERTISER_FEE_PERCENT = 50; // 50%
    uint256 public constant SUGGESTED_DEPOSIT_AMOUNT = 4000 ether; // Hardcoded for demo, typically would be calculated

    // Addresses for the publisher and advertiser (hardcoded for demo)
    address payable public publisher;
    address payable public advertiser;

    // Campaign start and end time
    uint256 public startTime;
    uint256 public endTime;

    // Event for when the campaign is created
    event CampaignCreated(uint256 startTime, uint256 endTime);

    constructor(address payable _publisher, address payable _advertiser) {
        publisher = _publisher;
        advertiser = _advertiser;
        startTime = block.timestamp;
        endTime = block.timestamp + DURATION;
        emit CampaignCreated(startTime, endTime);
    }

    // Fallback function to receive ETH
    receive() external payable {}

    // Function to display campaign terms (Read-Only)
    function showTerms() public pure returns (string memory) {
        return "Duration: 30 days, Planned leads per day: 240, Planned volume per lead: 300 USDT, Advertiser fee: 0.3%, Publisher reward fee from advertiser fee: 50%";
    }

    // Function to execute payout to the publisher
    function payoutPublisher() public {
        require(block.timestamp >= endTime, "Campaign has not ended yet");
        require(address(this).balance >= SUGGESTED_DEPOSIT_AMOUNT, "Insufficient funds for payout");

        // Calculate the payout amount (simplified for demo)
        uint256 payoutAmount = address(this).balance * PUBLISHER_REWARD_FEE_FROM_ADVERTISER_FEE_PERCENT / 100;

        // Transfer payout to the publisher
        publisher.transfer(payoutAmount);
    }

    // Function to refund any remaining balance to the advertiser after campaign ends and payout is done
    function refundAdvertiser() public {
        require(block.timestamp >= endTime, "Campaign has not ended yet");

        // Refund the remaining balance to the advertiser
        uint256 remainingBalance = address(this).balance;
        if (remainingBalance > 0) {
            advertiser.transfer(remainingBalance);
        }
    }
}