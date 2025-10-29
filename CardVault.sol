// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CardVault {
    // Structure to represent a collectible card
    struct Card {
        uint256 id;
        bool revealed;
        uint256 randomValue;
    }

    // Mapping from user address to their list of cards
    mapping(address => Card[]) public userCards;

    // Counter to assign unique IDs to cards
    uint256 private nextCardId = 1;

    // Event logs for blockchain explorers
    event CardMinted(address indexed user, uint256 cardId);
    event CardRevealed(address indexed user, uint256 cardId, uint256 randomValue);

    // Function to mint (create) a new hidden card
    function mintCard() public {
        userCards[msg.sender].push(Card({
            id: nextCardId,
            revealed: false,
            randomValue: 0
        }));

        emit CardMinted(msg.sender, nextCardId);
        nextCardId++;
    }

    // Function to reveal a card (assigns a random number)
    function revealCard(uint256 cardIndex) public {
        require(cardIndex < userCards[msg.sender].length, "Invalid card index");
        Card storage card = userCards[msg.sender][cardIndex];
        require(!card.revealed, "Card already revealed");

        // Simple pseudo-randomness (not secure, but fine for beginners)
        uint256 randomValue = uint256(keccak256(abi.encodePacked(
            block.timestamp,
            msg.sender,
            card.id
        ))) % 100; // random value from 0–99

        card.randomValue = randomValue;
        card.revealed = true;

        emit CardRevealed(msg.sender, card.id, randomValue);
    }

    // View function to see all your cards
    function getMyCards() public view returns (Card[] memory) {
        return userCards[msg.sender];
    }
}
