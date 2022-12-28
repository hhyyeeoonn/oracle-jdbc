package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;
import vo.Board;
import service.BoardService;

@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	private BoardService boardService;
	// 글쓰기 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/board/addBoard.jsp").forward(request, response);
	}

	// 글쓰기 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		Board board = new Board();
		board.setBoardTitle(title);
		board.setBoardContent(content);
		board.setMemberId(memberId);
		
		BoardService boardService = new BoardService();
		int addRow = boardService.getInsertBoard(board);
		
		if(addRow == 1) { // 새글 등록 완료
			System.out.println("AddBoardController: 새 글 등록완료");
			response.sendRedirect(request.getContextPath() + "/board/boardList");
		}
	}
}
