package service;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService { // db접근 로직 외에 모든 것은 service에서 처리하는 것이 좋다
	private BoardDao boardDao;
	
	public ArrayList<Board> getBoardListByPage(String word, int currentPage, int rowPerPage) {
		/*
		 	1) connection 생성 <- DBUtil.class
		 	2) beginRowm endRow 생성 <- currentPage와 rowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
	         conn = DBUtil.getConnection();
	         int beginRow = (currentPage - 1) * rowPerPage + 1; // 한페이지의 시작 페이지
	         int endRow = beginRow + rowPerPage - 1;
	         this.boardDao = new BoardDao();
	         list = boardDao.selectBoardListByPage(conn, word, beginRow, endRow);
	         conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
	      } catch (Exception e) {
	         try {
	            conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
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
		System.out.println("BoardListController");
	    return list;
	}
	
	public Board getSelectBoardOne(int boardNo) {
		Board selectBoard = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.boardDao = new BoardDao();
			selectBoard = new Board();
			selectBoard = boardDao.selectBoardOne(conn, boardNo);
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
		return selectBoard;
	}
	
	public int getInsertBoard(Board board) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.insertBoard(conn, board);
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
	
	public int getUpdateBoard(Board board) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.updateBoard(conn, board);
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
	
	public int getDeleteBoard(Board board) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			row = boardDao.deleteBoard(conn, board);
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
