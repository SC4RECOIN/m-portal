pragma solidity 0.8.26;

/**
 * @dev Helper library to format and parse CAIP-2 identifiers
 *
 * https://github.com/ChainAgnostic/CAIPs/blob/main/CAIPs/caip-2.md[CAIP-2] defines chain identifiers as:
 * chain_id:    namespace + ":" + reference
 */
library CAIP2 {
    /// @dev Return the CAIP-2 identifier for a given namespace and reference.
    function format(string memory namespace, string memory ref) internal pure returns (string memory) {
        return string.concat(namespace, ":", ref);
    }

    /// @dev Compare two CAIP-2 identifiers.
    function equals(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    /// @dev Parse a CAIP-2 identifier into its namespace and reference parts.
    function parse(string memory input) public pure returns (string memory namespace, string memory chainReference) {
        bytes memory inputBytes = bytes(input);
        uint256 delimiterIndex;

        // Find the position of ':'
        for (uint256 i = 0; i < inputBytes.length; i++) {
            if (inputBytes[i] == ":") {
                delimiterIndex = i;
                break;
            }
        }

        // Create temporary bytes for both parts
        bytes memory firstPart = new bytes(delimiterIndex);
        bytes memory secondPart = new bytes(inputBytes.length - delimiterIndex - 1);

        // Copy first part
        for (uint256 i = 0; i < delimiterIndex; i++) {
            firstPart[i] = inputBytes[i];
        }

        // Copy second part
        for (uint256 i = delimiterIndex + 1; i < inputBytes.length; i++) {
            secondPart[i - delimiterIndex - 1] = inputBytes[i];
        }

        return (string(firstPart), string(secondPart));
    }
}
