// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import './ZombieAttack.sol';
import 'erc721.sol';

/// @title Um contrato que gerencia a transferência de propriedade do zumbi
/// @author Herisson Silva
/// @dev Em conformidade com a implementação do rascunho de especificação ERC721 do OpenZeppelin
contract ZombieOwnership is ZombieBattle, ERC721 {

  mapping(uint => address) zombieApprovals;

  function balanceOf(address _owner) external view returns (uint _balance) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint _tokenId) external view returns (address _owner) {
    return zombieToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint _tokenId) private {
    ownerZombieCount[msg.sender] = ownerZombieCount[msg.sender].sub(1);
    ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
    zombieToOwner[_tokenId] = _to;
    Transfer(_from, _to, _tokenId);
  }

  function transfer(address _to, uint _tokenId) external onlyOwnerOf(_tokenId) {
    _transfer(msg.sender, _to, _tokenId);
  }

  function approve(address _to, uint _tokenId) external onlyOwnerOf(_tokenId) {
    zombieApprovals[_tokenId] = _to;
    Approval(msg.sender, _to, _tokenId);
  }

  function takeOwnership(uint _tokenId) external {
    require(zombieApprovals[_tokenId] == msg.sender);
    address owner = ownerOf(_tokenId);
    _transfer(owner, msg.sender, _tokenId);
  }

}