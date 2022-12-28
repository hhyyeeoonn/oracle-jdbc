package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/home") // 맵핑이름 틀리면 톰캣 오류남
public class HomeController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/home.jsp
		 * 
		 * 메뉴구성(로그인 전/후 따라 분기)
		 * 
		 * 로그인 전
		 * 1) 회원가입
		 * 2) 로그인
		 * 
		 * 로그인 후
		 * 1) 로그아웃
		 * 2) 회원정보
		 * 3) 게시판리스트
		 * 
		 */
		
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		// 로그인 전 : loginMember -> null
		// 로그인 후 : LoginMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인 전
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		request.setAttribute("loginMember", loginMember);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/member/home.jsp");
	    rd.forward(request, response);
	}
}
