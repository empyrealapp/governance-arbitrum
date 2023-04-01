# Governance Arbitrum

This project demonstrates how a token could be created that wraps arbitrum into individual `GovernanceVault` for each user, but has a liquid ERC20 token that can be used for staking and governance.  A user will be able to `deposit` in the vault, creating a separate `GovernanceVault` smart contract that wraps their deposited Arbitrum.

They will be able to `withdraw` their `gARB` at any point in time for the original Arbitrum.  So it is a one-to-one backed ERC20 token that enables users to delegate their funds but still trade a liquidi token.


# Contract Management

The contract could be managed by a multisig that is a quorum of community members and placing the main contract behind a `TransparentUpgradeableProxy`.   This will allow adjustments to handle future modifications to the Arbitrum Governance process.

Also, by creating a `UpgradeableBeacon` for all vaults, they will also be able to be upgraded with a single transaction.


# Addititional Considerations

If a user creates a vault, only that user will be able to redeem those funds.  It might be convenient to create a way for users that have received gARB but have no vault to redeem their Arbitrum.   Potentially there could be a seeded stablepool with ARB/gARB to create liquidity for this, but we are open to additional proposals.
