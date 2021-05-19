// const Migrations = artifacts.require("Migrations");

// module.exports = function (deployer) {
//   deployer.deploy(Migrations);
// };

const BEPToken = artifacts.require("BEPToken");
const CrowdsaleExample = artifacts.require("CrowdsaleExample");
const CrowdsaleBEP20 = artifacts.require("CrowdsaleBEP20");

module.exports = async function (deployer, network, accounts) {
  // await deployer.deploy(
  //   BEPToken,
  //   "Torum Test",
  //   "TRM",
  //   "21000000000000000000000"
  // );
  // const token = await BEPToken.deployed();

  // await deployer.deploy(
  //   CrowdsaleExample,
  //   1,
  //   accounts[0],
  //   token.address,
  //   1621370712,
  //   1621628664
  // );
  // const crowdsaleExample = await CrowdsaleExample.deployed();

  // await deployer.deploy(
  //   CrowdsaleBEP20,
  //   1,
  //   accounts[0],
  //   token.address,
  //   1621370712,
  //   1621628664
  // );
  // const crowdsaleBEP20 = await CrowdsaleBEP20.deployed();

  const token = await BEPToken.at("0x883588a9cd74497c314cb8604c57d416d7cf1dbd");

  const crowdsaleExample = await CrowdsaleExample.at(
    "0x8aBFa6caDeaf9C1F9F2167fDA4073D81A6d4f020"
  );

  const crowdsaleBEP20 = await CrowdsaleBEP20.at(
    "0xca84f4da475f77994eba11492a29f8a5e66727d3"
  );

  token.transfer(crowdsaleExample.address, 10000000000000000000);
  token.transfer(crowdsaleBEP20.address, 10000000000000000000);

  // deployedToken.transfer(accounts[0], await deployedToken.totalSupply());
};
