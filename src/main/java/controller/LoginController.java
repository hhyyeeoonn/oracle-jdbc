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

import service.MemberService;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/login.jsp
		 * 
		 */
		
		// 로그인 전에만 진입가능
	    HttpSession session = request.getSession();

	    Member loginMember = (Member)session.getAttribute("loginMember");
	    if(loginMember != null) { // 이미 로그인 상태
	    	response.sendRedirect(request.getContextPath()+"/home");
	        return;
	    }
	    
	    // 가입 후 넘어왔을 때 가입환영 알림창을 띄우기 위해 msg 넘기기
	    String msg = request.getParameter("msg");
	    if(msg != "") {
	    	request.setAttribute("msg", msg);
	    }
	 
	    // View
	    request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	}

	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 session 정보 : ex) session.setAttribute("loginMember", Member타입)
		 * redirect -> get방식 home <- 컨트롤러 요청
		 * 
		 */
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			response.sendRedirect(request.getContextPath() + "/home");
		}
		
		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));
		String name = request.getParameter("name");
		
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPw(pw);
		member.setMemberName(name);
		
		MemberService memberService = new MemberService();
		Member returnMember = memberService.getLoginMember(member);
		
		if(returnMember == null) { // 로그인 실패
			response.sendRedirect(request.getContextPath() + "/member/login");
			return;
		}
		
		session.setAttribute("loginMember", returnMember); // 세션에 로그인 정보 저장
		response.sendRedirect(request.getContextPath() + "/home");
	}
}
