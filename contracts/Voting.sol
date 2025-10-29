// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Voting
 * @dev Hợp đồng thông minh để quản lý một cuộc bỏ phiếu với nhiều ứng cử viên.
 * Người tạo hợp đồng sẽ là quản trị viên (owner) duy nhất có quyền:
 * - Thêm ứng cử viên trước khi cuộc bỏ phiếu bắt đầu.
 * - Bắt đầu cuộc bỏ phiếu.
 * - Kết thúc cuộc bỏ phiếu.
 * Bất kỳ ai cũng có thể bỏ phiếu, nhưng mỗi người chỉ được bỏ phiếu một lần.
 */
contract Voting {
    // --- Biến và Cấu trúc Dữ liệu ---

    // Địa chỉ của người quản lý hợp đồng
    address public owner;

    // Trạng thái của cuộc bỏ phiếu
    enum VotingStatus {
        NotStarted, // Chưa bắt đầu
        Running,    // Đang diễn ra
        Ended       // Đã kết thúc
    }
    VotingStatus public votingStatus;

    // Cấu trúc để lưu thông tin của một ứng cử viên
    struct Candidate {
        uint id;            // Mã định danh duy nhất
        string name;        // Tên ứng cử viên
        string description; // Mô tả ngắn
        uint voteCount;     // Số phiếu bầu nhận được
    }

    // Ánh xạ (mapping) để lưu các ứng cử viên theo ID
    // mapping(id => Candidate)
    mapping(uint => Candidate) public candidates;

    // Bộ đếm để tự động tạo ID cho ứng cử viên mới
    uint public candidatesCount;

    // Ánh xạ để theo dõi xem một địa chỉ đã bỏ phiếu hay chưa
    // mapping(address => bool)
    mapping(address => bool) public voters;

    // --- Sự kiện (Events) ---

    // Sự kiện được phát ra khi một phiếu bầu được thực hiện thành công
    event Voted(address indexed voter, uint indexed candidateId);

    // Sự kiện được phát ra khi trạng thái cuộc bỏ phiếu thay đổi
    event VotingStatusChanged(VotingStatus newStatus);

    // --- Hàm điều chỉnh (Modifiers) ---

    // Chỉ cho phép người quản lý (owner) thực hiện chức năng
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    // Chỉ cho phép thực hiện khi cuộc bỏ phiếu đang ở một trạng thái cụ thể
    modifier atStatus(VotingStatus _status) {
        require(votingStatus == _status, "The voting is not in the required state.");
        _;
    }

    // --- Hàm khởi tạo (Constructor) ---

    // Hàm này được gọi khi hợp đồng được triển khai (deploy)
    // Người triển khai sẽ được gán làm owner
    constructor() {
        owner = msg.sender;
        votingStatus = VotingStatus.NotStarted;
    }

    // --- Chức năng chỉ dành cho Owner ---

    /**
     * @dev Thêm một ứng cử viên mới vào danh sách.
     * Chỉ owner mới có thể gọi và chỉ khi cuộc bỏ phiếu chưa bắt đầu.
     * @param _name Tên của ứng cử viên.
     * @param _description Mô tả ngắn về ứng cử viên.
     */
    function addCandidate(string memory _name, string memory _description) public onlyOwner atStatus(VotingStatus.NotStarted) {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, _description, 0);
    }

    /**
     * @dev Bắt đầu cuộc bỏ phiếu.
     * Chỉ owner mới có thể gọi.
     */
    function startVoting() public onlyOwner atStatus(VotingStatus.NotStarted) {
        require(candidatesCount > 0, "Add at least one candidate before starting.");
        votingStatus = VotingStatus.Running;
        emit VotingStatusChanged(VotingStatus.Running);
    }

    /**
     * @dev Kết thúc cuộc bỏ phiếu.
     * Chỉ owner mới có thể gọi.
     */
    function endVoting() public onlyOwner atStatus(VotingStatus.Running) {
        votingStatus = VotingStatus.Ended;
        emit VotingStatusChanged(VotingStatus.Ended);
    }

    // --- Chức năng công khai (Public Functions) ---

    /**
     * @dev Thực hiện bỏ phiếu cho một ứng cử viên.
     * Bất kỳ ai cũng có thể gọi, miễn là cuộc bỏ phiếu đang diễn ra.
     * Mỗi người chỉ được bỏ phiếu một lần.
     * @param _candidateId ID của ứng cử viên muốn bỏ phiếu.
     */
    function vote(uint _candidateId) public atStatus(VotingStatus.Running) {
        // Kiểm tra xem người này đã bỏ phiếu chưa
        require(!voters[msg.sender], "You have already voted.");
        // Kiểm tra xem ID ứng cử viên có hợp lệ không
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        // Đánh dấu người này đã bỏ phiếu
        voters[msg.sender] = true;
        // Tăng số phiếu cho ứng cử viên
        candidates[_candidateId].voteCount++;

        // Phát ra sự kiện
        emit Voted(msg.sender, _candidateId);
    }

    /**
     * @dev Tìm và trả về người chiến thắng.
     * Bất kỳ ai cũng có thể gọi, nhưng chỉ có ý nghĩa sau khi cuộc bỏ phiếu kết thúc.
     * Nếu có nhiều người bằng phiếu nhau, hàm sẽ trả về người đầu tiên trong danh sách.
     * @return winnerId ID của người chiến thắng.
     * @return winnerName Tên của người chiến thắng.
     * @return winnerVoteCount Số phiếu của người chiến thắng.
     */
    function getWinner() public view returns (uint winnerId, string memory winnerName, uint winnerVoteCount) {
        require(votingStatus == VotingStatus.Ended, "The voting has not ended yet.");

        uint highestVoteCount = 0;
        uint winningCandidateId = 0;

        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > highestVoteCount) {
                highestVoteCount = candidates[i].voteCount;
                winningCandidateId = i;
            }
        }

        require(winningCandidateId > 0, "No winner could be determined.");

        Candidate storage winner = candidates[winningCandidateId];
        return (winner.id, winner.name, winner.voteCount);
    }
}
