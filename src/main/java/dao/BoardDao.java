package dao;

import java.sql.*;
import java.util.*;
import vo.Board;

public class BoardDao {
	
	public ArrayList<Board> selectBoardListByPage(Connection conn, String word, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String searchWord = "%"+word+"%"; 
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id, createdate"
				+ " FROM (SELECT board_no, board_title, member_id, createdate"
				+ " FROM board ORDER BY TO_NUMBER(board_no) DESC))"
				+ " WHERE board_title LIKE ? AND rnum BETWEEN ? AND ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, searchWord);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate").substring(0, 10));
			list.add(b);
		}
		rs.close();
		stmt.close();
		System.out.println("BoardListController");
		return list;
	}
	
	public Board selectBoardOne(Connection conn, int boardNo) throws Exception {
		Board selectBoard = null;
		String sql = "SELECT board_no boardNo"
				+ ", board_title boardTitle"
				+ ", board_content boardContent"
				+ ", member_id memberId"
				+ ", createdate"
				+ " FROM board"
				+ " WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			selectBoard = new Board();
			selectBoard.setBoardNo(rs.getInt("boardNo"));
			selectBoard.setBoardTitle(rs.getString("boardTitle"));
			selectBoard.setBoardContent(rs.getString("boardContent"));
			selectBoard.setMemberId(rs.getString("memberId"));
			selectBoard.setCreatedate(rs.getString("createdate").substring(0, 10));
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
				+ ")";
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
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
}
