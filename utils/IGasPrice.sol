pragma solidity ^0.6.12;

interface IGasPrice {
    function maxGasPrice() external returns (uint);
}