// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title HelloWorld
 * @author Jules
 * @notice Hợp đồng này dùng để lưu trữ và quản lý một lời chào đơn giản.
 * This contract is for storing and managing a simple greeting.
 * @dev A very basic example of a smart contract with a single state variable that can be read and updated.
 */
contract HelloWorld {
    /**
     * @notice Biến trạng thái `greeting` để lưu trữ lời chào.
     * The state variable `greeting` to store the greeting message.
     * @dev The `public` keyword automatically creates a getter function `greeting()` to read the value.
     */
    string public greeting;

    /**
     * @notice Hàm khởi tạo, đặt giá trị ban đầu cho lời chào là "Hello, World!".
     * The constructor, which sets the initial greeting to "Hello, World!".
     * @dev This is called only once when the contract is deployed.
     */
    constructor() {
        greeting = "Hello, World!";
    }

    /**
     * @notice Cập nhật lời chào.
     * Updates the greeting message.
     * @param _newGreeting Lời chào mới. The new greeting message.
     */
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}
