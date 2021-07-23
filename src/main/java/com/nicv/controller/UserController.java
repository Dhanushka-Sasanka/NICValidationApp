package com.nicv.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nicv.service.UserService;
import com.nicv.service.impl.UserServiceImpl;
import com.nicv.model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns = { "/user/new", "/user/insert", "/user/delete", "/user/update",
		"/user/edit", "/user/list" })
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
    	 this.userService = new UserServiceImpl();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		
		System.out.print(action);
		
		switch (action) {
		case "/user/insert":
			try {
				insertUser(request, response);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			break;
			
		default:
//			listUser(request, response);
			break;
			
		case "/user/delete":
			try {
				deleteUser(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "/user/edit":
			try {
				showEditForm(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "/user/update":
			try {
				updateUser(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		case "/user/list":
			try {
				listUser(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws FileNotFoundException, SQLException, Exception {
		
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String nationality = request.getParameter("nationality");
		String nic = request.getParameter("nic");
		String dateOfBirth = request.getParameter("dateOfBirth");
		SimpleDateFormat availDate = new SimpleDateFormat("yyyy-MM-dd");
		Date chosenDate = availDate.parse(dateOfBirth);
		String age = request.getParameter("age");
		int parsedAge = Integer.parseInt(age);
		String gender = request.getParameter("gender");
		User newUser = new User(0L, username , address, nationality,nic,chosenDate,parsedAge,gender);
		System.out.println(newUser);
		boolean isUserAdded = userService.addUser(newUser);
		PrintWriter out = response.getWriter();
		out.print(isUserAdded);
		
	}
	
	public void listUser(HttpServletRequest request, HttpServletResponse response)
			throws FileNotFoundException, SQLException, Exception {
		List<User> listUsers;

		listUsers = userService.getUsers();
		request.setAttribute("listUsers", listUsers);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/list-users.jsp");
		dispatcher.forward(request, response);

	}
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		User existingUser = userService.getUserByID(Long.parseLong(id));
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/users.jsp");
		request.setAttribute("existingUser", existingUser);
		
		dispatcher.forward(request, response);

	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userID = request.getParameter("userID");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String nationality = request.getParameter("nationality");
		String nic = request.getParameter("nic");
		String dateOfBirth = request.getParameter("dateOfBirth");
		SimpleDateFormat availDate = new SimpleDateFormat("yyyy-MM-dd");
		Date chosenDate = availDate.parse(dateOfBirth);
		String age = request.getParameter("age");
		int parsedAge = Integer.parseInt(age);
		
		String gender = request.getParameter("gender");
	
		User updateUser = new User(Long.parseLong(userID), username , address, nationality,nic,chosenDate,parsedAge,gender);

		userService.updateUser(updateUser.getUserID(), updateUser);
		response.sendRedirect("list");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		userService.removeUser(Long.parseLong(id));
		response.sendRedirect("list");

	}

}
