// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./ownable.sol";
import 'safemath.sol';

contract ZombieFactory is Ownable {
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    using SafeMath for uint256;
    using SafeMath32 for uint32;
    using SafeMath16 for uint16;

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;
    uint coolDownTime = 1 days;

    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
    }

    Zombie[] public zombies;

    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) ownerZombieCount;

    function _createZombie(string _name, uint256 _dna) internal {
        uint256 id = zombies.push(Zombie(_name, _dna, 1, uint32(now + coolDownTime), 0, 0)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender] = ownerZombieCount[msg.sender].add(1);
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint256) {
        uint256 rand = uint256(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
