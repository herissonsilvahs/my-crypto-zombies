const Ownable = artifacts.require("Ownable");
const SafeMath = artifacts.require("SafeMath");
const ZombieFactory = artifacts.require("ZombieFactory");
const ZombieFeeding = artifacts.require("ZombieFeeding");
const ZombieHelper = artifacts.require("ZombieHelper");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(SafeMath);
  deployer.deploy(ZombieFactory);
  deployer.deploy(ZombieFeeding);
  deployer.deploy(ZombieHelper);
};
