# Blockchain Academic Certificate and Voting Platform

This project is a decentralized application (DApp) built on the Ethereum blockchain. It features two main functionalities:
1.  **Certificate NFT:** A system for issuing academic certificates as unique, non-fungible tokens (NFTs) using the ERC721 standard. This allows for verifiable and tamper-proof academic credentials.
2.  **On-Chain Voting:** A transparent and secure voting system where candidates can be registered, and users can cast their votes.

The smart contracts are developed in Solidity and are intended for deployment and interaction via the Remix IDE.

## Smart Contracts

This repository contains the following smart contracts:

*   `Certificate.sol`: An ERC721 contract for minting academic certificates as NFTs.
*   `Voting.sol`: A contract that manages a complete voting process, from adding candidates to determining the winner.
*   `HelloWorld.sol`: A simple contract for demonstration purposes.

## Development and Testing Environment

The primary environment for compiling, deploying, and testing these smart contracts is the **Remix IDE**. This project has been configured to be easily loaded into Remix.

---

# General Instructions for Remix IDE

### 1. Open the Project in Remix

1.  Go to the Remix IDE: [https://remix.ethereum.org/](https://remix.ethereum.org/)
2.  In the "File Explorers" tab, click on the "Load a local folder" icon and select the `remix` folder from this project's root directory.
3.  You should now see the `contracts` directory in the Remix file explorer.

### 2. Compile a Contract

1.  In the Remix file explorer, open the `contracts` directory and select the contract file you want to compile (e.g., `Certificate.sol`).
2.  Go to the "Solidity Compiler" tab (the second icon on the left).
3.  Ensure the "Compiler" version is compatible with the `pragma` version specified in the contract (e.g., `^0.8.20`).
4.  Click the "Compile" button.
5.  A green checkmark next to the tab icon indicates successful compilation.

### 3. Deploy a Contract

1.  Go to the "Deploy & Run Transactions" tab (the third icon on the left).
2.  In the "Environment" dropdown, select "Injected Provider - MetaMask" (or your preferred wallet). Ensure your wallet is connected to the desired network (e.g., a testnet like Sepolia).
3.  In the "Contract" dropdown, select the contract you compiled.
4.  If the constructor requires arguments (like `initialOwner` in `Certificate.sol`), enter them in the field next to the "Deploy" button.
5.  Click "Deploy" and confirm the transaction in your wallet.
6.  The deployed contract will appear under the "Deployed Contracts" section.

---

# Contract-Specific Instructions

## 🎓 Certificate Contract (`Certificate.sol`)

### Deployment

*   When deploying, you must provide the wallet address that will be the contract `initialOwner` in the deployment field.

### Interaction

*   **`safeMint(address to, string memory uri)`**: This function can only be called by the contract owner.
    *   `to`: The wallet address of the recipient who will receive the certificate NFT.
    *   `uri`: A link to a JSON file (often hosted on IPFS) that contains the certificate's metadata (e.g., student's name, degree, issue date).

---

## 🗳️ Voting Contract (`Voting.sol`)

The contract owner manages the voting lifecycle.

### 1. Add Candidates (Owner Only)

*   This must be done before the vote starts (`NotStarted` state).
*   Use the `addCandidate` function:
    *   `_name`: The candidate's name (e.g., `"Candidate A"`).
    *   `_description`: A short description (e.g., `"Platform for decentralization"`).
*   Add at least one candidate.

### 2. Start the Vote (Owner Only)

*   Once all candidates are added, call the `startVoting` function to begin the election. The status will change to `Running`.

### 3. Cast a Vote (Public)

*   Anyone can vote while the status is `Running`.
*   Each person can only vote once.
*   Use the `vote` function:
    *   `_candidateId`: The ID number of the candidate you want to vote for. IDs start at `1`.

### 4. End the Vote (Owner Only)

*   When the voting period is over, the owner calls the `endVoting` function. The status will change to `Ended`.

### 5. Get the Winner (Public)

*   After the vote has ended, anyone can call the `getWinner` function to see the results.
*   It will return the ID, name, and total vote count of the winning candidate.

---

## 👋 HelloWorld Contract (`HelloWorld.sol`)

### Interaction

*   **`greeting`**: Click this button to read the current greeting message.
*   **`setGreeting(string memory _newGreeting)`**: Enter a new greeting in the text field (e.g., `"Hello Everyone"`) and click the button to update the message.

---
---

# (Vietnamese) Nền tảng Cấp chứng chỉ Blockchain và Bỏ phiếu

Dự án này là một ứng dụng phi tập trung (DApp) được xây dựng trên blockchain Ethereum. Nó có hai chức năng chính:
1.  **NFT Chứng chỉ:** Một hệ thống để cấp chứng chỉ học thuật dưới dạng token không thể thay thế (NFT) duy nhất sử dụng tiêu chuẩn ERC721. Điều này cho phép thông tin học vấn có thể kiểm chứng và chống giả mạo.
2.  **Bỏ phiếu On-Chain:** Một hệ thống bỏ phiếu minh bạch và an toàn, nơi các ứng cử viên có thể được đăng ký và người dùng có thể bỏ phiếu.

Các hợp đồng thông minh được phát triển bằng Solidity và dành cho việc triển khai và tương tác thông qua Remix IDE.

## Hợp đồng thông minh (Smart Contracts)

Repo này chứa các hợp đồng thông minh sau:

*   `Certificate.sol`: Một hợp đồng ERC721 để đúc (mint) chứng chỉ học thuật dưới dạng NFT.
*   `Voting.sol`: Một hợp đồng quản lý một quy trình bỏ phiếu hoàn chỉnh, từ việc thêm ứng cử viên đến xác định người chiến thắng.
*   `HelloWorld.sol`: Một hợp đồng đơn giản cho mục đích trình diễn.

