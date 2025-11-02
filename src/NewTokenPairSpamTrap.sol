// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/drosera-contracts/interfaces/ITrap.sol";

contract NewTokenPairSpamTrap is ITrap {
    uint256 public simulatedPairCount;

    function incrementSimulatedPairs(uint256 n) external {
        simulatedPairCount += n;
    }

    function collect() external view override returns (bytes memory) {
        return abi.encode(simulatedPairCount);
    }

    function shouldRespond(bytes[] calldata data) external pure override returns (bool, bytes memory) {
        if (data.length < 2) return (false, "");
        bytes calldata prevBytes = data[data.length - 2];
        bytes calldata currBytes = data[data.length - 1];

        uint256 prev;
        uint256 curr;

        if (prevBytes.length == 32) {
            assembly {
                prev := calldataload(add(prevBytes.offset, 0))
            }
        }
        if (currBytes.length == 32) {
            assembly {
                curr := calldataload(add(currBytes.offset, 0))
            }
        }

        bool trigger = curr > prev + 5;
        return (trigger, "");
    }

    // Dummy metadata() to satisfy any unexpected Drosera eth_call
    function metadata() external pure returns (string memory) {
        return "NewTokenPairSpamTrap";
    }
}
