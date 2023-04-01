# Governance Arbitrum

This project demonstrates how a token could be created that wraps arbitrum into individual `Vaults` for each user, but has a liquid ERC20 token that can be used for staking and governance.  A user will be able to `deposit` in the vault, creating a separate `Vault` smart contract that wraps their deposited Arbitrum.

They will be able to `withdraw` their `gARB` at any point in time for the original Arbitrum.  So it is a one-to-one backed ERC20 token that enables users to delegate their funds but still trade a liquidi token.


# Considerations

If a user creates a vault, only that user will be able to redeem those funds.  It might be convenient to create a way for users that have received gARB but have no vault to redeem their Arbitrum.   Potentially there could be a seeded stablepool with ARB/gARB to create liquidity for this, but we are open to additional proposals.
