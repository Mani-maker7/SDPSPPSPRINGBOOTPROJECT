package spp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import spp.model.Master;
import spp.model.Project;
import spp.model.Student;
import spp.service.MasterService;
import spp.service.ProjectService;
import spp.service.StudentService;

@Controller
public class MasterController 
{
	@Autowired
	private MasterService masterService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private StudentService studentService;
	
	
	@GetMapping("masterhome")
	public ModelAndView masterhome() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("masterhome");
		return mv;
	}
	
	@GetMapping("masterlogin")
	public ModelAndView masterlogin() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("masterlogin");
		return mv;
	}
	
	@GetMapping("masterprofile")
	public ModelAndView masterprofile() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("masterprofile");
		return mv;
	}
	
	@PostMapping("checkmasterlogin")
	public ModelAndView checkmasterlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String memail = request.getParameter("memail");
		String mpwd = request.getParameter("mpwd");
		
		Master master = masterService.checkMasterLogin(memail, mpwd);
		
		if(master!=null)
		{
			HttpSession session = request.getSession();
			
			session.setAttribute("master", master);
			
			mv.setViewName("masterhome");
		}
		else
		{
            mv.setViewName("masterlogin");
            mv.addObject("message", "Login fail. Please check your credentials.");
		}
		return mv;
	}
	
	@GetMapping("/assignedstudents")
	public String viewAssignedStudents(@RequestParam("id") Integer masterId, Model model) 
	{
	    Master master = masterService.findById(masterId); // Get the master by ID
	    
	    List<Student> assignedStudents = masterService.getAssignedStudents(masterId); // Get assigned students

	    model.addAttribute("master", master);
	    model.addAttribute("assignedStudents", assignedStudents);

	    return "assignedstudents"; // Return the JSP page
	}
	
	@GetMapping("/viewProjectSubmission")
	public ModelAndView viewProjectSubmission(@RequestParam("id") Integer studentId) {
	    ModelAndView mv = new ModelAndView();

	    // Fetch the student by ID
	    Student student = studentService.getStudentById(studentId);
	    
	    // Fetch the projects associated with the student
	    List<Project> projects = student.getProjects();

	    mv.addObject("student", student);
	    mv.addObject("projects", projects);
	    mv.setViewName("viewProjectSubmission"); // Create a new JSP page for viewing the submission

	    return mv;
	}
	
	@PostMapping("/gradeProject")
	public ModelAndView gradeProject(@RequestParam("projectId") Integer projectId,
	                                 @RequestParam("grade") Integer grade
	                                 ) {
	    ModelAndView mv = new ModelAndView();

	    // Fetch the project by ID
	    Project project = projectService.getProjectById(projectId);

	    if (project != null) {
	        // Update grade and feedback
	        project.setGrade(grade);

	        // Save the updated project
	        projectService.saveProject(project);

	        mv.addObject("message", "Grade submitted successfully.");
	    } else {
	        mv.addObject("message", "Project not found.");
	    }

	    mv.setViewName("viewProjectSubmission"); // Redirect back to the project submission page
	    return mv;
	}


	

}
