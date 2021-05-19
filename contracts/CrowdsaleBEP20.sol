pragma solidity ^0.5.5;

/**
 * @dev This is an example of a fully fledged crowdsale.
 */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CrowdsaleBEP20 {
    IERC20 public payableToken =
        IERC20(0x64544969ed7EBf5f083679233325356EbE738930); //USDC on BSC TESTNET

    IERC20 token;

    uint256 public startTime;
    uint256 public endTime;
    address public owner;
    uint256 public rate;

    constructor(
        uint256 _rate,
        address payable _owner,
        IERC20 _token,
        uint256 _startTime,
        uint256 _endTime
    ) public {
        startTime = _startTime;
        endTime = _endTime;
        token = _token;
        owner = _owner;
        rate = _rate;
    }

    modifier inAllowedTime {
        require(
            block.timestamp >= startTime && block.timestamp <= endTime,
            "Crowdsale is not open at this time"
        );
        _;
    }

    modifier ownerOnly {
        require(
            msg.sender == owner,
            "Only contract owner can perform this action"
        );
        _;
    }

    //user MUST call approve function on the payable token from their address (USDC in this case)
    function acceptAnotherPayableToken(uint256 amount) external inAllowedTime {
        address user = msg.sender;

        uint256 userBalance = payableToken.balanceOf(user);

        require(userBalance >= amount);

        uint256 calculatedAmount = amount * rate;

        require(calculatedAmount <= token.balanceOf(address(this)));

        if (userBalance >= amount) {
            payableToken.transferFrom(user, owner, amount);
            token.transfer(user, calculatedAmount);
        }
    }

    function removeFunds(uint256 amount) external ownerOnly {
        require(amount <= token.balanceOf(address(this)));
        token.transfer(owner, amount);
    }
}
