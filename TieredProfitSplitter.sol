pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
 address payable employee_one ; //= 0x2b49862144dC302DB54Ed09a5A88E5a9F23Ca410
    address payable employee_two; // = 0xcb2FA745803347F5C8fA0225F8a2ef6474Ec9BE1
    address payable employee_three;  //= 0x1036770F9A2Dfe813D5BD672c2CFF1393544a58F


    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;
        
        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);
        
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);
        
        
        employee_one.transfer(msg.value - total);
        
        
        

        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
