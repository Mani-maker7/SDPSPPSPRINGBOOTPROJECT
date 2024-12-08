package spp.service;

import java.util.List;

import spp.model.Student;

public interface StudentService 
{
	public String studentRegistration(Student student);
	public Student checkStudentLogin(String email,String password);
	
	public String updateStudent(Student student);
	
	//void assignStudentToMaster(int studentId, int masterId);
	
	List<Student> getAllStudents();
	Student getStudentById(int studentId);
	void saveStudent(Student student);
	
	

}
