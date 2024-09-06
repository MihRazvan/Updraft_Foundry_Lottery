//SPDX-License-Modifier: MIT

pragma solidity ^0.8.16;

/**
 * @title Simple raffle contract
 * @author Razvan Mihailescu
 * @notice This contract is for create a simple raffle using Foundry
 * @dev Implements Chainlink VRF
 */

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {}

    function pickWinner() public {}
}
