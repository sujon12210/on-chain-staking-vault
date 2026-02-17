# On-Chain Staking Vault (ERC-4626)

This repository provides a professional-grade implementation of a tokenized yield-bearing vault. It follows the ERC-4626 standard, ensuring compatibility with the broader DeFi ecosystem (e.g., Yearn, Morpho, Aave).

## Features
* **ERC-4626 Compliant:** Fully interoperable with any protocol supporting the yield-bearing vault standard.
* **Proportional Shares:** Automatically calculates share prices based on the ratio of underlying assets to total shares.
* **Secure Withdrawals:** Implements strict checks to prevent common vault-based exploits.

## Math
The vault operates on the fundamental share-to-asset formula:
$$shares = assets \times \frac{totalShares}{totalAssets}$$

## Usage
1. **Deposit:** Users provide underlying tokens and receive vault shares.
2. **Yield Generation:** External logic (or a rewards distributor) increases the underlying asset balance.
3. **Redeem:** Users burn shares to receive a proportional amount of the increased underlying assets.

## License
MIT
