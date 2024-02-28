// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import SafeMath library from OpenZeppelin for safe arithmetic operations.
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract LockTime {
    // Enable SafeMath operations for uint256 type.
    using SafeMath for uint;

    // Mapping to track the balances of addresses.
    mapping(address => uint)  balances;
    // Mapping to track the lock time of addresses.
    mapping (address => uint) lockTime;

    // Function to deposit Ether into the contract.
    function deposit() external payable {
        // Increment the sender's balance by the amount of Ether sent with the transaction.
        balances[msg.sender] = balances[msg.sender].add(msg.value);
        // Set the lock time for the sender to 10 seconds from the current block timestamp.
        lockTime[msg.sender] = block.timestamp + 10 seconds;
    }

    // Function to increase the lock time for the sender's balance.
    function increaseLockTime(uint _secondsToIncrease) public {
        // Safely add the specified number of seconds to the sender's current lock time.
        lockTime[msg.sender] = lockTime[msg.sender].add(_secondsToIncrease);
    }

    // Function to withdraw the sender's balance from the contract.
    function withdraw() public {
        // Ensure the sender has a balance to withdraw.
        require(balances[msg.sender] > 0, "Insufficient funds");
        // Ensure the current block timestamp is greater than the sender's lock time.
        require(block.timestamp > lockTime[msg.sender], "Lock time has not expired");

        // Store the sender's balance in a local variable.
        uint amount = balances[msg.sender];
        // Reset the sender's balance to 0.
        balances[msg.sender] = 0;
        // Attempt to send the stored amount of Ether back to the sender.
        (bool sent,) = msg.sender.call{value: amount}("");
        // Ensure the Ether was successfully sent.
        require(sent, "Failed to send Ether");
    }
}
