// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {MyContract} from "../src/MyContract.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract MyContractTest is StdInvariant, Test {
    MyContract exampleContract;

    function setUp() public {
        exampleContract = new MyContract();
        targetContract(address(exampleContract));
    }

    function testIsAlwaysZeroUnit() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testIsAlwaysZeroFuzz(uint256 randomData) public {
        // uint256 data = 0; // commented out line
        exampleContract.doStuff(randomData);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testIsAlwaysZeroUnitManyCalls() public {
        uint256 data = 7;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);

        data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0); // this would fail
    }

    function invariant_testAlwaysReturnsZero() public {
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}
