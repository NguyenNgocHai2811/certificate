const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Certificate", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployCertificateFixture() {

    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const Certificate = await ethers.getContractFactory("Certificate");
    const certificate = await Certificate.deploy(owner.address);

    return { certificate, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      const { certificate, owner } = await loadFixture(deployCertificateFixture);

      expect(await certificate.owner()).to.equal(owner.address);
    });
  });

  describe("Minting", function () {
    it("Should mint a new certificate", async function () {
      const { certificate, owner, otherAccount } = await loadFixture(
        deployCertificateFixture
      );

      await certificate.safeMint(otherAccount.address, "http://example.com");
      expect(await certificate.ownerOf(0)).to.equal(otherAccount.address);
    });
  });
});
