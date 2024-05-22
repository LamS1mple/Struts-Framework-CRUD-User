package com.mkyong.common.form;
 
import javax.servlet.http.HttpServletRequest;
 
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
 
public class UserForm extends ActionForm{
 
	int id;
	
	String name;
	
	String birday;
	
	String phoneNumber;

	
 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirday() {
		return birday;
	}

	public void setBirday(String birday) {
		this.birday = birday;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public ActionErrors validate(ActionMapping mapping,
	HttpServletRequest request) {
 
	   ActionErrors errors = new ActionErrors();
 
	    if( name == null || ("".equals( name ))) {
	       errors.add("common.name.err",
                         new ActionMessage("error.common.name.required"));
	    }
 
	    return errors;
	}
 
	@Override
	public String toString() {
		return "UserForm [id=" + id + ", name=" + name + ", birday=" + birday + ", phoneNumber=" + phoneNumber + "]";
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// reset properties
		name = "";
	}
	
 
}