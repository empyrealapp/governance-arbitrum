// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable2Step.sol";
import "./GovernanceVault.sol";
import "./interfaces/IGovernanceVault.sol";

contract GovernanceArbitrum is ERC20Burnable, Ownable2Step {
    IERC20 public constant arbitrum =
        IERC20(0x912CE59144191C1204E64559FE8253a0e49E6548);
    mapping(address => address) vaults;
    mapping(address => mapping(address => uint)) delegatedBalance;

    constructor() ERC20("Governance Arbitrum", "gARB") {}

    function create(address _vaultOwner) public returns (address _vault) {
        _vault = address(
            new GovernanceVault{salt: keccak256(abi.encodePacked(_vaultOwner))}(
                address(this)
            )
        );
        vaults[_vaultOwner] = _vault;
    }

    function getVault(address vaultOwner) public returns (address) {
        if (vaults[vaultOwner] == address(0)) {
            return vaults[vaultOwner];
        }
        return create(vaultOwner);
    }

    function deposit(uint amount) external {
        IGovernanceVault _vault = IGovernanceVault(getVault(msg.sender));
        arbitrum.transferFrom(msg.sender, address(_vault), amount);
        _mint(msg.sender, amount);
    }

    function withdraw(address vaultOwner, uint amount) external {
        burnFrom(msg.sender, amount);
        IGovernanceVault _vault = IGovernanceVault(getVault(vaultOwner));
        arbitrum.transferFrom(address(_vault), msg.sender, amount);
    }

    function delegate(address delegatee) external {
        IGovernanceVault _vault = IGovernanceVault(getVault(msg.sender));
        _vault.delegate(delegatee);
    }
}
