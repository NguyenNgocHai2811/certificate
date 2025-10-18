// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title HelloWorld
 * @dev Hợp đồng này dùng để lưu trữ và quản lý một lời chào.
 * This contract is for storing and managing a greeting.
 */
contract HelloWorld {
    // Biến trạng thái `greeting` để lưu trữ lời chào.
    // `public` sẽ tự động tạo một hàm getter `greeting()` để đọc giá trị.
    // The state variable `greeting` to store the greeting message.
    // The `public` keyword automatically creates a getter function `greeting()` to read the value.
    string public greeting;

    /**
     * @dev Hàm khởi tạo, được gọi khi hợp đồng được triển khai.
     *      Nó đặt giá trị ban đầu cho lời chào là "Hello, World!".
     * The constructor, called when the contract is deployed.
     * It sets the initial value of the greeting to "Hello, World!".
     */
    constructor() {
        greeting = "Hello, World!";
    }

    /**
     * @dev Cập nhật lời chào.
     *      Updates the greeting.
     * @param _newGreeting Lời chào mới. The new greeting message.
     */
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}
