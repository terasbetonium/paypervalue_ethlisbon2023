
// This is a mock verification script for Etherscan.
// To use it, you will need to set up your API key and the contract address.
const { run } = require("hardhat");

async function main() {
    await run("verify:verify", {
        address: "0xb4003285B2FF594eBdb4Bf8045D4E3C16E00dC58",
        constructorArguments: [],
    });
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
