package spp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import spp.model.Admin;
import spp.model.Master;
import spp.model.Project;
import spp.model.Student;
import spp.service.AdminService;
import spp.service.MasterService;
import spp.service.ProjectService;
import spp.service.StudentService;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MasterService masterService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
    private ProjectService projectService;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("adminlogin");
		return mv;
	}
	
	
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("adminhome");
		
		   long count = adminService.studentcount();
		   
		   mv.addObject("count",count);
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String uaemail = request.getParameter("uaemail");
		String upwd = request.getParameter("upwd");
		
		Admin admin = adminService.checkAdminLogin(uaemail, upwd);
		
		if(admin!=null)
		{
			mv.setViewName("adminhome");
			
 
		}
		else
		{
            mv.setViewName("adminloginfail");
            mv.addObject("message", "Login fail");
		}
		return mv;
	}
	
	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallstudents");
		
		   long count = adminService.studentcount();
		   mv.addObject("count",count);
		
		List<Student> students=adminService.viewallStudents();
		mv.addObject("studentlist", students);
		
		return mv; 
	}
	
	@GetMapping("deletestudents")
	public ModelAndView deletestudents()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletestudents");
		
		List<Student> students=adminService.viewallStudents();
		mv.addObject("studentlist", students);
		
		return mv; 
	}
	
	@GetMapping("delete")
	public String   delete(@RequestParam int id) 
	{
		adminService.deletestudents(id); 
		return "redirect:/deletestudents";
	}
	
//	@GetMapping("viewstudentbyid")
//	public ModelAndView viewstudentbyid() 
//	{
//		ModelAndView mv = new ModelAndView();
//		
//		List<Student> students=adminService.viewallStudents();
//		mv.addObject("studentlist", students);
//		 
//		mv.setViewName("viewstudentbyid");
//		return mv;
//	}
	
//	@PostMapping("displaystudent")
//	public ModelAndView displaystudent(HttpServletRequest request) 
//	{
//		 int id = Integer.parseInt(request.getParameter("id"));
//		 
//		Student student = adminService.displayStudentById(id);
//		
//		ModelAndView mv = new ModelAndView("displaystudent");
//		mv.addObject("s", student);
//		
//		return mv;
//	}
	
	//Master
	
	@GetMapping("addnewmaster")
    public String showAddNewMasterPage() {
        return "addnewmaster";
    }
	
	@PostMapping("addnewmaster")
    public String addnewmaster(
        @RequestParam String name,
        @RequestParam String gender,
        @RequestParam String dateofbirth,
        @RequestParam String email,
        @RequestParam String password,
        @RequestParam String location,
        @RequestParam String contact,
        @RequestParam String expertise,
        @RequestParam String role,
        @RequestParam String joiningDate,
        @RequestParam int age,
        Model model) {

        Master master = new Master();
        master.setName(name);
        master.setGender(gender);
        master.setDateofbirth(dateofbirth);
        master.setEmail(email);
        master.setPassword(password);
        master.setLocation(location);
        master.setContact(contact);
        master.setExpertise(expertise);
        master.setRole(role);
        master.setJoiningDate(joiningDate);
        master.setAge(age);

        // Call the service to add the new master
        String result = masterService.addnewmaster(master);
        model.addAttribute("message", result);
        return "addnewmaster";  // Return the page with a success or failure message
    }
	
	@GetMapping("viewallmasters")
	public ModelAndView viewallmasters()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewallmasters");
		
		List<Master> masters=adminService.viewallMasters();
		mv.addObject("masterlist", masters);
		
		return mv; 
	}
	
	@GetMapping("deletemasters")
	public ModelAndView deletemasters()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletemasters");
		
		List<Master> masters=adminService.viewallMasters();
		mv.addObject("masterlist", masters);
		
		return mv; 
	}
	
	@GetMapping("deletem")
	public String   deletem(@RequestParam int id) 
	{
		adminService.deletemasters(id); 
		return "redirect:/deletemasters";
	}
	
	
	 @GetMapping("studentlist")
	    public String getStudentList(Model model) {
	        // Get all students from the service
	        List<Student> students = studentService.getAllStudents();
	        
	        // Add the list of students to the model
	        model.addAttribute("studentList", students);

	        // Return the view name
	        return "studentlist";
	    }

	    // Method to assign a master to a student
	    @GetMapping("assignmaster")
	    public String assignMasterPage(@RequestParam("id") int studentId, Model model) {
	        // Retrieve student and list of all masters
	        Student student = studentService.getStudentById(studentId);
	        List<Master> masters = masterService.getAllMasters();
	        
	        // Add student and masters list to the model
	        model.addAttribute("student", student);
	        model.addAttribute("masters", masters);
	        
	        // Return the view to display the master assignment page
	        return "assignmaster";
	    }
	    
	    @PostMapping("/savemasterassignment")
	    public String saveMasterAssignment(@RequestParam int studentId, @RequestParam int masterId) {
	        // Retrieve the student and master from the database
	        Student student = studentService.getStudentById(studentId);
	        Master master = masterService.getMasterById(masterId);

	        // Assign the selected master to the student
	        student.setMaster(master);

	        // Save the updated student back to the database
	        studentService.saveStudent(student);

	        // Redirect to the student list page
	        return "redirect:/studentlist";
	    }
	    
	    @GetMapping("removemaster")
	    public String removeMaster(@RequestParam int id) {
	        // Get the student by ID
	        Student student = studentService.getStudentById(id);

	        // Remove the master assignment (set the master to null)
	        student.setMaster(null);

	        // Save the updated student
	        studentService.saveStudent(student);

	        // Redirect back to the student list page
	        return "redirect:/studentlist";
	    }
	    
	    //Project
	    
	    @GetMapping("addproject")
	    public String showAddProjectForm() 
	    {
	        return "addproject"; // The view for adding a project
	    }
	    
	    @PostMapping("saveproject")
	    public String saveProject(@ModelAttribute Project project, Model model) 
	    {
	        projectService.saveProject(project);
	        model.addAttribute("message", "Project added successfully!");
	        return "redirect:projects";
	    }
	    
	    @GetMapping("projects")
	    public String viewProjects(Model model) {
	        // Fetch all projects from the database
	        List<Project> projects = projectService.getAllProjects();

	        // Add the project list to the model
	        model.addAttribute("projects", projects);

	        // Return the view name to render the list of projects
	        return "projects"; // This refers to projects.jsp or projects.html
	    }
	    
	    
	    @GetMapping("editproject")
	    public String showEditForm(@RequestParam("id") int id, Model model) {
	        Project project = projectService.getProjectById(id);
	        model.addAttribute("project", project);
	        return "editproject"; // JSP file for editing the project
	    }

	    // Save Updated Project
	    @PostMapping("editproject")
	    public String updateProject(@ModelAttribute Project project) {
	    	adminService.updateProject(project);
	        return "redirect:projects?message=Project updated successfully!";
	    }

	    // Delete Project
	    @GetMapping("deleteproject")
	    public String deleteProject(@RequestParam int id) {
	    	adminService.deleteProject(id);
	        return "redirect:projects?message=Project deleted successfully!";
	    }



}
