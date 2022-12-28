package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Board;
import vo.Member;
import service.BoardService;

@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {
	private BoardService boardService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW 메뉴구성
		 * 1) 글 수정(로그인멤버 == 글쓴멤버)
		 * 2) 글 삭제(로그인멤버 == 글쓴멤버)
		 */
		
		// 세션 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		
		//String memberId = 세션에 저장되어 있는 멤버아이디 가져오기
		int no = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new Board();
		board.setBoardNo(no);
		//board.setMemberId();
		
		this.boardService = new BoardService();
		Board boardOne = boardService.getSelectBoardOne(board);
		request.setAttribute("boardOne", boardOne);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
	}

}
