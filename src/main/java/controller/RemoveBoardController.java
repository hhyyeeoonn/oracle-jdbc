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

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 세션 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
	
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		
		Board board = new Board();
		board.setMemberId(loginMember.getMemberId());
		board.setBoardNo(boardNo);
		
		BoardService boardService = new BoardService();
		int deleteRow = boardService.getDeleteBoard(board);
		if(deleteRow == 1) { // 글 삭제 완료
			System.out.println("DeleteBoardController: 글 삭제완료");
			response.sendRedirect(request.getContextPath() + "/board/boardList");
		}
		
		
		
	}
}
