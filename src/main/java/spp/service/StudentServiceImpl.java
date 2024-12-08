 package spp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Master;
import spp.model.Project;
import spp.model.Student;
import spp.repository.MasterRepository;
import spp.repository.ProjectRepository;
import spp.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private MasterRepository masterRepository;
	
	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public String studentRegistration(Student student) 
	{
		studentRepository.save(student);
		return "Student Registered Successfully...";
	}

	@Override
	public Student checkStudentLogin(String email, String password) 
	{
		return studentRepository.checkStudentLogin(email, password);
	}

	@Override
	public String updateStudent(Student student)
	{
		Student s = studentRepository.findById(student.getId()).get();
		
		s.setContact(student.getContact());
		s.setDateofbirth(student.getDateofbirth());
		s.setGender(student.getGender());
		s.setLocation(student.getLocation());
		s.setName(student.getName());
		s.setPassword(student.getPassword());
		s.setProfileImage(student.getProfileImage());
		
		studentRepository.save(s);
		
		return "Student update successfull";
	}

//	@Override
//	public void assignStudentToMaster(int studentId, int masterId) 
//	{
//		Student student = studentRepository.findById(studentId).orElse(null);
//        Master master = masterRepository.findById(masterId).orElse(null);
//
//        if (student != null && master != null) {
//            // Assign the student to the selected master
//            student.setMaster(master);
//            studentRepository.save(student); // Save the updated student
//        } else {
//            throw new IllegalArgumentException("Invalid student or master ID");
//        }
//    }

	@Override
	public List<Student> getAllStudents() 
	{
		 return studentRepository.findAll();
	}

	@Override
	public Student getStudentById(int studentId) 
	{
	 return studentRepository.findById(studentId).orElse(null);
		
	}

	@Override
	public void saveStudent(Student student) 
	{
		studentRepository.save(student);
	}

	

	
	}