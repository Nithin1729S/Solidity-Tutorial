// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Calculator
 * @dev Implements voting process along with vote delegation
 */

 contract Calculator{
    uint256 res=0;
    function add( uint256 num) public
    {
        res+=num;
    }

    function subtract(uint256 num) public {
        res-=num;
    }

    function multiply(uint256 num) public{
        res*=num;
    } 
    function get() public view returns (uint256){
        return res;
    }
 }