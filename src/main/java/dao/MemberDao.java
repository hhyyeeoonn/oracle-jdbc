package dao;

import vo.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class MemberDao {
	public Member loginMember(Connection conn, Member member) throws Exception {
		Member loginMember = null;
		String sql = "SELECT member_id memberId, member_name"
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
	
	public int insertMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql ="INSERT INTO member ("
				+ "member_id, member_pw, member_name, createdate, updatedate"
				+ ") VALUES ("
				+ "?, ?, ?, sysdate, sysdate"
				+ ");";
		PreparedStatement stmt = conn.prepareStatement(sql);
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	public int updateMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql = "UPDATE member SET member_name = ?"
				+ "	WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setInt(2, member.getMemberPw());
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
		stmt.close();
		return row;
	}
}
