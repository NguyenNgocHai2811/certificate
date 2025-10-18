# Deploying the Certificate Contract with Remix

This guide provides instructions on how to compile and deploy the `Certificate.sol` smart contract using the Remix IDE.

## Instructions

### 1. Open the Project in Remix

1.  Go to the Remix IDE: [https://remix.ethereum.org/](https://remix.ethereum.org/)
2.  In the "File Explorers" tab, click on the "Load a local folder" icon and select the `remix` folder from this project.
3.  You should now see the `contracts` directory in the Remix file explorer.

### 2. Compile the Contract

1.  In the Remix file explorer, open the `contracts` directory and then open the `Certificate.sol` file.
2.  Go to the "Solidity Compiler" tab (the second icon on the left).
3.  Make sure the "Compiler" version is set to a version compatible with `^0.8.24` (e.g., `0.8.24+commit.e5a43415`).
4.  Click the "Compile Certificate.sol" button.
5.  If the compilation is successful, you will see a green checkmark next to the "Solidity Compiler" tab icon.

### 3. Deploy the Contract

1.  Go to the "Deploy & Run Transactions" tab (the third icon on the left).
2.  In the "Environment" dropdown, select "Injected Provider - MetaMask" (or your preferred wallet). Make sure your wallet is connected to the desired network (e.g., a testnet like Sepolia).
3.  In the "Contract" dropdown, select "Certificate - contracts/Certificate.sol".
4.  Next to the "Deploy" button, you will see a field for the `initialOwner` address. Enter the wallet address that you want to be the owner of the contract.
5.  Click the "Deploy" button.
6.  Your wallet will prompt you to confirm the transaction. Confirm it.
7.  Once the transaction is mined, you will see the deployed contract under the "Deployed Contracts" section in Remix.

---

# Hướng dẫn triển khai hợp đồng Certificate bằng Remix

Hướng dẫn này cung cấp các bước để biên dịch và triển khai hợp đồng thông minh `Certificate.sol` bằng Remix IDE.

## Hướng dẫn

### 1. Mở dự án trong Remix

1.  Truy cập Remix IDE: [https://remix.ethereum.org/](https://remix.ethereum.org/)
2.  Trong tab "File Explorers", nhấp vào biểu tượng "Load a local folder" và chọn thư mục `remix` từ dự án này.
3.  Bây giờ bạn sẽ thấy thư mục `contracts` trong trình khám phá tệp của Remix.

### 2. Biên dịch hợp đồng

1.  Trong trình khám phá tệp của Remix, mở thư mục `contracts` và sau đó mở tệp `Certificate.sol`.
2.  Chuyển đến tab "Solidity Compiler" (biểu tượng thứ hai ở bên trái).
3.  Đảm bảo phiên bản "Compiler" được đặt thành phiên bản tương thích với `^0.8.24` (ví dụ: `0.8.24+commit.e5a43415`).
4.  Nhấp vào nút "Compile Certificate.sol".
5.  Nếu biên dịch thành công, bạn sẽ thấy một dấu kiểm màu xanh lá cây bên cạnh biểu tượng tab "Solidity Compiler".

### 3. Triển khai hợp đồng

1.  Chuyển đến tab "Deploy & Run Transactions" (biểu tượng thứ ba ở bên trái).
2.  Trong menu thả xuống "Environment", chọn "Injected Provider - MetaMask" (hoặc ví bạn muốn). Đảm bảo ví của bạn được kết nối với mạng mong muốn (ví dụ: mạng thử nghiệm như Sepolia).
3.  Trong menu thả xuống "Contract", chọn "Certificate - contracts/Certificate.sol".
4.  Bên cạnh nút "Deploy", bạn sẽ thấy một trường cho địa chỉ `initialOwner`. Nhập địa chỉ ví mà bạn muốn làm chủ sở hữu của hợp đồng.
5.  Nhấp vào nút "Deploy".
6.  Ví của bạn sẽ nhắc bạn xác nhận giao dịch. Xác nhận nó.
7.  Sau khi giao dịch được khai thác, bạn sẽ thấy hợp đồng đã triển khai trong phần "Deployed Contracts" trong Remix.
