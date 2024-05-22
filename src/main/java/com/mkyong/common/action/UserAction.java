package com.mkyong.common.action;
 
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.MappingDispatchAction;

import com.mkyong.common.DAO.UserDAO;
import com.mkyong.common.form.UserForm;

 
public class UserAction extends MappingDispatchAction{
	
	private UserDAO userDAO;
 
	public ActionForward getAllUser(ActionMapping mapping,ActionForm form,
		HttpServletRequest request,HttpServletResponse response) {

		userDAO = new UserDAO();
		List<UserForm> list = userDAO.getAll();
		request.setAttribute("listUser", list);
		
		return mapping.findForward("success");
	   
	}
 
	public ActionForward deleteUser(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
		
		return getAllUser(mapping, form, request, response);
		
	}
	
	public ActionForward addAndEditUser(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) {
		UserForm userForm = new UserForm();
		System.out.println(1234);
		userDAO = new UserDAO();

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String phone = request.getParameter("phone");
		userForm.setId(id);
		userForm.setName(name);
		userForm.setPhoneNumber(phone);
		userForm.setBirday(dob);
		System.out.println(userForm);

		userDAO.addAndEditUser(userForm);

		
		
		return getAllUser(mapping, form, request, response);
		
	}
	
	public ActionForward formAddEdit(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) {
		System.out.println(123);
		UserForm userForm ;
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			userDAO = new UserDAO();
			userForm = userDAO.getUser(id);
			System.out.println(userForm);

		} catch (Exception e) {
			userForm = new UserForm();
			userForm.setId(0);
			userForm.setName("");
			userForm.setPhoneNumber("");
			userForm.setBirday("");
			// TODO: handle exception
		}
		request.setAttribute("user",userForm);



		
		
		return mapping.findForward("success");
		
	}
	
}