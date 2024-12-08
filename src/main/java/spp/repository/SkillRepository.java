package spp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import spp.model.Skill;

@Repository
public interface SkillRepository extends JpaRepository<Skill, Integer> 
{
	List<Skill> findByStudentId(int studentId);
}
