// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title StakingVault
 * @dev Professional implementation of a tokenized vault.
 */
contract StakingVault is ERC4626, Ownable {
    /**
     * @param asset The underlying token address
     * @param name The name of the vault share token
     * @param symbol The symbol of the vault share token
     */
    constructor(
        IERC20 asset,
        string memory name,
        string memory symbol
    ) ERC4626(asset) ERC20(name, symbol) Ownable(msg.sender) {}

    /**
     * @dev Function to distribute rewards to the vault. 
     * Increases the value of all existing shares.
     * @param amount Amount of underlying assets to add.
     */
    function distributeRewards(uint256 amount) external onlyOwner {
        SafeERC20.safeTransferFrom(IERC20(asset()), msg.sender, address(this), amount);
        // No new shares are minted, increasing the price per share.
    }

    /**
     * @dev Override to ensure decimals match underlying asset.
     */
    function decimals() public view virtual override(ERC4626, ERC20) returns (uint8) {
        return super.decimals();
    }
}
