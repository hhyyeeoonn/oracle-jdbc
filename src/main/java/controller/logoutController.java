package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;


@WebServlet("/member/logout")
public class logoutController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션정보 삭제 : ex) session.invalidate(); 
		 * redirect -> get방식 home <- 컨트롤러 요청
		 * 
		 */
		// 세션 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/member/login");
	}
}
