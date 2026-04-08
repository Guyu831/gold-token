# Gold Token (XAUT1G)

A fungible token representing fractional claims on vaulted physical gold.

## Overview
Each token represents a claim on **1 gram** of allocated gold
held in a regulated vault. The design follows a reserve-backed
mint-and-burn model.

## Token Details
| Property | Value |
|----------|-------|
| Name | Gold Token |
| Symbol | XAUT1G |
| Standard | ERC-20 |
| Network | Sepolia Testnet |
| 1 Token = | 1 gram of gold |

## Contract Address
`0x...` *(update after deployment)*

## Key Functions
- `mintOnDeposit` — Custodian mints tokens after gold deposit is verified
- `redeemGold` — Holder burns tokens to redeem physical gold
- `adminBurn` — Owner burns tokens for compliance purposes

## Deployment
Deployed on Sepolia testnet via Remix IDE.
View on Etherscan: [sepolia.etherscan.io](https://sepolia.etherscan.io/address/0x)
