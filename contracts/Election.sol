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

}