// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Voting
 * @author Jules
 * @notice Hợp đồng này quản lý một cuộc bỏ phiếu đơn giản với nhiều ứng cử viên.
 * This contract manages a simple voting process with multiple candidates.
 * @dev The contract owner can add candidates, start the vote, and end the vote.
 * Anyone can vote, but only once.
 */
contract Voting {
    // --- State Variables ---

    /**
     * @notice Địa chỉ của người quản lý hợp đồng (owner).
     * The address of the contract administrator (owner).
     */
    address public owner;

    /**
     * @notice Các trạng thái có thể có của cuộc bỏ phiếu.
     * The possible states of the voting process.
     * - NotStarted: Cuộc bỏ phiếu chưa được bắt đầu. The vote has not started.
     * - Running: Cuộc bỏ phiếu đang diễn ra. The vote is in progress.
     * - Ended: Cuộc bỏ phiếu đã kết thúc. The vote has ended.
     */
    enum VotingStatus {
        NotStarted,
        Running,
        Ended
    }

    /**
     * @notice Trạng thái hiện tại của cuộc bỏ phiếu.
     * The current status of the voting process.
     */
    VotingStatus public votingStatus;

    /**
     * @notice Cấu trúc dữ liệu để lưu trữ thông tin của một ứng cử viên.
     * Data structure to store information about a candidate.
     */
    struct Candidate {
        uint id;            // ID duy nhất / Unique ID
        string name;        // Tên / Name
        string description; // Mô tả / Description
        uint voteCount;     // Số phiếu bầu / Vote count
    }

    /**
     * @notice Ánh xạ (mapping) từ ID ứng cử viên đến thông tin chi tiết của họ.
     * Mapping from a candidate's ID to their detailed information.
     */
    mapping(uint => Candidate) public candidates;

    /**
     * @notice Tổng số ứng cử viên đã được thêm.
     * The total number of candidates added.
     */
    uint public candidatesCount;

    /**
     * @notice Ánh xạ (mapping) để theo dõi các địa chỉ đã bỏ phiếu.
     * Mapping to track which addresses have already voted.
     */
    mapping(address => bool) public voters;

    // --- Events ---

    /**
     * @notice Sự kiện được phát ra khi một phiếu bầu được ghi nhận thành công.
     * Emitted when a vote is successfully cast.
     * @param voter Địa chỉ của người bỏ phiếu. The address of the voter.
     * @param candidateId ID của ứng cử viên được bỏ phiếu. The ID of the voted candidate.
     */
    event Voted(address indexed voter, uint indexed candidateId);

    /**
     * @notice Sự kiện được phát ra khi trạng thái của cuộc bỏ phiếu thay đổi.
     * Emitted when the voting status changes.
     * @param newStatus Trạng thái mới của cuộc bỏ phiếu. The new status of the vote.
     */
    event VotingStatusChanged(VotingStatus newStatus);

    // --- Modifiers ---

    /**
     * @dev Modifier để giới hạn quyền truy cập chỉ cho chủ sở hữu (owner) của hợp đồng.
     * Sẽ hoàn tác (revert) nếu người gọi không phải là owner.
     * Modifier to restrict access to the contract owner only.
     * Reverts if the caller is not the owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    /**
     * @dev Modifier để yêu cầu cuộc bỏ phiếu phải đang ở một trạng thái cụ thể.
     * Sẽ hoàn tác (revert) nếu trạng thái hiện tại không khớp.
     * Modifier to require the voting to be in a specific state.
     * Reverts if the current status does not match.
     * @param _status Trạng thái yêu cầu. The required status.
     */
    modifier atStatus(VotingStatus _status) {
        require(votingStatus == _status, "The voting is not in the required state.");
        _;
    }

    // --- Constructor ---

    /**
     * @dev Hàm khởi tạo, được gọi một lần khi hợp đồng được triển khai.
     *      Nó gán người triển khai làm chủ sở hữu (owner) và đặt trạng thái ban đầu là NotStarted.
     * Constructor, called once when the contract is deployed.
     * It assigns the deployer as the owner and sets the initial status to NotStarted.
     */
    constructor() {
        owner = msg.sender;
        votingStatus = VotingStatus.NotStarted;
    }

    // --- Owner-Only Functions ---

    /**
     * @notice (Owner only) Thêm một ứng cử viên mới.
     * (Owner only) Adds a new candidate.
     * @dev Chỉ có thể được gọi bởi owner và khi cuộc bỏ phiếu chưa bắt đầu.
     * Can only be called by the owner and when the voting has not started.
     * @param _name Tên của ứng cử viên. The name of the candidate.
     * @param _description Mô tả về ứng cử viên. The description of the candidate.
     */
    function addCandidate(string memory _name, string memory _description) public onlyOwner atStatus(VotingStatus.NotStarted) {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, _description, 0);
    }

    /**
     * @notice (Owner only) Bắt đầu cuộc bỏ phiếu.
     * (Owner only) Starts the voting process.
     * @dev Chỉ có thể được gọi bởi owner và khi cuộc bỏ phiếu chưa bắt đầu.
     * Phải có ít nhất một ứng cử viên đã được thêm.
     * Can only be called by the owner when the voting has not started.
     * Requires at least one candidate to have been added.
     */
    function startVoting() public onlyOwner atStatus(VotingStatus.NotStarted) {
        require(candidatesCount > 0, "Add at least one candidate before starting.");
        votingStatus = VotingStatus.Running;
        emit VotingStatusChanged(VotingStatus.Running);
    }

    /**
     * @notice (Owner only) Kết thúc cuộc bỏ phiếu.
     * (Owner only) Ends the voting process.
     * @dev Chỉ có thể được gọi bởi owner và khi cuộc bỏ phiếu đang diễn ra.
     * Can only be called by the owner when the voting is running.
     */
    function endVoting() public onlyOwner atStatus(VotingStatus.Running) {
        votingStatus = VotingStatus.Ended;
        emit VotingStatusChanged(VotingStatus.Ended);
    }

    // --- Public Functions ---

    /**
     * @notice Bỏ phiếu cho một ứng cử viên.
     * Casts a vote for a candidate.
     * @dev Mỗi địa chỉ chỉ có thể bỏ phiếu một lần.
     * ID ứng cử viên phải hợp lệ.
     * Cuộc bỏ phiếu phải đang diễn ra.
     * Each address can only vote once.
     * The candidate ID must be valid.
     * The voting must be in the Running state.
     * @param _candidateId ID của ứng cử viên bạn muốn bỏ phiếu. The ID of the candidate you want to vote for.
     */
    function vote(uint _candidateId) public atStatus(VotingStatus.Running) {
        require(!voters[msg.sender], "You have already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        emit Voted(msg.sender, _candidateId);
    }

    /**
     * @notice Lấy thông tin người chiến thắng sau khi cuộc bỏ phiếu kết thúc.
     * Gets the winner's information after the vote has ended.
     * @dev Chỉ có thể được gọi khi cuộc bỏ phiếu đã kết thúc.
     * Nếu có nhiều người bằng phiếu, người có ID nhỏ hơn sẽ được trả về.
     * Can only be called when the vote has ended.
     * In case of a tie, the candidate with the lower ID who appears first in the loop is returned.
     * @return winnerId ID của người chiến thắng. The ID of the winning candidate.
     * @return winnerName Tên của người chiến thắng. The name of the winning candidate.
     * @return winnerVoteCount Số phiếu của người chiến thắng. The vote count of the winning candidate.
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
