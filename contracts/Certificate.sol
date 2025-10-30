// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Certificate
 * @dev Hợp đồng này dùng để tạo và quản lý các chứng chỉ dưới dạng NFT (ERC721).
 *      Mỗi chứng chỉ là một token duy nhất với một URI siêu dữ liệu riêng biệt.
 *      Chỉ chủ sở hữu hợp đồng mới có quyền cấp phát (mint) chứng chỉ mới.
 * This contract is for creating and managing certificates as NFTs (ERC721).
 * Each certificate is a unique token with a distinct metadata URI.
 * Only the contract owner has the authority to mint new certificates.
 */
contract Certificate is ERC721URIStorage, Ownable {
    // Biến đếm để tạo ID tự động tăng cho mỗi token mới.
    // A counter to generate auto-incrementing IDs for each new token.
    uint256 private _nextTokenId;

    /**
     * @dev Hàm khởi tạo, được gọi khi hợp đồng được triển khai.
     *      Nó đặt tên và ký hiệu cho bộ sưu tập NFT, và chỉ định chủ sở hữu ban đầu.
     * The constructor, called when the contract is deployed.
     * It sets the name and symbol for the NFT collection and assigns the initial owner.
     * @param initialOwner Địa chỉ của người sẽ là chủ sở hữu đầu tiên của hợp đồng.
     *                     The address of the initial owner of the contract.
     */
    constructor(address initialOwner)
        ERC721("Certificate", "CERT")
        Ownable(initialOwner)
    {}

    /**
     * @dev Cấp phát một chứng chỉ (NFT) mới cho một địa chỉ.
     *      Chỉ có thể được gọi bởi chủ sở hữu hợp đồng.
     * Mints a new certificate (NFT) and assigns it to an address.
     * Can only be called by the contract owner.
     * @param to Địa chỉ của người nhận chứng chỉ. The address of the recipient.
     * @param uri Chuỗi URI trỏ đến siêu dữ liệu của chứng chỉ (ví dụ: JSON file trên IPFS).
     *            The URI string that points to the certificate's metadata (e.g., a JSON file on IPFS).
     */
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
}
