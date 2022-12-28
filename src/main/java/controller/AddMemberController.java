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

@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet { // Controller를 줄이기 위해 두 개의 메소드를.. 
	private MemberService memberService;
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // get방식으로 요청
		/*
		 * VIEW -> /WEB-INF/view/member/addMember.jsp
		 * 
		 */
		
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}

	// 회원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // post 방식으로 요청
		/*
		 * redirect -> get방식 요청 /member/login <- 컨트롤러 요청
		 * 
		 */
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));
		String name = request.getParameter("name");
		
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPw(pw);
		member.setMemberName(name);

		String msg = "welcome!"; // login.jsp에 알림창을 띄우기 위한 msg
		this.memberService = new MemberService();
		int memberRow = memberService.getInsertMember(member);
		if(memberRow == 1) { // 가입완료
			System.out.println("AddMemberController: 회원가입완료");
			response.sendRedirect(request.getContextPath() + "/member/login?msg=" + msg);
		}
	}
}