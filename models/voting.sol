// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    enum VotingStatus{NotStarted, Started, Ended}
    VotingStatus public status;

    address public owner;
    constructor() {
        owner = msg.sender;
        status = VotingStatus.NotStarted;
    }

    //struct
    struct Candidate{
        uint id; string name; uint voteCount;
    }

    // Storage
    mapping (uint => Candidate) public candidates;
    mapping (address => bool) public hasVoted;
    uint public candidateCount;

    // event
    event CandidateAdd(uint id, string name);
    event Voted(address voter, uint candidateId);

    // modifier
    modifier onlyOwner(){
        require(msg.sender == owner, " owner is allowed");
        _;
    }
    modifier votingActive(){
        require(status == VotingStatus.Started,"Voting is not Active");
        _;
    }

    // Add candidates
    function addCandidate(string memory _name) public onlyOwner{
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
        emit CandidateAdd(candidateCount, _name);
    }

    // start voting
    function startVoting() public onlyOwner{
        status = VotingStatus.Started;
    }
    // end voting
    function endVoting() public onlyOwner{
        status = VotingStatus.Ended;
    }

    // voting Function
    function vote(uint _candidateId) public votingActive{
        require(!hasVoted[msg.sender]," Already voted");
        require(_candidateId >0 && _candidateId <= candidateCount,' invalid Candidate');
        
        candidates[_candidateId].voteCount++;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, _candidateId);
    }

    // Result
    function getWinner() public view returns(string memory winnerName){
        require(status == VotingStatus.Ended, "Voting is still inprocess");
        uint maxVotes = 0;
        uint winnerId = 0;

        for (uint i=1; i<=candidateCount; i++){
            if (candidates[i].voteCount > maxVotes){
                maxVotes = candidates[i].voteCount;
                winnerId = i;
            }
        }
        return candidates[winnerId].name;
    }
}