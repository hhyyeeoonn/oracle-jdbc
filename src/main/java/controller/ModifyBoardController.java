package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;


@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	private BoardService boardService;
	// 글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		this.boardService = new BoardService();
		Board board = boardService.getSelectBoardOne(boardNo);
		request.setAttribute("board", board);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/board/modifyBoard.jsp").forward(request, response);		
	}

	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}

		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String memberId = request.getParameter("memberId");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new Board();
		board.setMemberId(memberId);
		board.setBoardTitle(title);
		board.setBoardContent(content);
		board.setBoardNo(boardNo);
		
		BoardService boardService = new BoardService();
		int modifyRow = boardService.getUpdateBoard(board);
		if(modifyRow == 1) { // 글 수정 완료
			System.out.println("ModifyBoardController: 글 수정완료");
			response.sendRedirect(request.getContextPath() + "/board/boardOne?boardNo=" + boardNo);
		}
	}

}
