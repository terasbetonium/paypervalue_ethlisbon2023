require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config(); // Make sure you have installed the dotenv package.

// Retrieve environment variables
const { CURRENTCHAIN, PRIVATE_KEY, CHAINID } = process.env;

module.exports = {
    solidity: "0.8.4",
    paths: {
        sources: "./contracts",
        tests: "./test",
        cache: "./cache",
        artifacts: "./artifacts"
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY, // make sure to have your Etherscan API key in your .env file
      },
    networks: {
        hardhat: {
            // Configuration for the local network
        },
        networkCurrent: {
            url: process.env.CURRENTCHAIN,
            accounts: [`${PRIVATE_KEY}`],
            chainId: CHAINID
        },
        // Add other network configurations here if needed
    }
};
