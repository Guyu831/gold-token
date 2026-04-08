// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title GoldToken
 * @notice Each token represents a fractional claim on 1 gram of
 *         allocated gold held in a regulated vault.
 *         Mint: only after physical gold is deposited and verified.
 *         Burn: triggered when the holder redeems for physical gold
 *               or an approved cash equivalent.
 */
contract GoldToken is ERC20, Ownable {

    event GoldDeposited(address indexed recipient, uint256 grams);
    event GoldRedeemed(address indexed redeemer, uint256 grams);

    constructor(address initialOwner)
        ERC20("Gold Token", "XAUT1G")
        Ownable(initialOwner)
    {}

    /**
     * @notice Mint tokens after physical gold has been
     *         deposited and verified by the custodian.
     */
    function mintOnDeposit(address to, uint256 grams) external onlyOwner {
        require(grams > 0, "Grams must be > 0");
        _mint(to, grams * 10 ** decimals());
        emit GoldDeposited(to, grams);
    }

    /**
     * @notice Burn tokens when the holder redeems physical gold
     *         or an approved cash equivalent.
     */
    function redeemGold(uint256 grams) external {
        require(grams > 0, "Grams must be > 0");
        uint256 amount = grams * 10 ** decimals();
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        emit GoldRedeemed(msg.sender, grams);
    }

    /**
     * @notice Owner can force-burn for regulatory compliance.
     */
    function adminBurn(address account, uint256 grams) external onlyOwner {
        _burn(account, grams * 10 ** decimals());
    }
}
