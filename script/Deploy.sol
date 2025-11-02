// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/NewTokenPairSpamTrap.sol";
import "../src/NewTokenPairSpamResponse.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        NewTokenPairSpamTrap trap = new NewTokenPairSpamTrap();
        NewTokenPairSpamResponse response = new NewTokenPairSpamResponse();

        console.log("Trap deployed at:", address(trap));
        console.log("Response deployed at:", address(response));

        vm.stopBroadcast();
    }
}
