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
			
			// jstl 서블릿으로
//			List<String> list = new ArrayList<String>();
//			list.add("aaa");
//			list.add("bbb");
//			list.add("ccc");
//			
//			request.setAttribute("list", list);
			
//			System.out.println("dafdkj");
			
			String page = request.getParameter("page");
			if( page == null ) {
				
			}
			
			List<FreeBoardDTO> list = dao.selectALL();
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/index.jsp");
			rd.forward(request, response);
		}
		
		else if(url.equals("/insert.ws")) {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/insert.jsp");
			rd.forward(request, response);
			
		}
		
		else if (url.equals("/insertproc.ws")) {
			try {
				FreeBoardDTO dto = new FreeBoardDTO(0,
												request.getParameter("title"),
												request.getParameter("content"),
												null,
												null);
				dao.insertFreeBoard(dto);
			} catch (Exception e) {

			}			
			response.sendRedirect("index.ws"); // rd.forward 대신 사용
		}
		
		else if (url.equals("/delete.ws")) {
			String[] idx = request.getParameterValues("idx");
			
			for(int i = 0; i < idx.length; i++) {
				System.out.println("idx[i] = " + idx[i]);
			}
			
			try {
				dao.deleteALL(idx);
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("index.ws");
		}
		
		else if(url.equals("/update.ws")) {
			FreeBoardDTO dto = dao.selectOne(request.getParameter("idx"));
			request.setAttribute("dto", dto);
			
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/update.jsp");
			rd.forward(request, response);
			
		}
		
		else if (url.equals("/updateproc.ws")) {
			FreeBoardDTO dto = new FreeBoardDTO(
							Integer.parseInt(request.getParameter("idx")), 
							request.getParameter("title"), 
							request.getParameter("content"),
							null,
							null);
			
			dao.updateFreeBoard(dto);
			
			response.sendRedirect("index.ws");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
