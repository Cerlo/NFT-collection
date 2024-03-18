import { ethers } from "hardhat";

async function main() {
  const merkleRoot = "0x123456"; // Remplacez par votre valeur réelle

  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const NFTMerkleTree = await ethers.getContractFactory("NFTMerkleTree");
  const nftMerkleTree = await NFTMerkleTree.deploy(deployer,merkleRoot);

  await nftMerkleTree.waitForDeployment();

  console.log(
    `Contract is deployed deployed to ${nftMerkleTree.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
