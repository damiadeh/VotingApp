pragma solidity ^0.5.0;
//declare a contract
contract Election {
    //Store Candidate
    //Read Candidate
    string public candidate;
    //Constructor should be sme name as contract
    constructor () public {
        candidate = "Ambode";
    } 
}