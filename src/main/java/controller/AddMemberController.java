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
		
		// 아이디 중복일 때
		String idMsg = request.getParameter("idMsg");
		if(idMsg != "") {
			request.setAttribute("idMsg", idMsg);
		}
		
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	}

	// 회원가입 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // post 방식으로 요청
		/*
		 * redirect -> get방식 요청 /member/login <- 컨트롤러 요청
		 * 
		 */
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("newId");
		int pw = Integer.parseInt(request.getParameter("newPw"));
		String name = request.getParameter("newName");
		
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPw(pw);
		member.setMemberName(name);

		String msg = "welcome!"; // login.jsp에 알림창을 띄우기 위한 msg
		String idMsg = "check";
		this.memberService = new MemberService();
		int checkId = memberService.getCheckMemberId(member.getMemberId());
		int memberRow = memberService.getInsertMember(member);
		
		if(checkId == 1) {
			response.sendRedirect(request.getContextPath() + "/member/addMember?idMsg=" + idMsg);
			return;
		}
		if(memberRow == 1) { // 가입완료
			System.out.println("AddMemberController: 회원가입완료");
			response.sendRedirect(request.getContextPath() + "/member/login?msg=" + msg);
		}
	}
}
