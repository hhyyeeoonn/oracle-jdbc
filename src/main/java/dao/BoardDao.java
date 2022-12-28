package dao;

import java.sql.*;
import java.util.*;
import vo.Board;

public class BoardDao {
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, t.board_no, t.board_title, t.member_id, t.createdate"
				+ "			FROM (SELECT board_no, board_title, member_id, createdate"
				+ "					FROM board ORDER BY board_no DESC) t) t2" // 첫번째 셀렉트 글의 순서를 만들어 rnum 붙이기 
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?; 같은 표현인데 BETWEEN쓰는 게 더 좋다
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		rs.close();
		stmt.close();
		return list;
	}
	
	public Board selectBoardOne(Connection conn, Board board) throws Exception {
		Board selectBoard = null;
		String sql = "SELECT board_no boardNo"
				+ ", board_title boardTitle"
				+ ", board_content boardContent"
				+ ", createdate"
				+ " FROM board"
				+ " WHERE board_no = ? AND member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
		stmt.setString(2, board.getMemberId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			selectBoard = new Board();
			selectBoard.setBoardNo(rs.getInt("boardNo"));
			selectBoard.setBoardTitle(rs.getString("boardTitle"));
			selectBoard.setBoardContent(rs.getString("boardContent"));
			selectBoard.setCreatedate(rs.getString("createdate"));
		}
		stmt.close();
		rs.close();
		return selectBoard;
	}
	
	public int insertBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		String sql = "INSERT INTO board ("
				+ "		board_no, board_title, board_content, member_id, updatedate, createdate"
				+ ") VALUES ("
				+ "		board_seq.nextval, ?, ?, ?, sysdate, sysdate"
				+ ");";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	public int updateBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		String sql = "UPDATE board SET board_title = ?"
				+ ", board_content = ?"
				+ " WHERE member_id = ? AND board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		stmt.setInt(4, board.getBoardNo());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}

	public int deleteBoard(Connection conn, Board board) throws Exception {
		int row = 0;
		String sql = "DELETE FROM board"
				+ " WHERE board_no =? AND member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
		stmt.setString(2, board.getMemberId());
		stmt.close();
		return row;
	}
}
