pragma solidity ^0.6.6;

import "ds-test/test.sol";

import "./MetaJumper06.sol";

contract MetaJumper06Test is DSTest {
    bytes internal maliciousMetaJumper = hex'6080604052348015600f57600080fd5b5060838061001e6000396000f3fe6080604052348015600f57600080fd5b506004361060285760003560e01c8063dd6cc6d414602d575b600080fd5b60336035565b005b604b600f3803905060488163ffffffff16565b50565bfefea26469706673582212205322efb535afcd22adbfb3282ca98fcb18c320cf934caededc293dc25b6000ff64736f6c63430006060033';

    function setUp() public {}

    function testMetadataJumper() public {
        MetaJumper06 mj;
        bytes memory _initcode = maliciousMetaJumper;
        assembly {
            mj := create(0x0, add(_initcode, 0x20), mload(_initcode))
        }

        mj.metaJump();
    }
}
