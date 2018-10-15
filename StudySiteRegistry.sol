pragma solidity ^0.4.16; //version of solidity ran

contract Admins{
    function isAdmin(address toCheck) public returns (bool);
}

contract StudySiteRegistry{

    struct StudySite{
        bool exists;
        uint numApprovals; //number of approvals for a location
        bool isOutside;
        string location; //3 words defining location
        string name;
        string environment;
        string resources;
        string description;
    }

    bool suggested;
    Admins public adminContract; //created member variable to access isAdmin fxn
    StudySite[] public studySites; // Listing study locations

    constructor (address adminContractAddress) public{
        adminContract = Admins(adminContractAddress);
    }

    function suggestLoc (string name, string description, bool isOutside, string location, string environment, string resources) public {
        studySites.push(StudySite(true, 0, isOutside, location, name, environment, resources, description));
    }

    function compareStrings (string toCheck1, string toCheck2) public returns (bool){
        return keccak256(abi.encodePacked(toCheck1)) == keccak256(abi.encodePacked(toCheck2));
    }

    function editLoc (uint index, string name, string description, string location) public {
        require(adminContract.isAdmin(msg.sender)); //requires admin rights
        studySites[index].name = name;
        studySites[index].description = description;
        studySites[index].location = location;
    }

    function remLoc(uint index) public{
        require(adminContract.isAdmin(msg.sender)); //requires admin rights
        studySites[index].exists = false;

    }

    function approveLoc(uint index) public{
        require(adminContract.isAdmin(msg.sender)); //requires admin rights
        if(studySites[index].numApprovals <= 2){
            studySites[index].numApprovals += 1;
        }
    }

    function getNumSites () public view returns (uint){
        return studySites.length;
    }


}
