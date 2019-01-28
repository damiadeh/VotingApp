pragma solidity ^0.5.0;
//declare a contract
contract Election {
//JUST STORE THE CANDIDATE ONLY...HARdCODED
    //Store Candidate
    //Read Candidate
    // string public candidate;
    // //Constructor should be sme name as contract
    // constructor () public {
    //     candidate = "Ambode";
    // } 
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    ///Model a candidate
    //store accounts that has voted
    mapping(address => bool) public voters;
    ///store a candidate
    ///Fetch Candidate
    mapping(uint => Candidate) public candidates;
    ///Store candidates counts
    uint public candidatesCount;

    constructor () public {
       addCandidate("Agbaje");
       addCandidate("Sanwo-Olu");
    }

    ///Adding Candidate to mapping
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public{
        //ensure address has not voted before
        require(!voters[msg.sender]);
        //ensure a valid candidate is being voted for
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true;

        //update candidate voteCOunt
        candidates[_candidateId].voteCount++;
    }

}