package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Admin;
import spp.model.Master;
import spp.model.Project;
import spp.model.Student;
import spp.repository.AdminRepository;
import spp.repository.MasterRepository;
import spp.repository.ProjectRepository;
import spp.repository.StudentRepository;
import org.springframework.jdbc.core.JdbcTemplate;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private MasterRepository masterRepository;
	
	 @Autowired
	  private ProjectRepository projectRepository;

	@Override
	public List<Student> viewallStudents() 
	{
		return studentRepository.findAll();
	}

	@Override
	public Admin checkAdminLogin(String aemail, String pwd) 
	{
		return adminRepository.checkAdminLogin(aemail, pwd);
	}

	@Override
	public long studentcount() 
	{
		return studentRepository.count();
	}

	@Override
	public String deletestudents(int id)
	{
		studentRepository.deleteById(id);
		return "Student deleted successfully";
	}

//	@Override
//	public Student displayStudentById(int id) 
//	{
//		return studentRepository.findById(id).get(); 
//	}

	@Override
	public String deletemasters(int id) 
	{
		masterRepository.deleteById(id);
		return "Master deleted successfully";
	}

	@Override
	public List<Master> viewallMasters() 
	{
		return masterRepository.findAll();
	}

	@Override
	public void updateProject(Project project) 
	{
		projectRepository.save(project);
		
	}

	@Override
	public void deleteProject(int projectId) {
        // Step 1: Remove associations in the student_project table if necessary
        // You can either manually remove the associations or handle them at the database level (cascade delete)

        // Example of manual association cleanup if using JDBC:
        String deleteAssociationsSql = "DELETE FROM student_project WHERE project_id = ?";
        jdbcTemplate.update(deleteAssociationsSql, projectId);

        // Step 2: Now delete the project itself from the project table
        projectRepository.deleteById(projectId); // Delete the project by its ID
    }


	
	
}
