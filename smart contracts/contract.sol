// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract EvidenceManagement {
    enum Sensitivity { Low, High }

    struct Evidence {
        uint caseNumber;
        Sensitivity sensitivity;
        address uploader;
        bool flagged;
    }

    mapping(uint => Evidence[]) public evidences;
    mapping(address => mapping(uint => bool)) public accessRequests;

    address[] public policeList;
    address[] public judgeList;
    address[] public regulatorList;


    modifier onlyPolice {
        // Implement logic to check if the sender is a police officer
        _;
    }

    modifier onlyCourt {
        // Implement logic to check if the sender is the court
        _;
    }

    modifier onlyRegulator {
        // Implement logic to check if the sender is a regulator
        _;
    }

    function uploadEvidence(uint _caseNumber, Sensitivity _sensitivity) public onlyPolice {
        evidences[_caseNumber] = Evidence(_caseNumber, _sensitivity, msg.sender, false);
    }

    function requestAccess(uint _caseNumber) public {
        accessRequests[msg.sender][_caseNumber] = true;
    }

    function grantAccess(uint _caseNumber) public onlyCourt {
        // Implement logic to grant access to evidence
    }

    function flagEvidence(uint _caseNumber) public onlyRegulator {
        evidences[_caseNumber].flagged = true;
    }

    // Other functions for viewing and managing evidences...
}