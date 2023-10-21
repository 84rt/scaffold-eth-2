// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import "./LoanLibrary.sol";

contract LoanCore {
    using LoanLibrary for LoanLibrary.Borrower;
    using LoanLibrary for LoanLibrary.Lender;

    uint256 public constant MAX_LOAN_AMOUNT = 10000;
    uint256 public constant DEFAULT_INTEREST_RATE = 15;

    modifier lessThanMaxAmount(uint256 requestedLoanAmount) {
        require(requestedLoanAmount <= MAX_LOAN_AMOUNT, "Requested loan amount is less than 10,000");
        _;
    }

    constructor() {}

    event LoanRequested(address borrower, uint256 amount);
    
    function requestLoan(uint256 amount) public lessThanMaxAmount(amount) {
        emit LoanRequested(msg.sender, amount);
    }
}
