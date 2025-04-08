// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {UniswapPoolId} from "../src/UniswapPoolId.sol";
import {PoolId} from "v4-core/types/PoolId.sol";

contract UniswapPoolIdTest {
    UniswapPoolId private s_uniswapPoolId;
    address private constant CURRENCY0 =
        0x558AFaF6FeF52395D558F9fc1ab18A08C7A7548b;
    address private constant CURRENCY1 =
        0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    uint24 private constant FEE = 10000;
    int24 private constant TICK_SPACING = 60;
    address private constant HOOKS = 0x0000000000000000000000000000000000000000;
    bytes32 private constant POOL_ID =
        0x6619b3d6e91396ec718a045b5dcb6db1fb588a0d47f0259ba494134f1ddffb16;

    function setUp() external {
        s_uniswapPoolId = new UniswapPoolId();
    }

    function testGetUniswapPoolID() external view returns (PoolId poolId) {
        poolId = s_uniswapPoolId.getUniswapPoolId(
            CURRENCY0,
            CURRENCY1,
            FEE,
            TICK_SPACING,
            HOOKS
        );
        assert(PoolId.unwrap(poolId) == POOL_ID);
    }
}