## Môi trường Phát triển và Thử nghiệm

Môi trường chính để biên dịch, triển khai và thử nghiệm các hợp đồng thông minh này là **Remix IDE**. Dự án này đã được cấu hình để có thể dễ dàng tải vào Remix.

---

# Hướng dẫn chung cho Remix IDE

### 1. Mở Dự án trong Remix

1.  Truy cập Remix IDE: [https://remix.ethereum.org/](https://remix.ethereum.org/)
2.  Trong tab "File Explorers", nhấp vào biểu tượng "Load a local folder" và chọn thư mục `remix` từ thư mục gốc của dự án này.
3.  Bây giờ bạn sẽ thấy thư mục `contracts` trong trình khám phá tệp của Remix.

### 2. Biên dịch Hợp đồng

1.  Trong trình khám phá tệp của Remix, mở thư mục `contracts` và chọn tệp hợp đồng bạn muốn biên dịch (ví dụ: `Certificate.sol`).
2.  Chuyển đến tab "Solidity Compiler" (biểu tượng thứ hai ở bên trái).
3.  Đảm bảo phiên bản "Compiler" tương thích với phiên bản `pragma` được chỉ định trong hợp đồng (ví dụ: `^0.8.20`).
4.  Nhấp vào nút "Compile".
5.  Một dấu kiểm màu xanh lá cây bên cạnh biểu tượng tab cho biết biên dịch đã thành công.

### 3. Triển khai Hợp đồng

1.  Chuyển đến tab "Deploy & Run Transactions" (biểu tượng thứ ba ở bên trái).
2.  Trong menu thả xuống "Environment", chọn "Injected Provider - MetaMask" (hoặc ví bạn muốn). Đảm bảo ví của bạn được kết nối với mạng mong muốn (ví dụ: mạng thử nghiệm như Sepolia).
3.  Trong menu thả xuống "Contract", chọn hợp đồng bạn đã biên dịch.
4.  Nếu hàm khởi tạo (constructor) yêu cầu tham số (như `initialOwner` trong `Certificate.sol`), hãy nhập chúng vào trường bên cạnh nút "Deploy".
5.  Nhấp vào "Deploy" và xác nhận giao dịch trong ví của bạn.
6.  Hợp đồng đã triển khai sẽ xuất hiện trong phần "Deployed Contracts".

---

# Hướng dẫn chi tiết cho từng Hợp đồng

## 🎓 Hợp đồng Chứng chỉ (`Certificate.sol`)

### Triển khai

*   Khi triển khai, bạn phải cung cấp địa chỉ ví sẽ là `initialOwner` (chủ sở hữu ban đầu) của hợp đồng vào trường triển khai.

### Tương tác

*   **`safeMint(address to, string memory uri)`**: Chức năng này chỉ có thể được gọi bởi chủ sở hữu hợp đồng.
    *   `to`: Địa chỉ ví của người sẽ nhận NFT chứng chỉ.
    *   `uri`: Một liên kết đến tệp JSON (thường được lưu trữ trên IPFS) chứa siêu dữ liệu của chứng chỉ (ví dụ: tên sinh viên, bằng cấp, ngày cấp).

---

## 🗳️ Hợp đồng Bỏ phiếu (`Voting.sol`)

Chủ sở hữu hợp đồng quản lý vòng đời của cuộc bỏ phiếu.

### 1. Thêm Ứng cử viên (Chỉ Owner)

*   Phải được thực hiện trước khi cuộc bỏ phiếu bắt đầu (trạng thái `NotStarted`).
*   Sử dụng hàm `addCandidate`:
    *   `_name`: Tên của ứng cử viên (ví dụ: `"Ứng cử viên A"`).
    *   `_description`: Mô tả ngắn (ví dụ: `"Nền tảng cho sự phi tập trung"`).
*   Thêm ít nhất một ứng cử viên.

### 2. Bắt đầu Bỏ phiếu (Chỉ Owner)

*   Sau khi tất cả các ứng cử viên đã được thêm, hãy gọi hàm `startVoting` để bắt đầu cuộc bầu cử. Trạng thái sẽ chuyển thành `Running`.

### 3. Bỏ phiếu (Công khai)

*   Bất kỳ ai cũng có thể bỏ phiếu khi trạng thái là `Running`.
*   Mỗi người chỉ được bỏ phiếu một lần.
*   Sử dụng hàm `vote`:
    *   `_candidateId`: Số ID của ứng cử viên bạn muốn bỏ phiếu. ID bắt đầu từ `1`.

### 4. Kết thúc Bỏ phiếu (Chỉ Owner)

*   Khi thời gian bỏ phiếu kết thúc, chủ sở hữu gọi hàm `endVoting`. Trạng thái sẽ chuyển thành `Ended`.

### 5. Lấy Người chiến thắng (Công khai)

*   Sau khi cuộc bỏ phiếu kết thúc, bất kỳ ai cũng có thể gọi hàm `getWinner` để xem kết quả.
*   Hàm sẽ trả về ID, tên và tổng số phiếu bầu của ứng cử viên chiến thắng.

---

## 👋 Hợp đồng HelloWorld (`HelloWorld.sol`)

### Tương tác

*   **`greeting`**: Nhấp vào nút này để đọc thông điệp chào mừng hiện tại.
*   **`setGreeting(string memory _newGreeting)`**: Nhập một lời chào mới vào trường văn bản (ví dụ: `"Xin chào Việt Nam"`) và nhấp vào nút để cập nhật thông điệp.
