# CPA Campaign Smart Contract

## Overview
The CPA Campaign smart contract is designed for a hackathon demo, with hardcoded values to simulate a campaign for cost-per-action (CPA) advertising on the blockchain.

## Contract Features
- Hardcoded terms for a single advertising campaign.
- Ability to receive funds directly to the contract's address.
- Read-only method to display campaign terms on-chain.
- Function to execute payout to the publisher after the campaign has ended.
- Function to refund any remaining balance to the advertiser after payouts.

## Campaign Terms
- Duration: 30 days
- Planned leads per day: 240
- Planned volume per lead: 300 USDT
- Advertiser fee: 0.3%
- Publisher reward: 50% of the advertiser fee
- Suggested deposit amount: 4000 USDT (for demo purposes)

## How it Works
1. The advertiser sends the suggested deposit amount to the smart contract address to fund the campaign.
2. After the campaign duration ends (30 days from the contract creation), the publisher can call `payoutPublisher` to receive their share of the revenue.
3. If there is any remaining balance after the publisher's payout, the advertiser can call `refundAdvertiser` to get back their funds.

## Using the Contract
To view the campaign terms on Etherscan or another blockchain explorer:
1. Navigate to the 'Read Contract' section.
2. Find and execute the `showTerms` function.

## Example
- A campaign with a 30-day duration is expected to have 240 leads per day, each lead with an average volume of 300 USDT.
- The advertiser's fee is 0.3% of the volume, and the publisher is rewarded with 50% of this fee.
- The suggested deposit amount is calculated as 4000 USDT for demonstration purposes.