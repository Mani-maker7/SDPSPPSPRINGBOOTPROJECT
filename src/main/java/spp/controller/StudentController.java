package spp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import spp.model.Education;
import spp.model.Project;
import spp.model.Skill;
import spp.model.Student;
import spp.repository.EducationRepository;
import spp.repository.MasterRepository;
import spp.repository.ProjectRepository;
import spp.repository.StudentRepository;
import spp.service.EducationService;
import spp.service.ProjectService;
import spp.service.SkillService;
import spp.service.StudentService;


import java.sql.Blob;
import java.util.List;


@Controller
public class StudentController
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private MasterRepository masterRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
    private ProjectService projectService;
	
	@Autowired
    private EducationService educationService;
	
	@Autowired
    private SkillService skillService;
	
	@GetMapping("/")
	public ModelAndView home() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("studentreg")
	public ModelAndView studentreg() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("studentreg");
		return mv;
	}
	
	@GetMapping("studenthome")
	public ModelAndView studenthome() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("studentprofile")
	public ModelAndView studentprofile(HttpSession session) 
	{
		ModelAndView mv = new ModelAndView(); 
		
		 Student student = (Student) session.getAttribute("student");

		    // Fetch available projects
		   List<Project> projects = projectRepository.findAll();
		    List<Skill> skills = skillService.getSkillsByStudentId(student.getId());
		    List <Education> education=educationService.getEducationByStudentId(student.getId());


		    mv.addObject("student", student);
		    mv.addObject("projects", projects);
		    mv.addObject("skills", skills);  // Add skills here
            mv.addObject("education", education);
		
		mv.setViewName("studentprofile");
		return mv;
	}
	
	@GetMapping("studentlogin")
	public ModelAndView studentlogin() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("studentlogin");
		return mv;
	}
	
	
	
	@PostMapping("insertstudent")
	public ModelAndView insertstudent(HttpServletRequest request) 
	{
		String name = request.getParameter("sname");
		String gender = request.getParameter("sgender");
		String dob = request.getParameter("sdob");
		String email = request.getParameter("semail");
		String location = request.getParameter("slocation");
		String contact = request.getParameter("scontact");
		String password = request.getParameter("spwd");
		
		Student student = new Student();
		student.setName(name);
		student.setGender(gender);
		student.setDateofbirth(dob);
		student.setEmail(email);
		student.setLocation(location);
		student.setContact(contact);
		student.setPassword(password);
		
		String message = studentService.studentRegistration(student);
		
		request.setAttribute("successMessage", "Student Registered Successfully...");
	    
	    // Create ModelAndView to return the view and model
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("studentreg");
	    mv.addObject("message", message);  // Add any additional messages if needed
		return mv;
	}
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String semail = request.getParameter("semail");
		String spwd = request.getParameter("spwd");
		
		Student student = studentService.checkStudentLogin(semail, spwd);
		
		if(student!=null)
		{
			
			
	        
			HttpSession session = request.getSession();
			
			session.setAttribute("student", student);
			
			mv.setViewName("studenthome");
		}
		else
		{
            mv.setViewName("studentlogin");
            mv.addObject("message", "Login fail");
		}
		return mv;
	}
	
	@GetMapping("updateprofile")
	public ModelAndView updateprofile(HttpSession session)
	{
		ModelAndView mv = new ModelAndView("updateprofile");
		
		// Retrieve student from session
        Student student = (Student) session.getAttribute("student");
        mv.addObject("student", student);
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(HttpServletRequest request,@RequestParam("studentprofileimage") MultipartFile file) throws Exception
	{
		ModelAndView mv = new ModelAndView("updateprofile");
		
		
		int id = Integer.parseInt(request.getParameter("sid"));
		String name = request.getParameter("sname");
		String gender = request.getParameter("sgender");
		String dob = request.getParameter("sdob");
		String location = request.getParameter("slocation");
		String contact = request.getParameter("scontact");
		String password = request.getParameter("spwd");
		
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		
		Student student = new Student();
		student.setId(id);
		student.setName(name);
		student.setGender(gender);
		student.setDateofbirth(dob);
		student.setLocation(location);
		student.setContact(contact);
		student.setPassword(password);
		student.setProfileImage(blob);
		
		
		
		mv.setViewName("studentprofile");
		
		studentService.updateStudent(student);
		
		Student st=studentService.getStudentById(id);
		
		HttpSession session=request.getSession();
		session.setAttribute("student", st);
		
		return mv;
	}
	
	
	@GetMapping("displayprofileimage")
	  public ResponseEntity<byte[]> displayprofileimage(@RequestParam("id") int id) throws Exception
	{
		Student student = studentService.getStudentById(id);
		System.out.print(student.getId());
		byte[] imageBytes = null;
		imageBytes = student.getProfileImage().getBytes(1, (int) student.getProfileImage().length());
		
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	  
	  @GetMapping("studentselectproject")
	  public ModelAndView studentSelectProject(HttpSession session) {
	      ModelAndView mv = new ModelAndView();
	      List<Project> projects = projectRepository.findAll();
	      mv.addObject("projects", projects);
	      mv.setViewName("studentselectproject");
	      return mv;
	  }

	  
	  @PostMapping("selectproject")
	  public String selectProject(HttpServletRequest request, HttpSession session) {
	      // Retrieve the student from the session
	      Student student = (Student) session.getAttribute("student");

	      // Get the project ID(s) from the form (supporting multiple selection)
	      String[] projectIds = request.getParameterValues("projectId");

	      if (projectIds != null) {
	          // Check if the student already has 2 projects
	          if (student.getProjects().size() >= 2) {
	              // You can handle this by adding a flash message or redirecting with an error
	              request.setAttribute("error", "You can only select up to 2 projects.");
	              return "redirect:/studentprofile"; // Redirect to the student profile with an error message
	          }

	          for (String projectId : projectIds) {
	              Project project = projectRepository.findById(Integer.parseInt(projectId)).orElse(null);
	              if (project != null && !student.getProjects().contains(project)) {
	                  student.getProjects().add(project);
	                  // If two projects have already been added, stop the loop
	                  if (student.getProjects().size() == 2) {
	                      break;
	                  }
	              }
	          }

	          // Save the updated student with associated projects
	          studentRepository.save(student);
	      }

	      return "redirect:/studentprofile";
	  }
	  
	  @GetMapping("viewSelectedProjects")
	  public ModelAndView viewSelectedProjects(HttpSession session) {
	      ModelAndView mv = new ModelAndView("uploadprojects");

	      // Retrieve the student from the session
	      Student student = (Student) session.getAttribute("student");

	      // Add the student's selected projects to the ModelAndView
	      mv.addObject("student", student);

	      return mv;
	  }
	  
	  @PostMapping("/uploadProjectFile")
	  public ModelAndView uploadProjectFile(HttpServletRequest request,
	                                        @RequestParam("githubLink") String githubLink,
	                                        @RequestParam("projectLink") String projectLink,
	                                        @RequestParam("projectTitle") String projectTitle,
	                                        @RequestParam("projectId") int projectId,
	                                        HttpSession session) {
	      ModelAndView mv = new ModelAndView("uploadprojects");

	      // Validate inputs
	      if (projectTitle == null || projectTitle.trim().isEmpty()) {
	          mv.addObject("error", "Project title is required.");
	          return mv;
	      }

	      if (projectLink == null || projectLink.trim().isEmpty() || !projectLink.startsWith("http")) {
	          mv.addObject("error", "A valid project link is required.");
	          return mv;
	      }

	      if (githubLink == null || githubLink.trim().isEmpty() || !githubLink.startsWith("http") || !githubLink.contains("github.com")) {
	          mv.addObject("error", "A valid GitHub repository link is required.");
	          return mv;
	      }

	      try {
	          // Retrieve the student from the session
	          Student student = (Student) session.getAttribute("student");
	          if (student == null) {
	              mv.addObject("error", "No student session found. Please log in again.");
	              return mv;
	          }

	          // Retrieve the project by ID
	          Project project = projectService.getProjectById(projectId);
	          if (project == null) {
	              mv.addObject("error", "Project not found.");
	              return mv;
	          }

	          // Update the project details
	          project.setTitle(projectTitle);
	          project.setProjectLink(projectLink);
	          project.setGithubLink(githubLink);

	          // Save the project using the service
	          projectService.saveProject(project);

	          mv.addObject("message", "Project details updated successfully.");
	      } catch (Exception e) {
	          mv.addObject("error", "Failed to update project details: " + e.getMessage());
	      }

	      return mv;
	  }


	  
//	  @GetMapping("/downloadProjectFile")
//	  public ResponseEntity<byte[]> downloadProjectFile(@RequestParam("projectId") int projectId) throws Exception {
//	      Project project = projectRepository.findById(projectId).orElse(null);
//	      if (project == null || project.getUploadedFile() == null) {
//	          return ResponseEntity.badRequest().body(null);
//	      }
//
//	      byte[] fileBytes = project.getUploadedFile().getBytes(1, (int) project.getUploadedFile().length());
//	      return ResponseEntity.ok()
//	              .header("Content-Disposition", "attachment; filename=project_file")
//	              .body(fileBytes);
//	  }
//
	  
	  @GetMapping("addEducationForm")
	    public ModelAndView addEducationForm(HttpSession session) {
	        ModelAndView mv = new ModelAndView();
	        
	        // Get student from session
	        Student student = (Student) session.getAttribute("student");
	        mv.addObject("student", student);

	        // Set the view name for the education form page
	        mv.setViewName("addEducation");
	        return mv;
	    }

	  @PostMapping("addEducation")
	  public ModelAndView addEducation(HttpSession session, @RequestParam String institution, 
	                                    @RequestParam String department, @RequestParam String programDegree, 
	                                    @RequestParam String branch, @RequestParam String currentSemester,
	                                    @RequestParam String rollNo, @RequestParam String cgpa) {
	      ModelAndView mv = new ModelAndView();
	      
	      // Get student from session
	      Student student = (Student) session.getAttribute("student");
	      
	      // Create a new Education object and set its properties
	      Education education = new Education();
	      education.setInstitution(institution);
	      education.setDepartment(department);
	      education.setProgramDegree(programDegree);
	      education.setBranch(branch);
	      education.setCurrentSemester(currentSemester);
	      education.setRollNo(rollNo);
	      education.setCgpa(cgpa);

	      // Call the service to save the education
	      String message = educationService.addEducation(education, student.getId());
	      
	      // Add the success or failure message to the view
	      mv.addObject("message", message);

	      // Fetch updated education list
	      List<Education> educationList = educationService.getEducationByStudentId(student.getId());
	      
	      // Add education list to the model
	      mv.addObject("educationList", educationList);
	      
	      // Set the view name to show the student profile
	      mv.setViewName("studentprofile");
	      return mv;
	  }


	  @GetMapping("viewEducation")
	  public ModelAndView viewEducation(HttpSession session) {
	      ModelAndView mv = new ModelAndView();
	      
	      // Get student from session
	      Student student = (Student) session.getAttribute("student");

	      // Get the education records for the student
	      List<Education> educationList = educationService.getEducationByStudentId(student.getId());
	      
	      // Add the education list to the model
	      mv.addObject("educationList", educationList);

	      // Set the view name to display the education in the student profile
	      mv.setViewName("studentprofile");
	      return mv;
	  }
	  
	// Controller method to display the edit form
	  @GetMapping("editEducation")
	  public ModelAndView editEducation(@RequestParam("id") int educationId) {
	      ModelAndView mv = new ModelAndView();

	      // Fetch the education record by ID
	      Education education = educationService.getEducationByStudentId(educationId).stream()
	          .filter(e -> e.getId() == educationId)
	          .findFirst()
	          .orElse(null);

	      if (education != null) {
	          mv.addObject("education", education);
	          mv.setViewName("editEducation"); 
	      } else {
	          mv.addObject("message", "Education record not found.");
	          mv.setViewName("studentprofile");
	      }
	      return mv;
	  }

	  // Controller method to save updated education details
	  @PostMapping("updateEducation")
	  public ModelAndView updateEducation(HttpServletRequest request) {
	      ModelAndView mv = new ModelAndView();
	      
	      int educationId = Integer.parseInt(request.getParameter("educationId"));
	      String institution = request.getParameter("institution");
	      String department = request.getParameter("department");
	      String programDegree = request.getParameter("programDegree");
	      String branch = request.getParameter("branch");
	      String currentSemester = request.getParameter("currentSemester");
	      String rollNo = request.getParameter("rollNo");
	      String cgpa = request.getParameter("cgpa");

	      // Create and update the education record
	      Education education = new Education();
	      education.setId(educationId);
	      education.setInstitution(institution);
	      education.setDepartment(department);
	      education.setProgramDegree(programDegree);
	      education.setBranch(branch);
	      education.setCurrentSemester(currentSemester);
	      education.setRollNo(rollNo);
	      education.setCgpa(cgpa);

	      String message = educationService.updateEducation(education); // Update the education record

	      mv.addObject("message", message);

	      // Fetch updated education list and redirect to student profile page
	      List<Education> educationList = educationService.getEducationByStudentId(education.getStudent().getId());
	      mv.addObject("educationList", educationList);
	      mv.setViewName("studentprofile");

	      return mv;
	  }

	  
	  @PostMapping("/addSkill")
	  public String addSkill(@RequestParam String skillName, @RequestParam String proficiency, HttpSession session) {
	      Student student = (Student) session.getAttribute("student");
	      Skill skill = new Skill(skillName, proficiency, student);
	      skillService.addSkill(skill);
	      return "redirect:/studentprofile";
	  }
	  



	 

	 
	@GetMapping("studentlogout")
	public ModelAndView studentlogout() 
	{
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("login");
		return mv;
	}

}
