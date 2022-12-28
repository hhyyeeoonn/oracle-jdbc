package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class GetMemberController
 */
@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WWB-INF/member/memberOne.jsp
		 * 메뉴구성
		 * 1) 회원정보 수정
		 * 2) 회원탈퇴
		 * 
		 */
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인 안되어있을 경우
			response.sendRedirect(request.getContextPath() + "/member/login");
		}
		
		String memberId = loginMember.getMemberId();
		
		MemberService memberService = new MemberService();
		Member selectMember = new Member();
		selectMember = memberService.getSelectMember(memberId);
		request.setAttribute("selectMember", selectMember);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp").forward(request, response);
	}
}
