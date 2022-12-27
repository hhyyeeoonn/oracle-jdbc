package service;

import java.sql.Connection;
import java.sql.SQLException;

import vo.Member;
import dao.MemberDao;
import util.DBUtil;


public class MemberService {
	private MemberDao memberDao;
	public Member getLoginMember(Member member) {
		Member loginMember = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			loginMember = memberDao.loginMember(conn, loginMember);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}
	
	public int getInsertMember (Member member) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.insertMember(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int getUpdateMember (Member member) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.updateMember(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int getDeleteMember (Member member) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.memberDao = new MemberDao();
			row = memberDao.deleteMember(conn, member);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}
