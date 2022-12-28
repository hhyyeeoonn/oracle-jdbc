package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;
import service.MemberService;

/**
 * Servlet implementation class ModifyMemberController
 */
@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	private MemberService memberService;
	// 회원 수정폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> WEB-INF/view/member/memberOne.jsp
		 * 
		 */
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인 안되어있을 경우
			response.sendRedirect(request.getContextPath() + "/member/login");
		}
		
		String memberId = loginMember.getMemberId();
		
		this.memberService = new MemberService();
		Member selectMember = new Member();
		selectMember = memberService.getSelectMember(memberId);
		request.setAttribute("selectMember", selectMember);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}

	// 회원정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 요청 /member/memberOne?key=값 <- 컨트롤러 요청
		 * 
		 */
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그인 안되어있을 경우
			response.sendRedirect(request.getContextPath() + "/member/home");
		}
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		Member member = new Member();
		member.setMemberId(loginMember.getMemberId());
		member.setMemberPw(pw);
		member.setMemberName(name);
		
		this.memberService = new MemberService();
		int updateRow = memberService.getUpdateMember(member);
		if(updateRow == 1) {
			System.out.println("ModifyMemberController: 회원정보수정완료");
		}
		response.sendRedirect(request.getContextPath() + "/member/memberOne");
	}

}
