package spp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import spp.model.Education;

@Repository
public interface EducationRepository extends JpaRepository <Education, Integer>
{

	List<Education> findByStudentId(int studentId); // Fetch education by student ID
	
	
}
