package spp.service;

import java.util.List;

import spp.model.Education;

public interface EducationService
{
	public void save(Education education);
	
	String addEducation(Education education, int studentId);
    List<Education> getEducationByStudentId(int studentId);
    String updateEducation(Education education);
    
    
	

}
