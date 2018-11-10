var StarNotary = artifacts.require("StarNotary");
module.exports = function(deployer) {
    deployer.deploy(StarNotary).then(() => console.log("contract address: ", StarNotary.address));
};