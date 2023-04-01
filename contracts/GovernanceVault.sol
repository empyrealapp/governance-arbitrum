// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "./interfaces/IDelegate.sol";

contract GovernanceVault {
    address public factory;
    IERC20 public constant arbitrum =
        IERC20(0x912CE59144191C1204E64559FE8253a0e49E6548);

    modifier onlyFactory() {
        require(msg.sender == factory);
        _;
    }

    constructor(address _factory) {
        factory = _factory;
        arbitrum.approve(_factory, type(uint).max);
    }

    function delegate(address _delegatee) external onlyFactory {
        IDelegate(address(arbitrum)).delegate(_delegatee);
    }
}
