const ZombieFactory = artifacts.require("ZombieFactory");

contract('ZombieFactory', function(accounts) {
  beforeEach(async () => {
    contract = await ZombieFactory.new()
  })

  it('create new zombie', async () => {
    await contract.createRandomZombie("Seu Ze");
    // const zombies = await contract.ownerZombieCount;
    // console.log('zombies: ', zombies)
    assert(true);
  })
})
