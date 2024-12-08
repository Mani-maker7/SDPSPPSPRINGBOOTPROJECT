package spp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import spp.model.Admin;
import spp.model.Master;
import spp.model.Student;
import spp.service.AdminService;
import spp.service.MasterService;
import spp.service.StudentService;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MasterService masterService;

    @Autowired
    private StudentService studentService;

    @PostMapping("/checklogin")
    public ModelAndView checkLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if the login is for Admin, Master, or Student based on the email and password
        Admin admin = adminService.checkAdminLogin(email, password);
        if (admin != null) {
            // If admin login is successful, redirect to admin home
            mv.setView(new RedirectView("adminhome"));
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);  // Storing admin in session
            return mv;
        }

        Master master = masterService.checkMasterLogin(email, password);
        if (master != null) {
            // If master login is successful, redirect to master home
            mv.setView(new RedirectView("masterhome"));
            HttpSession session = request.getSession();
            session.setAttribute("master", master);  // Storing master in session
            return mv;
        }

        Student student = studentService.checkStudentLogin(email, password);
        if (student != null) {
            // If student login is successful, redirect to student home
            mv.setView(new RedirectView("studenthome"));
            HttpSession session = request.getSession();
            session.setAttribute("student", student);  // Storing student in session
            return mv;
        }

        // If no valid login found, show login failure message
        mv.setViewName("login");
        mv.addObject("message", "Login failed: Invalid email or password");
        return mv;
    }
}
