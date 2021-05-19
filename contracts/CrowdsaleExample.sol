pragma solidity ^0.5.5;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "@openzeppelin/contracts/crowdsale/validation/TimedCrowdsale.sol";

contract CrowdsaleExample is Crowdsale, TimedCrowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token,
        uint256 openingTime,
        uint256 closingTime
    )
        public
        TimedCrowdsale(openingTime, closingTime)
        Crowdsale(rate, wallet, token)
    {}
}
