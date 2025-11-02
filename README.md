<<<<<<< HEAD
# new-token-pair-spam-trap
=======
# Drosera Trap Foundry Template
=======
# New Token Pair Spam Trap
>>>>>>> 59d8b61 (Initial commit: New Token Pair Spam Trap (Simulated Data Template))

This project implements a **Simulated Data Template** trap for the Drosera Network.

### Overview

The `NewTokenPairSpamTrap` monitors for a sudden increase in token pair creation — which can indicate spam or automated liquidity attacks.

Because Hoodi testnet lacks reliable DEX deployments, this trap simulates the pair count internally.

### How It Works

- The trap has an internal variable `simulatedPairCount`.
- You can manually change this value via `incrementSimulatedPairs(uint256 n)` to simulate activity.
- `collect()` encodes the current count.
- `shouldRespond()` compares the two most recent values and triggers if the difference exceeds 5.
- The response contract emits an event when triggered.

### Simulation Pattern

This trap follows Drosera’s **Simulated Data Template** rules:
- No external dApp calls.
- Uses internal state to simulate external data.
- Deterministic `shouldRespond()` logic for testability.

### Deployment

- **Trap:** `0xa98663ff5Bf9c2F414E4aC50B4661c02080cb34D`
- **Response:** `0x4eFBddb0ef142124fcfe2D2BCD6d0Ae4eE3847B6`
- **Network:** Hoodi Testnet (`https://rpc.hoodi.ethpandaops.io`)

### Testing

<<<<<<< HEAD
### Hello World Trap

The drosera.toml file is configured to deploy a simple "Hello, World!" trap. Ensure the drosera.toml file is set to the following configuration:

```toml
response_contract = "0xdA890040Af0533D98B9F5f8FE3537720ABf83B0C"
response_function = "helloworld(string)"
```

To deploy the trap, run the following commands:

```bash
# Compile the Trap
forge build

# Deploy the Trap
DROSERA_PRIVATE_KEY=0x.. drosera apply
```

After successfully deploying the trap, the CLI will add an `address` field to the `drosera.toml` file.

Congratulations! You have successfully deployed your first trap!

### Response Trap

You can then update the trap by changing its logic and recompling it or changing the path field in the `drosera.toml` file to point to the Response Trap.

The Response Trap is designed to trigger a response at a specific block number. To test the Response Trap, pick a future block number and update the Response Trap.
Specify a response contract address and function signature in the drosera.toml file to the following:

```toml
response_contract = "0x183D78491555cb69B68d2354F7373cc2632508C7"
response_function = "responseCallback(uint256)"
```

Finally, deploy the Response Trap by running the following commands:

```bash
# Compile the Trap
forge build

# Deploy the Trap
DROSERA_PRIVATE_KEY=0x.. drosera apply
```

> Note: The `DROSERA_PRIVATE_KEY` environment variable can be used to deploy traps. You can also set it in the drosera.toml file as `private_key = "0x.."`.


### Transfer Event Trap
The TransferEventTrap is an example of how a Trap can parse event logs from a block and respond to a specific ERC-20 token transfer events.

To deploy the Transfer Event Trap, uncomment the `transfer_event_trap` section in the `drosera.toml` file. Add the token address to the `tokenAddress` constant in the `TransferEventTrap.sol` file and then deploy the trap.

## Testing

Example tests are included in the `tests` directory. They simulate how Drosera Operators execute traps and determine if a response should be triggered. To run the tests, execute the following command:

```bash
forge test
```
>>>>>>> 58648cd (chore: init from https://github.com/drosera-network/trap-foundry-template at c4bc7e3)
=======
You can simulate spam by running:
```solidity
trap.incrementSimulatedPairs(10);
>>>>>>> 59d8b61 (Initial commit: New Token Pair Spam Trap (Simulated Data Template))
