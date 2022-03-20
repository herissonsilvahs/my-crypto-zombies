// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

interface ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);
  event ApprovalForAll(address owner, address operator, bool approved);

  function balanceOf(address _owner) external view returns (uint256 _balance);
  function ownerOf(uint256 _tokenId) external view returns (address _owner);
  function safeTransferFrom(address from, address to, uint256 tokenId) external;
  function setApprovalForAll(address operator, bool _approved) external;
  function transfer(address _to, uint256 _tokenId) external;
  function approve(address _to, uint256 _tokenId) external;
  function takeOwnership(uint256 _tokenId) external;
}
