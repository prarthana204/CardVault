# CardVault
Stores and reveals on chain
# 🎴 CardVault – Blockchain Digital Collectible Cards
<img width="1906" height="1065" alt="Screenshot 2025-10-29 142415" src="https://github.com/user-attachments/assets/ff0f01af-dc0b-43a9-8aea-b1c0a197b393" />

**CardVault** is a beginner-friendly Solidity smart contract project that lets users **mint**, **store**, and **reveal** digital collectible cards using blockchain-based randomness.

---

## 🚀 Overview

CardVault lets anyone create their own **digital mystery cards** on the Ethereum blockchain.

- 🃏 Each card starts as **hidden** when minted.  
- 🎲 When revealed, it gets a **random number** between 0–99.  
- 💎 You can view your collection anytime and see which cards you’ve revealed.

This project is designed for **beginners learning Solidity** — it covers structs, mappings, events, and simple randomness.

---

## 🧱 Smart Contract Code

### File: `CardVault.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CardVault {
    struct Card {
        uint256 id;
        bool revealed;
        uint256 randomValue;
    }

    mapping(address => Card[]) public userCards;
    uint256 private nextCardId = 1;

    event CardMinted(address indexed user, uint256 cardId);
    event CardRevealed(address indexed user, uint256 cardId, uint256 randomValue);

    function mintCard() public {
        userCards[msg.sender].push(Card({
            id: nextCardId,
            revealed: false,
            randomValue:

