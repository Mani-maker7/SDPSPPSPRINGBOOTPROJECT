package spp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import spp.model.Master;
import spp.model.Student;


@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("select c from Student c where c.email=?1 and c.password=?2 ")
	public  Student checkStudentLogin(String email,String password);
	
	@Query("select s from Student s where s.master = ?1")
    List<Student> findByMaster(Master master);
	
	Student findByEmail(String email); 
}
