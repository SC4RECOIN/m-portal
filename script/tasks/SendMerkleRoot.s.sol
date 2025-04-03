// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

import { console } from "../../lib/forge-std/src/console.sol";

import { IHubPortal } from "../../src/interfaces/IHubPortal.sol";
import { TypeConverter } from "../../src/libs/TypeConverter.sol";

import { TaskBase } from "./TaskBase.sol";

contract SendMerkleRoot is TaskBase {
    using TypeConverter for address;

    function run() public {
        (, address portal_, , , , ) = _readDeployment(block.chainid);
        uint16 destinationChainId_ = 1;
        uint256 deliveryPrice_ = _quoteDeliveryPrice(portal_, destinationChainId_);
        address signer_ = vm.rememberKey(vm.envUint("PRIVATE_KEY"));

        vm.startBroadcast(signer_);

        IHubPortal(portal_).sendEarnersMerkleRoot{ value: deliveryPrice_ }(signer_.toBytes32());
        console.log("Merkle roots sent to:", destinationChainId_);

        vm.stopBroadcast();
    }
}
