pragma solidity ^0.4.16; //version of solidity ran 

contract ReviewRegistry{

	struct Review{
		address reviewer;
		uint studySite;
		uint noiseLevel;
		uint busyLevel;
		string comments;
		uint timeStamp;
		bool exists;
	}

	Review[] public feedback;
	
	function addReview(uint studySite, uint noise, uint busy, string comments) public{
		feedback.push(Review(msg.sender, studySite, noise, busy, comments, block.timestamp, true)); //adding review to reviews array
	}
	
	function remReview(address reviewer) public {
		//finding the review that needs to be removed
		for(uint i = 0; i < feedback.length; i++){
			if(feedback[i].reviewer == reviewer){
				feedback[i].exists = false;
				break;
			}
		}
	}
	
	
}