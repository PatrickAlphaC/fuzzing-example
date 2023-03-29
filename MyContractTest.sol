// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {MyContract} from "./MyContract.sol";

contract MyContractTest {
    MyContract exampleContract;

    function setUp() public {
        exampleContract = new MyContract();
    }

    function testIAlwaysGetZero() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testIAlwaysGetZeroFuzz(uint256 data) public {
        // uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}
