# BP20-token
A Solidity-based fungible token implementation built to explore the mechanics behind BP20 that also applies to the  ERC-20-style tokens at thesame time. **NB: I will be updating comments ps: my comments feel like notes so feel free to ask questions if something is not clear**

## Overview

BP20-token "this Repo" was built as a learning project while studying Solidity and smart contract development, inspired by the BP20 standard and a peep at the erc-20 as well a blend of both worlds i can say, but to be fair they are very similar in implementation .

The goal was not to create a production-ready token, but to understand what actually happens inside a token contract when users:

- hold tokens
- transfer tokens
- approve another address to spend on their behalf
- transfer tokens through an approved allowance
- interact with token balances and supply

Rather than relying entirely on an existing token library, I wanted to implement these mechanics myself and understand how they work at the contract level, so feel free to use and implement as you please.

## What I Built

The contract implements the core functionality required for a basic fungible token:

- Token name and symbol that i named OJO because at the moment i am  working on a token system that bears that name.
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
