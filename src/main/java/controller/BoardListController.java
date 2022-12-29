package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardList") // 요청맵핑 요청값
public class BoardListController extends HttpServlet {
   private BoardService boardService;
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   // 세션 확인
	   HttpSession session = request.getSession();
	   Member loginMember = (Member)session.getAttribute("loginMember");
	   if(loginMember == null) {
		   response.sendRedirect(request.getContextPath() + "/member/login");
		   return;
	   }
		
	   int currentPage = 1;
	   if(request.getParameter("currentPage") != null) {
		   currentPage = Integer.parseInt(request.getParameter("currentPage"));
	   }
		  
	   int rowPerPage = 10;
	   if(request.getParameter("rowPerPage") != null) {
		   rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	   }
	   
	   int beginRow = (currentPage - 1) * rowPerPage + 1; // 한페이지의 시작 n페이지의 첫 번째 글
       int endRow = beginRow + rowPerPage - 1; // n페이지의 마지막 글
	   
	   request.setCharacterEncoding("utf-8");
	   String word = request.getParameter("word");
	   if(word == null) {
		   word = "";
	   }
	   
	   this.boardService = new BoardService();
	   
	   ArrayList<Board> list = boardService.getBoardListByPage(word, currentPage, rowPerPage);
	   request.setAttribute("boardList", list);
	   request.setAttribute("word", word);
	   request.setAttribute("currentPage", currentPage); // view에서 필요
	   request.setAttribute("rowPerPage", rowPerPage); // view에서 필요
		/*
		 * VIEW 메뉴구성
		 * 1) 글입력
		 * 2) 글상세보기
		 */
	   System.out.println("BoardListController: word:" + word + "/rowPerPage:" + rowPerPage);
	   request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}
}