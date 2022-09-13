// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Fund {

    uint256 public totalAmount;
    mapping(address => address) toSend;  
    mapping(address => uint256) sentAmount;

    ERC20 tokenAddress = ERC20(0x323A5c32f020eBB2e5009342f5719FB4841D986d);
    //change this everytime you deploy your token

    function _checkTotal()public view returns(uint256){
       return tokenAddress.balanceOf(address(this));
       //no need for this function
       //because erc20 does this for you
    }

    function _checkReceiver(address sender) public view returns(address){
        return toSend[sender];
    }

    function _getSentAmount(address sender) public view returns(uint256){
        return sentAmount[sender];
    }

    function sendAmount(address from,address to,uint256 amount) public{
        toSend[from] = to;
        sentAmount[from] = amount;
        totalAmount += amount;
        tokenAddress.transferFrom(from,to,amount);
    }

}