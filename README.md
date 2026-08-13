# BP20-token
A Solidity-based fungible token implementation built to explore the mechanics behind BP20 that also applies to the  ERC-20-style tokens

## Overview

BP20 was built as a learning project while studying Solidity and smart contract development.

The goal was not to create a production-ready token, but to understand what actually happens inside a token contract when users:

- hold tokens
- transfer tokens
- approve another address to spend on their behalf
- transfer tokens through an approved allowance
- interact with token balances and supply

Rather than relying entirely on an existing token library, I wanted to implement these mechanics myself and understand how they work at the contract level.

## What I Built

The contract implements the core functionality required for a basic fungible token:

- Token name and symbol
- Token decimals
- Total supply
- Balance tracking
- Token transfers
- Spending allowances
- Token approvals
- `transferFrom()` functionality
- `Transfer` events
- `Approval` events

The initial token supply is assigned to the address that deploys the contract.

## How It Works

### Balances

Each address has a token balance stored in the contract.

```solidity
mapping(address => uint256) public balances;
