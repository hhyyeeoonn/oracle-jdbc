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
		return loginMember;
	}
	
	public int insertMember(Connection conn, Member member) throws Exception {
		int row = 0;
		String sql ="INSERT INTO member ("
				+ "member_id, member_pw";
		
		return row;
	}
	
}
