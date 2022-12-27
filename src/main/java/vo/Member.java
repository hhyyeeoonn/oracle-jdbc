package vo;

public class Member {
	private String memberId;
	private int memberPw;
	private String memberName;
	private String updatedate;
	private String createdate;
	
	public Member() {}

	public Member(String memberId, int memberPw, String memberName, String updatedate, String createdate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", updatedate=" + updatedate + ", createdate=" + createdate + "]";
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(int memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
