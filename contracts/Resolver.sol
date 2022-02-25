pragma solidity 0.8.11;

//note: a wrapper contract with funds would be needed for this in production because the payable function requires ETH


interface IExample {
   function payOwner(uint256 _amount) external;
   function getLastExecuted() external view returns(uint);
}

contract Resolver {

   address public immutable SarahsAddress;

   constructor(address _SarahsAddress) {
    SarahsAddress = _SarahsAddress;
   }


   function checker()
       external
       view
       returns (bool canExec, bytes memory execPayload) {

       uint256 lastExecuted = IExample(SarahsAddress).getLastExecuted();

       canExec = (block.number - lastExecuted) > 10;

       execPayload = abi.encodeWithSelector(
           IExample.payOwner.selector,
           uint256(40000)
       );

   }

}
