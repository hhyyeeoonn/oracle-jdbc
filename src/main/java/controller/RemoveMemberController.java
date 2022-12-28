package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

import vo.Member;

import service.MemberService;

@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	// 회원탈퇴 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/removeMember.jsp
		 * 
		 */
		// 로그인 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { 
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		// View
	    request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}

	// 회원 탈퇴 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 요청 /member/logout <- 컨트롤러 요청
		 * 
		 */
		// 로그인 확인
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { 
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		
		int pw = Integer.parseInt(request.getParameter("pw"));
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		member.setMemberPw(pw);
		
		MemberService memberService = new MemberService();
		int deleteRow = memberService.getDeleteMember(member);
		if(deleteRow == 1) {
			System.out.println("RemoveMemberController: memberId: " + loginMember.getMemberId() + " 탈퇴완료");
		}
		response.sendRedirect(request.getContextPath() + "/member/logout");
	}
}
