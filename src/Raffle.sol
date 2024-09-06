//SPDX-License-Modifier: MIT

pragma solidity ^0.8.16;

/**
 * @title Simple raffle contract
 * @author Razvan Mihailescu
 * @notice This contract is for create a simple raffle using Foundry
 * @dev Implements Chainlink VRF
 */

contract Raffle {
    /** Errors */
    error Raffle_SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        // for 0.8.26+
        // require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());
        if (msg.value <= i_entranceFee) {
            revert Raffle_SendMoreToEnterRaffle();
        }
    }

    function pickWinner() public {}

    /** Getter functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
