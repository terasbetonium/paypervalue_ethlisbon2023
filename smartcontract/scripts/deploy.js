require("dotenv").config();
// Script to deploy the CPAWeb3 contract
const hre = require("hardhat");

async function main() {
    const CPAWeb3 = await hre.ethers.getContractFactory("CPAWeb3");
    const cpaWeb3 = await CPAWeb3.deploy();

    await cpaWeb3.deployed();

    console.log("CPAWeb3 deployed to:", cpaWeb3.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });