// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.12;

interface IPancakeLPToken {
  function DOMAIN_SEPARATOR (  ) external view returns ( bytes32 );
  function MINIMUM_LIQUIDITY (  ) external view returns ( uint256 );
  function PERMIT_TYPEHASH (  ) external view returns ( bytes32 );
  function allowance ( address, address ) external view returns ( uint256 );
  function approve ( address spender, uint256 value ) external returns ( bool );
  function balanceOf ( address ) external view returns ( uint256 );
  function burn ( address to ) external returns ( uint256 amount0, uint256 amount1 );
  function decimals (  ) external view returns ( uint8 );
  function factory (  ) external view returns ( address );
  function getReserves (  ) external view returns ( uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast );
  function initialize ( address _token0, address _token1 ) external;
  function kLast (  ) external view returns ( uint256 );
  function mint ( address to ) external returns ( uint256 liquidity );
  function nonces ( address ) external view returns ( uint256 );
  function permit ( address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s ) external;
  function price0CumulativeLast (  ) external view returns ( uint256 );
  function price1CumulativeLast (  ) external view returns ( uint256 );
  function skim ( address to ) external;
  function sync (  ) external;
  function token0 (  ) external view returns ( address );
  function token1 (  ) external view returns ( address );
  function totalSupply (  ) external view returns ( uint256 );
  function transfer ( address to, uint256 value ) external returns ( bool );
  function transferFrom ( address from, address to, uint256 value ) external returns ( bool );
}

interface IKingDeFiFarm {
    
  function changeFee ( uint256 _pid, uint16 _fee ) external;
  function changeLastBlock ( uint256 _lastBlock ) external;
  function changePoolKrwReward ( uint256 _pid, uint256 _krwPerBlock ) external;
  function changeVault ( uint256 _pid, address _vault, bool _isVaultContract ) external;
  function claim ( uint256 _pid ) external;
  function deposit ( uint256 _pid, uint256 _amount ) external;
  function emergencyWithdraw ( uint256 _pid ) external;
  function getDeposit ( uint256 _pid, address account ) external view returns ( uint256 );
  function getFee ( uint256 _pid ) external view returns ( uint256 );
  function getKrwPerBlock ( uint256 _pid ) external view returns ( uint256 );
  function getPending ( uint256 _pid, address account ) external view returns ( uint256 );
  function getTotalSupply ( uint256 _pid ) external view returns ( uint256 );
  function krw (  ) external view returns ( address );
  function lastBlock (  ) external view returns ( uint256 );
  function massUpdatePools (  ) external;
  function massUpdatePoolsInRange ( uint256 startPool, uint256 endPool ) external;
  function owner (  ) external view returns ( address );
  function pause (  ) external;
  function pausePool ( uint256 _pid ) external;
  function paused (  ) external view returns ( bool );
  function pausedPool ( uint256 ) external view returns ( bool );
  function pausedUpdatePools (  ) external view returns ( bool );
  function poolInfo ( uint256 ) external view returns ( address lpToken, string memory symbol, uint16 fee, address vault, bool isVaultContract, uint256 totalSupply, uint256 krwPerBlock, uint256 lastRewardBlock, uint256 rewardsPerShare );
  function poolLength (  ) external view returns ( uint256 );
  function renounceOwnership (  ) external;
  function tokenAlreadyInPool ( address ) external view returns ( bool );
  function transferOwnership ( address newOwner ) external;
  function unpause (  ) external;
  function unpausePool ( uint256 _pid ) external;
  function updatePool ( uint256 _pid ) external;
  function userInfo ( uint256, address ) external view returns ( uint256 amount, uint256 rewardMinus );
  function withdraw ( uint256 _pid, uint256 _amount ) external;
  function withdrawAll ( uint256 _pid ) external;
}

contract circulating{
    
    IPancakeLPToken krown = IPancakeLPToken(address(0x1446f3CEdf4d86a9399E49f7937766E6De2A3AAB));
    IKingDeFiFarm kingDeFiFarm = IKingDeFiFarm(address(0x49A44ea2B4126CC1C53C47Ed7f9a5905Cbecae8d));
    address vestingContractFarm = address(0x876f813A0b116a89E43B833d521c61584eD29797);
    address farm = address(0x49A44ea2B4126CC1C53C47Ed7f9a5905Cbecae8d);
    address vestingContractTwo = address(0x62E24E25fFD91f9f4bDff0Df6485ec39C61105E9);
    address vestingContractThree = address(0xa0Cd725D520F94d65C9Af6E56E5ACbbB04Fa0966);
    address vestingContractFour = address(0x224e88f4E51Ac3c09612c967FD07D86f926EF78b);
    address vestingContractFive = address(0x2C02ec1fF2C2b1fF2EB4a443d558da672D39b7E6);
    address vestingContractSix = address(0x16f1FE2c2Ea7E1AD292C364383e8b51603962747);
    address vestingContractSeven = address(0xB1E4d00c125E6BC0eE50300aE511C3E86c50d254);
    address vestingContactEight = address(0x3C8baa91fD7215c8a9acBeCa29F6D0B03BEBd684);
    address firstMockAddress = address(0x9E48EeBBfeB37d7CE1f56Cdd02efCe21008d2639);
    address secondMockAddress = address(0xdA5583D5196E269649416285a986fd3e0A141a44);
    
    function _vestingContractFarm() view public returns(uint256){
        return krown.balanceOf(vestingContractFarm);
    }
    
    function _farm() view public returns(uint256){
        return krown.balanceOf(farm);
    }
    
    function _vestingContractTwo() view public returns(uint256){
        return krown.balanceOf(vestingContractTwo);
    }
    
    function _vestingContractThree() view public returns(uint256){
        return krown.balanceOf(vestingContractThree);
    }
    
    function _vestingContractFour() view public returns(uint256){
        return krown.balanceOf(vestingContractFour);
    }
    
    function _vestingContractFive() view public returns(uint256){
        return krown.balanceOf(vestingContractFive);
    }
    
    function _vestingContractSix() view public returns(uint256){
        return krown.balanceOf(vestingContractSix);
    }
    
    function _vestingContractSeven() view public returns(uint256){
        return krown.balanceOf(vestingContractSeven);
    }
    
    function _vestingContactEight() view public returns(uint256){
        return krown.balanceOf(vestingContactEight);
    }
    
    function _firstMockAddress() view public returns(uint256){
        return krown.balanceOf(firstMockAddress);
    }
    
    function _secondMockAddress() view public returns(uint256){
        return krown.balanceOf(secondMockAddress);
    }
    
    function circulatingCalculation() view external returns(uint256){
        uint256 maxSupply = 10000000000 ether;
        maxSupply = maxSupply - _vestingContractFarm();
        maxSupply = maxSupply - _farm();
        maxSupply = maxSupply - _vestingContractTwo();
        maxSupply = maxSupply - _vestingContractThree();
        maxSupply = maxSupply - _vestingContractFour();
        maxSupply = maxSupply - _vestingContractFive();
        maxSupply = maxSupply - _vestingContractSix();
        maxSupply = maxSupply - _vestingContractSeven();
        maxSupply = maxSupply - _vestingContactEight();
        maxSupply = maxSupply - _firstMockAddress();
        maxSupply = maxSupply - _secondMockAddress();
        maxSupply = maxSupply + kingDeFiFarm.getTotalSupply(1);
        return maxSupply / 10**18;
    }
}