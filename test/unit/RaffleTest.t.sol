// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {DeployRaffle} from "../../script/DeployRaffle.s.sol";
import {Raffle} from "../../src/Raffle.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";

contract RaffleTest {
    Raffle public raffle;
    HelperConfig public helperConfig;

    address public player = makeAddr("player");
    uint256 public constant STARTING_PLAYER_BALANCE = 10 ether;

    function run() {
        DeployRaffle deployRaffle = new DeployRaffle();
        (raffle, HelperConfig) = deployRaffle.run();

        vm.deal(player, STARTING_PLAYER_BALANCE);
    }

    function testRaffleRevertsWhenYouDontPayEnoughEth() {
        vm.prank(player);
        assertRevert();
        raffle.enterRaffle{value: 0.1 ether}();
    }
}
