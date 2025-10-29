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

---

# Deploying and Interacting with the HelloWorld Contract

These instructions explain how to use the `HelloWorld.sol` contract in Remix.

## 1. Compile the Contract

1.  Follow the same initial steps to open the project in Remix.
2.  In the Remix file explorer, open `contracts/HelloWorld.sol`.
3.  Go to the "Solidity Compiler" tab and click "Compile HelloWorld.sol".

## 2. Deploy the Contract

1.  Go to the "Deploy & Run Transactions" tab.
2.  Ensure your environment is set (e.g., "Injected Provider - MetaMask").
3.  In the "Contract" dropdown, select "HelloWorld - contracts/HelloWorld.sol".
4.  Click the "Deploy" button and confirm the transaction in your wallet.

## 3. Interact with the Contract

Once deployed, you will see the `HelloWorld` contract under "Deployed Contracts".

*   **To read the greeting:**
    *   Click the blue button labeled `greeting`. The current greeting ("Hello, World!") will be displayed below.
*   **To change the greeting:**
    *   In the text field next to the orange `setGreeting` button, type a new message (e.g., "Xin chào Việt Nam"). Make sure to enclose it in double quotes: `"Xin chào Việt Nam"`.
    *   Click the `setGreeting` button and confirm the transaction in your wallet.
    *   After the transaction is confirmed, click the `greeting` button again to see the updated message.

---

# Hướng dẫn triển khai và tương tác với hợp đồng HelloWorld

Hướng dẫn này giải thích cách sử dụng hợp đồng `HelloWorld.sol` trong Remix.

## 1. Biên dịch hợp đồng

1.  Thực hiện các bước ban đầu tương tự để mở dự án trong Remix.
2.  Trong trình khám phá tệp của Remix, mở tệp `contracts/HelloWorld.sol`.
3.  Chuyển đến tab "Solidity Compiler" và nhấp vào "Compile HelloWorld.sol".

## 2. Triển khai hợp đồng

1.  Chuyển đến tab "Deploy & Run Transactions".
2.  Đảm bảo môi trường của bạn đã được thiết lập (ví dụ: "Injected Provider - MetaMask").
3.  Trong menu thả xuống "Contract", chọn "HelloWorld - contracts/HelloWorld.sol".
4.  Nhấp vào nút "Deploy" và xác nhận giao dịch trong ví của bạn.

## 3. Tương tác với hợp đồng

Sau khi triển khai, bạn sẽ thấy hợp đồng `HelloWorld` trong phần "Deployed Contracts".

*   **Để đọc lời chào:**
    *   Nhấp vào nút màu xanh có nhãn `greeting`. Lời chào hiện tại ("Hello, World!") sẽ được hiển thị bên dưới.
*   **Để thay đổi lời chào:**
    *   Trong trường văn bản bên cạnh nút `setGreeting` màu cam, nhập một thông điệp mới (ví dụ: "Xin chào Việt Nam"). Hãy chắc chắn rằng bạn đặt nó trong dấu ngoặc kép: `"Xin chào Việt Nam"`.
    *   Nhấp vào nút `setGreeting` và xác nhận giao dịch trong ví của bạn.
    *   Sau khi giao dịch được xác nhận, hãy nhấp lại vào nút `greeting` để xem thông điệp đã được cập nhật.
---

# Hướng dẫn Kiểm thử Hợp đồng Bỏ phiếu (Voting.sol)

Hướng dẫn này sẽ chỉ bạn cách biên dịch, triển khai và tương tác với hợp đồng `Voting.sol` ngay trên Remix IDE để kiểm tra các chức năng của nó.

## 1. Mở và Biên dịch Hợp đồng

1.  **Mở tệp:** Trong trình khám phá tệp của Remix, hãy mở `contracts/Voting.sol`.
2.  **Biên dịch:** Chuyển đến tab "Solidity Compiler". Đảm bảo phiên bản compiler tương thích với `^0.8.20` (ví dụ: `0.8.25`). Nhấp vào nút **"Compile Voting.sol"**. Một dấu kiểm màu xanh lá sẽ xuất hiện nếu biên dịch thành công.

## 2. Triển khai Hợp đồng

