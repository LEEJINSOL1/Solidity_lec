// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Simple{
    int num = 0;

    function add() public{
        num = num + 1;

    }
    function get() public view returns(int){
        return num;
    }
}


