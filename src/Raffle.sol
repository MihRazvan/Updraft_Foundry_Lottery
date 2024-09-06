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
    // @dev the duration of lottery in seconds
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;

    /** Events */
    event RaffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // for 0.8.26+
        // require(msg.value >= i_entranceFee, SendMoreToEnterRaffle());
        if (msg.value <= i_entranceFee) {
            revert Raffle_SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
        }
        // request and get chainlink VRF
    }

    /** Getter functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
