// Author: Shawn Ge
// Other contributors: Brooks Boyd

pragma solidity ^0.4.16; //version of solidity ran

contract Admins{
    mapping(address => bool) admins; // Listing of accounts that are administrators
    uint public numAdmins; // Number of administrators

    constructor() public{
        admins[msg.sender] = true;
        numAdmins++;
    }

    function isAdmin(address toCheck) public view returns (bool){
        return admins[toCheck];
    }

    function addAdmin(address toAdd) public{
      require(isAdmin(msg.sender));
      admins[toAdd] = true;
      numAdmins++;
    }

    function remAdmin(address toRemove) public{
        require(isAdmin(msg.sender));
        admins[toRemove] = false;
        numAdmins--;
    }
}
