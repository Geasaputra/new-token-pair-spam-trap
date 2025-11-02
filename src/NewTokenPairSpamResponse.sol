// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NewTokenPairSpamResponse {
    event ResponseTriggered(uint256 currentPairCount);

    function handleResponse(uint256 currentPairCount) external {
        emit ResponseTriggered(currentPairCount);
    }
}
