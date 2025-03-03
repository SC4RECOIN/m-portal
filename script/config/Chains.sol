// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

import { CAIP2 } from "./CAIP2.sol";

/// @notice EVM, SVM and Wormhole chain Ids
/// @dev    https://wormhole.com/docs/build/reference/chain-ids/
library Chains {
    using CAIP2 for string;

    error UnsupportedChain(uint256 chainId);
    error UnsupportedCAIP2(string chain);

    /*****************************************************************/
    /*                       EVM CHAIN IDs                           */
    /*****************************************************************/

    // Mainnet
    uint256 internal constant ETHEREUM = 1;
    uint256 internal constant OPTIMISM = 10;
    uint256 internal constant ARBITRUM = 42161;

    // Testnet
    uint256 internal constant ETHEREUM_SEPOLIA = 11155111;
    uint256 internal constant OPTIMISM_SEPOLIA = 11155420;
    uint256 internal constant ARBITRUM_SEPOLIA = 421614;

    /*****************************************************************/
    /*                       SVM CHAIN IDs                           */
    /*****************************************************************/

    // Mainnet
    string internal constant SOLANA = "solana:5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp";

    // Devnet
    string internal constant SOLANA_DEVNET = "solana:EtWTRABZaYq6iMfeYKouRu166VU2xqa1wcaWoxPkrZBG";

    /*****************************************************************/
    /*                     WORMHOLE CHAIN IDs                        */
    /*****************************************************************/

    // Mainnet
    uint16 internal constant WORMHOLE_ETHEREUM = 2;
    uint16 internal constant WORMHOLE_OPTIMISM = 24;
    uint16 internal constant WORMHOLE_ARBITRUM = 23;
    uint16 internal constant WORMHOLE_SOLANA = 1;

    // Testnet
    uint16 internal constant WORMHOLE_ETHEREUM_SEPOLIA = 10002;
    uint16 internal constant WORMHOLE_OPTIMISM_SEPOLIA = 10005;
    uint16 internal constant WORMHOLE_ARBITRUM_SEPOLIA = 10003;

    function isHub(uint256 chainId_) internal pure returns (bool) {
        return chainId_ == ETHEREUM || chainId_ == ETHEREUM_SEPOLIA;
    }
}
