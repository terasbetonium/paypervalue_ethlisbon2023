require("dotenv").config();
// Script to deploy the CPAWeb3 contract
const hre = require("hardhat");

async function main() {
  // Replace with actual addresses
  const publisherAddress = "0xb212247b13334360b4cD5c9b7668b06Feae23107"; // The Ethereum address of the publisher
  const advertiserAddress = "0x69E56966FFa71E6c23FED998747f660Ad82cA31e"; // The Ethereum address of the advertiser

  const CPAWeb3 = await hre.ethers.getContractFactory("CPAWeb3");
  const cpaWeb3 = await CPAWeb3.deploy(publisherAddress, advertiserAddress);

  await cpaWeb3.deployed();

  console.log("CPAWeb3 deployed to:", cpaWeb3.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
