// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

import "./Token/ERC20.sol";
import "./Token/SafeERC20.sol";
import "./utils/SafeMath.sol";

contract KROWN is ERC20 {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    uint256 public cap = 10000000000 ether;
    address public capAddress;
    address public governance;
    mapping(address => bool) public minters;


    // da scegliere nome e/o simbolo
    constructor() public ERC20("KROWN", "KRW") {
        governance = msg.sender;
        capAddress = msg.sender;
        minters[msg.sender] = true;
    }

    function mint(address account, uint256 amount) public {
        require(minters[msg.sender], "!minter");
        require(this.totalSupply().add(amount) <= cap , "!supply");
        _mint(account, amount);
    }

    function setGovernance(address _governance) public {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function addMinter(address _minter) public {
        require(msg.sender == governance, "!governance");
        minters[_minter] = true;
    }

    function removeMinter(address _minter) public {
        require(msg.sender == governance, "!governance");
        minters[_minter] = false;
    }
    
    function burn(uint256 amount) public {
        require(amount <= balanceOf(msg.sender), "!amount");
        _burn(msg.sender, amount);
    }
    
    function setCap(uint256 _cap) public {
        require(msg.sender == capAddress, "!governance");
        require(_cap > cap, "!cap");
        cap = _cap;
    }
    
    function burnCapAddress() public {
        require(msg.sender == governance, "!governance");
        capAddress = address(0x0000000000000000000000000000000000000000);
    }

}