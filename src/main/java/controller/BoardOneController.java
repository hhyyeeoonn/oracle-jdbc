package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Board;

import service.BoardService;

@WebServlet("/BoardOneController")
public class BoardOneController extends HttpServlet {
	private BoardService boardService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String memberId = 세션에 저장되어 있는 멤버아이디 가져오기
		int no = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new Board();
		board.setBoardNo(no);
		//board.setMemberId();
		
		this.boardService = new BoardService();
		Board boardOne = boardService.getSelectBoardOne(board);
		request.setAttribute("boardOne", boardOne);
		
		 request.getRequestDispatcher("/WEB-INF/view/boardOne.jsp").forward(request, response);
	}

}
