// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Bắt đầu định nghĩa hợp đồng
contract Greeter {
    // Khai báo một biến trạng thái `greeting` kiểu `string` (chuỗi ký tự).
    // Biến này sẽ được lưu trữ vĩnh viễn trên blockchain.
    string private greeting;

    // Hàm khởi tạo (constructor) được gọi một lần duy nhất khi triển khai hợp đồng.
    // Nó nhận một tham số `_greeting` để thiết lập câu chào ban đầu.
    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    // Hàm `greet()` dùng để đọc và trả về câu chào hiện tại.
    // - `public view`: Ai cũng có thể gọi, `view` nghĩa là nó chỉ đọc, không thay đổi
    //   dữ liệu và không tốn phí gas khi gọi.
    // - `returns (string memory)`: Khai báo rằng hàm sẽ trả về một chuỗi.
    function greet() public view returns (string memory) {
        return greeting;
    }

    // Hàm `setGreeting()` dùng để thay đổi giá trị của biến `greeting`.
    // - `public`: Ai cũng có thể gọi hàm này.
    // - Vì hàm này thay đổi dữ liệu trên blockchain, nó sẽ tốn một khoản phí gas
    //   để thực thi và tạo ra một giao dịch (transaction).
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}
