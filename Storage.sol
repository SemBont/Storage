// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract EmployeeStorage {
    uint16 private shares = 1000;
    uint32 private salary = 50000;
    uint256 public idNumber = 112358132134;
    string public name = "Pat";

    function viewShares() public view returns (uint16) {
        return shares;
    }
    
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    error TooManyShares(uint16 _shares);
    
    function grantShares(uint16 _newShares) public {
        if (_newShares > 5000) {
            revert("Too many shares");
        } else if (shares + _newShares > 5000) {
            revert TooManyShares(shares + _newShares);
        }
        shares += _newShares;
    }

    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    function debugResetShares() public {
        shares = 1000;
    }
}
