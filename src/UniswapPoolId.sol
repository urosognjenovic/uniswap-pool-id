// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {PoolId, PoolKey, PoolIdLibrary} from "v4-core/types/PoolId.sol";
import {Currency} from "v4-core/types/Currency.sol";
import {IHooks} from "v4-core/interfaces/IHooks.sol";

contract UniswapPoolId {
    function getUniswapPoolId(
        address currency0,
        address currency1,
        uint24 fee,
        int24 tickSpacing,
        address hooks
    ) external pure returns (PoolId poolId) {
        poolId = PoolIdLibrary.toId(
            PoolKey(
                Currency.wrap(currency0),
                Currency.wrap(currency1),
                fee,
                tickSpacing,
                IHooks(hooks)
            )
        );
    }
}
