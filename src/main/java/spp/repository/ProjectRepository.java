package spp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import spp.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer> 
{
	
	
}
