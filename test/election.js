var Election = artifacts.require("./Election.sol");

///declare a contract

contract ("Election" , function(accounts){
    var electionInstance;
    //test that our contract was initialize with the correct no of candidate
    it("initializes with two candidates", function() {
        return Election.deployed().then(function(instance) {
            return instance.candidatesCount();
        }).then(function(count) {
            assert.equal(count, 2);
        });
    });

    //test that it initializes the candidates with correct values
    it("Candidate should be initialized with the correct values", function(){
        return Election.deployed().then(function(instance) {
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate[0], 1, "contains the correct id");
            assert.equal(candidate[1], "Agbaje", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct vote count");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0], 2, "contains the correct id");
            assert.equal(candidate[1], "Sanwo-Olu", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct vote count");
        });
    });
});