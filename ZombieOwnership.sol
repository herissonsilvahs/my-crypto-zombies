pragma solidity ^0.6.0;

import './ZombieAttack.sol';
import 'erc721.sol';

contract ZombieOwnership is ZombieBattle, ERC721 {
  function balanceOf(address _owner) external view returns (uint _balance) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint _tokenId) external view returns (address _owner) {
    return zombieToOwner[_tokenId];
  }

  function transfer(address _to, uint _tokenId) external {}

  function approve(address _to, uint _tokenId) external {}

  function takeOwnership(uint _tokenId) external {}

}