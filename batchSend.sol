pragma solidity >=0.4.22 <0.6.0;
import './erc20.sol';

contract batchSend {
    
    constructor() public payable {}
    
    function batchSendEther(address payable[] memory  dests, uint256[] memory values)
    public
    payable {
       for (uint i = 0; i < dests.length; ++i) {
            dests[i].transfer(values[i]);
        }
        
        if(address(this).balance > 0){
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function batchSendToken(address _tokenAddr, address[] memory dests, uint256[] memory values)
    public
    payable {
        for (uint i = 0; i < dests.length; ++i) {
            ERC20Interface(_tokenAddr).transferFrom(msg.sender, dests[i], values[i]);
        }
       
    }
}
