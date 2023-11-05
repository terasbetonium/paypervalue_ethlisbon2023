const hre = require("hardhat");

async function main() {
  const deployedContractAddress = "0xBC65FBd316E689D349161edC8dBd4A9B7732a72B";
  const publisherAddress = "0xb212247b13334360b4cD5c9b7668b06Feae23107";
  const advertiserAddress = "0x69E56966FFa71E6c23FED998747f660Ad82cA31e";

  try {
    await hre.run("verify:verify", {
      address: deployedContractAddress,
      constructorArguments: [
        publisherAddress,
        advertiserAddress,
      ],
    });
    console.log(`Verification process initiated for contract at ${deployedContractAddress}`);
  } catch (error) {
    console.error("Failed to verify contract:", error);
    process.exit(1);
  }
}

main();
