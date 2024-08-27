// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Attack} from "../src/Attack.sol";
import {Game} from "../src/Game.sol";

contract AttackTester is Test {
    Game public gameContract;
    Attack public attackContract;

    // To save space, we're using bytes32 arrays
    bytes32 usernameBytes = "test";
    bytes32 passwordBytes = "password";

    function setUp() public {
        //Deploy the Game contract and sent 0.1 ether to it.
        gameContract = new Game{value: 0.5 ether}();
    }

    function test_attack() public {
        attackContract = new Attack(address(gameContract));

        attackContract.attack();

        assertEq(gameContract.getBalance(), 0.4 ether);
    }
}
