package dao;

import vo.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {
	public Member loginMember(Connection conn, Member member) throws Exception {
		Member loginMember = null;
		String sql = "SELECT member_id memberId, member_name memberName"
				+ " FROM member"
				+ " WHERE member_id =? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setInt(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) {
			loginMember = new Member();
			loginMember.setMemberId(rs.getString("memberId"));
			loginMember.setMemberName(rs.getString("memberName"));
		}
		rs.close();
		stmt.close();
		return loginMember;
	}
	
	public Member selectMember(Connection conn, String memberId) throws Exception {
		Member resultMember = null;
		String sql = "SELECT member_id memberId"
				+ ", member_name memberName"
				+ ", createdate"
				+ " FROM member"
				+ " WHERE member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultMember = new Member();
			resultMember.setMemberId(rs.getString("memberId"));
			resultMember.setMemberName(rs.getString("memberName"));
			resultMember.setCreatedate(rs.getString("createdate").substring(0, 10));
		}
		stmt.close();
		rs.close();
		return resultMember;
	}
	
	public int insertMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql ="INSERT INTO member ("
				+ "member_id, member_pw, member_name, createdate, updatedate"
				+ ") VALUES ("
				+ "?, ?, ?, sysdate, sysdate"
				+ ")";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setInt(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	public int updateMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql = "UPDATE member SET member_name = ?"
				+ "	WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getMemberId());
		stmt.setInt(3, member.getMemberPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	public int deleteMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql = "DELETE FROM member"
				+ " WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setInt(2, member.getMemberPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
}