1.  **Chuyển tab:** Chuyển đến tab "Deploy & Run Transactions".
2.  **Chọn Môi trường:** Trong mục "Environment", chọn **"Remix VM (London)"**. Đây là một máy ảo blockchain cục bộ, rất tiện lợi để kiểm thử nhanh mà không cần ví thật.
3.  **Deploy:** Đảm bảo "Contract" đã chọn là **"Voting - contracts/Voting.sol"**. Nhấp vào nút **"Deploy"**.
4.  Hợp đồng sau khi triển khai sẽ xuất hiện ở mục "Deployed Contracts". Tài khoản mà bạn dùng để deploy sẽ tự động là **chủ sở hữu (owner)** của hợp đồng.

## 3. Tương tác và Kiểm thử Hợp đồng

Bây giờ, hãy thực hiện các bước sau để kiểm tra luồng hoạt động của hợp đồng.

### Bước 1: Thêm Ứng cử viên (Chỉ Owner)

Bạn đang sử dụng tài khoản của owner (tài khoản đầu tiên trong danh sách "ACCOUNT" của Remix VM).

1.  Trong hợp đồng đã triển khai, tìm chức năng `addCandidate`.
2.  Nhập tên ứng cử viên vào ô `_name`, ví dụ: `"Ung cu vien A"`.
3.  Nhập mô tả vào ô `_description`, ví dụ: `"Mo ta ve A"`.
4.  Nhấp vào nút `addCandidate` màu cam.
5.  Thêm một ứng cử viên khác với tên `"Ung cu vien B"` và mô tả `"Mo ta ve B"`.

*   **Kiểm tra:**
    *   Để xem thông tin ứng cử viên, nhập `1` vào ô bên cạnh nút `candidates` màu xanh và nhấp vào đó. Bạn sẽ thấy thông tin của "Ung cu vien A".
    *   Làm tương tự với ID `2` để xem "Ung cu vien B".

### Bước 2: Bắt đầu Cuộc bỏ phiếu (Chỉ Owner)

1.  Nhấp vào nút `startVoting` màu cam.
2.  Trạng thái cuộc bỏ phiếu bây giờ sẽ chuyển sang `Running` (Đang diễn ra).

*   **Kiểm tra:**
    *   Nhấp vào nút `votingStatus` màu xanh. Kết quả sẽ hiển thị là `1` (tương ứng với `Running`).
    *   Thử gọi lại hàm `addCandidate`. Giao dịch sẽ thất bại, vì không thể thêm ứng cử viên khi cuộc bỏ phiếu đang diễn ra.

### Bước 3: Thực hiện Bỏ phiếu (Bất kỳ ai)

1.  Trong danh sách "ACCOUNT" của Remix VM, **chọn một tài khoản khác** (ví dụ: tài khoản thứ hai) để đóng vai người bỏ phiếu.
2.  Trong hợp đồng đã triển khai, tìm chức năng `vote`.
3.  Nhập `1` vào ô `_candidateId` để bỏ phiếu cho "Ung cu vien A".
4.  Nhấp vào nút `vote`.
5.  **Chuyển sang tài khoản thứ ba** và bỏ phiếu cho "Ung cu vien B" bằng cách nhập `2` vào ô `_candidateId` và nhấp `vote`.

*   **Kiểm tra:**
    *   Thử dùng lại tài khoản thứ hai để bỏ phiếu lần nữa (cho ứng cử viên 1 hoặc 2). Giao dịch sẽ thất bại với thông báo "You have already voted."
    *   Kiểm tra lại thông tin ứng cử viên (dùng nút `candidates` với ID `1` và `2`). Bạn sẽ thấy `voteCount` của họ đã tăng lên.

### Bước 4: Kết thúc Cuộc bỏ phiếu (Chỉ Owner)

1.  **Chuyển về tài khoản của owner** (tài khoản đầu tiên).
2.  Nhấp vào nút `endVoting` màu cam.
3.  Trạng thái cuộc bỏ phiếu sẽ chuyển sang `Ended` (Đã kết thúc).

*   **Kiểm tra:**
    *   Nhấp vào nút `votingStatus` màu xanh. Kết quả sẽ hiển thị là `2` (tương ứng với `Ended`).
    *   Thử bỏ phiếu bằng một tài khoản bất kỳ. Giao dịch sẽ thất bại.

### Bước 5: Xem Kết quả

1.  Sau khi cuộc bỏ phiếu kết thúc, nhấp vào nút `getWinner` màu xanh.
2.  Kết quả sẽ hiển thị thông tin của người chiến thắng, bao gồm ID, tên và tổng số phiếu bầu.
