// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Objective

/**
Features:
1. Add Candidates data : { Name, Age , isQualified ,  }
2. Vote Candidate
3. Get Total number of students
**/
contract INEC {
    struct Candidate{
        string name;
        string politicalParty;
        bool isQualified;
        string aka;
        uint noOfVote;

    }
    uint totalNumberOfCandidate;
    mapping(string => Candidate) public candidate;


     function RegisterCandidate(string memory _name, string memory _Party, string memory _aka, bool _isQualified)public{
            Candidate storage newCandidate = candidate[_aka];
            newCandidate.name = _name;
            newCandidate.politicalParty=_Party;
            newCandidate.isQualified = _isQualified;
            newCandidate.aka=_aka;
            totalNumberOfCandidate += 1;
        }

    function VoteCandidate(string memory _aka)public{
        Candidate storage newCandidate = candidate[_aka];
        newCandidate.noOfVote += 1; 
       
        
    }

    function getTotalNumberOfVotes(string memory _aka ) public view returns (uint){ return candidate[_aka].noOfVote;}
      function getTotalNumberofCandidates()public view returns (uint) {return totalNumberOfCandidate;}


    
}

