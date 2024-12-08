package spp.service;

import java.util.List;

import spp.model.Admin;
import spp.model.Master;
import spp.model.Project;
import spp.model.Student;

public interface AdminService
{
	public List<Student> viewallStudents();
	public Admin checkAdminLogin(String aemail, String pwd);
	public long studentcount();
	
	public String deletestudents(int id);
	//public Student displayStudentById(int id);
	
	//masters
	public List<Master> viewallMasters();
	public String deletemasters(int id);
	
	void updateProject(Project project);
    void deleteProject(int projectId);
	
}
