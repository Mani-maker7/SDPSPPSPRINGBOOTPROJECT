package spp.service;

import java.util.List;

import spp.model.Master;
import spp.model.Project;
import spp.model.Student;

public interface MasterService 
{
	
	 public String addnewmaster(Master master);
	 
	 List<Master> getAllMasters();

	Master getMasterById(int masterId);
	
	public Master checkMasterLogin(String email,String password);
	
	Master findById(Integer masterId);
	
    List<Student> getAssignedStudents(Integer masterId);
    




}
