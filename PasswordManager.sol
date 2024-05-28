pragma solidity >=0.7.0 <0.9.0;

// SPDX-License-Identifier: GPL-3.0
contract BlockchainPassword {
  address private owner;
  string private testPhrase;

  struct Login {
    string name;
    string username;
    string password;
  }

  mapping (uint => Login) private logins;
  uint private numLogins;

  // Constructor
  constructor(string memory encryptedTestPhrase) public {
    owner = msg.sender;
    numLogins = 0;
    testPhrase = encryptedTestPhrase;
  }

  function addLogin(string memory name, string memory username, string memory password) public returns (bool success) {
    if (msg.sender != owner) return false;
    logins[numLogins].name = name;
    logins[numLogins].username = username;
    logins[numLogins].password = password;
    numLogins++;
    return true;
  }

  function setLogin(uint index, string memory name, string memory username, string memory password) public returns (bool success) {
    if (msg.sender != owner) return false;

    Login storage login = logins[index];

    if (keccak256(abi.encodePacked(name)) != keccak256(abi.encodePacked(login.name))) {
      login.name = name;
    }

    if (keccak256(abi.encodePacked(username)) != keccak256(abi.encodePacked(login.username))) {
      login.username = username;
    }

    if (keccak256(abi.encodePacked(password)) != keccak256(abi.encodePacked(login.password))) {
      login.password = password;
    }

    return true;
  }

  function getLogin(uint id) public view returns (string memory name, string memory username, string memory password) {
    name = logins[id].name;
    username = logins[id].username;
    password = logins[id].password;
  }

  function getLogins() public view returns (string memory allLogins) {
    if (numLogins == 0) return '';

    uint totalLength = 0;
    for (uint i = 0; i < numLogins; i++) {
      totalLength = totalLength + bytes(logins[i].name).length + 1;
    }

    bytes memory result = new bytes(totalLength);
    uint counter = 0;
    for (uint i = 0; i < numLogins; i++) {
      bytes memory name = bytes(logins[i].name);
      for (uint x = 0; x < name.length; x++) {
        result[counter] = name[x];
        counter++;
      }

      if (i != (numLogins - 1)) {
        result[counter] = bytes1(',');
        counter++;
      }
    }

    return string(result);
  }

  function getTestPhrase() public view returns (string memory phrase) {
    return testPhrase;
  }

  function getOwner() public view returns (address ownerAddress) {
    return owner;
  }

  function kill() public {
    if (msg.sender == owner) selfdestruct(payable(owner));
  }
}
