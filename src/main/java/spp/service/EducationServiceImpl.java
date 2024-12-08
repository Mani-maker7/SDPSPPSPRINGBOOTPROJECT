package spp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spp.model.Education;
import spp.model.Student;
import spp.repository.EducationRepository;
import spp.repository.StudentRepository;

@Service
public class EducationServiceImpl implements EducationService
{
	@Autowired
    private EducationRepository educationRepository;
	
	@Autowired
    private StudentRepository studentRepository;


	@Override
	public void save(Education education) 
	{
		educationRepository.save(education);
	}

	@Override
    public String addEducation(Education education, int studentId) {
        // Find the student by id
        Student student = studentRepository.findById(studentId).orElse(null);
        if (student == null) {
            return "Student not found.";
        }

        // Set the student to the education object
        education.setStudent(student);

        // Save the education
        educationRepository.save(education);
        return "Education added successfully!";
    }

	@Override
    public List<Education> getEducationByStudentId(int studentId) {
        // Fetch the education records for a student
        return educationRepository.findByStudentId(studentId);
    }
	
	@Override
    public String updateEducation(Education education) {
        // Check if the education record exists
        Education existingEducation = educationRepository.findById(education.getId()).orElse(null);
        if (existingEducation != null) {
            // Update education details
            existingEducation.setInstitution(education.getInstitution());
            existingEducation.setDepartment(education.getDepartment());
            existingEducation.setProgramDegree(education.getProgramDegree());
            existingEducation.setBranch(education.getBranch());
            existingEducation.setCurrentSemester(education.getCurrentSemester());
            existingEducation.setRollNo(education.getRollNo());
            existingEducation.setCgpa(education.getCgpa());
            // Save the updated record
            educationRepository.save(existingEducation);
            return "Education details updated successfully.";
        } else {
            return "Education record not found.";
        }
    }
}
