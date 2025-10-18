// Hàm main sẽ xử lý logic chính
async function main() {
  // 1. Lấy thông tin về hợp đồng 'Greeter'
  const Greeter = await hre.ethers.getContractFactory("Greeter");

  // 2. Triển khai (deploy) hợp đồng với câu chào ban đầu "Hello, Hardhat!"
  //    Hàm deploy sẽ trả về một đối tượng đại diện cho hợp đồng trên blockchain.
  console.log("Đang triển khai hợp đồng Greeter...");
  const greeter = await Greeter.deploy("Hello, Hardhat!");

  // 3. Chờ cho đến khi hợp đồng được triển khai thành công
  await greeter.waitForDeployment();
  const contractAddress = await greeter.getAddress();
  console.log(`Hợp đồng đã được triển khai tại địa chỉ: ${contractAddress}`);

  // 4. Gọi hàm greet() để đọc câu chào ban đầu (đây là một cuộc gọi "chỉ đọc", miễn phí)
  let currentGreeting = await greeter.greet();
  console.log(`Câu chào ban đầu: "${currentGreeting}"`);

  // 5. Gửi một giao dịch để gọi hàm setGreeting() và thay đổi câu chào
  console.log('Đang gửi giao dịch để thay đổi câu chào thành "Hola, mundo!"...');
  const tx = await greeter.setGreeting("Hola, mundo!");

  // 6. Chờ cho giao dịch được xác nhận trên blockchain
  await tx.wait();
  console.log("Giao dịch đã được xác nhận.");

  // 7. Gọi lại hàm greet() để kiểm tra xem câu chào đã được cập nhật chưa
  currentGreeting = await greeter.greet();
  console.log(`Câu chào mới: "${currentGreeting}"`);
}

// Xử lý khi chạy script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
