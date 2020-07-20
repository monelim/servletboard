package com.mh.org;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mh.org.freeboard.FreeBoardDAO;
import com.mh.org.freeboard.FreeBoardDTO;

@WebServlet(urlPatterns = {"*.ws"}) // {*.ws} 어떤 jsp가 들어와도 이게 돌어가게 된다.
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeBoardDAO dao = new FreeBoardDAO();

    public controller() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURL().toString();
//		System.out.println("url = " + url);		
		url = url.substring(url.lastIndexOf("/"));		
//		System.out.println("url = " + url);
		
		if (url.equals("/a.ws")) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/a.jsp");
			request.setAttribute("hello", "this is servlet");
			rd.forward(request, response);
		}
		else if (url.equals("/b.ws")) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/b.jsp");
			rd.forward(request, response);
		}
		else if (url.equals("/c.ws")) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/c.jsp");
			rd.forward(request, response);
		}
		else if (url.equals("/index.ws")) {
			
			// jst1 서블릿으로
//			List<String> list = new ArrayList<String>();
//			list.add("aaa");
//			list.add("bbb");
//			list.add("ccc");
//			
//			request.setAttribute("list", list);
			
//			System.out.println("dafdkj");
			
			List<FreeBoardDTO> list = dao.selectALL();
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/index.jsp");
			rd.forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
